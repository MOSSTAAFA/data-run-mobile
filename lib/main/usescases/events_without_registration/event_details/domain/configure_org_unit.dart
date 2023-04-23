import 'package:d2_remote/modules/data/tracker/entities/event.entity.dart';
import 'package:d2_remote/modules/metadata/organisation_unit/entities/organisation_unit.entity.dart';
import 'package:dartx/dartx_io.dart' as dx;

import '../../../../../commons/data/event_creation_type.dart';
import '../../../../../commons/date/date_utils.dart';
import '../../../../../commons/extensions/standard_extensions.dart';
import '../../../../../commons/prefs/preference.dart';
import '../../../../../commons/prefs/preference_provider.dart';
import '../data/event_details_repository.dart';
import '../models/event_org_unit.dart';

class ConfigureOrgUnit {
  const ConfigureOrgUnit(
      {required EventCreationType creationType,
      required EventDetailsRepository repository,
      required PreferenceProvider preferencesProvider,
      required String programUid,
      String? initialOrgUnitUid})
      : _creationType = creationType,
        _repository = repository,
        _preferencesProvider = preferencesProvider,
        _programUid = programUid,
        _initialOrgUnitUid = initialOrgUnitUid;

  final EventCreationType _creationType;
  final EventDetailsRepository _repository;
  final PreferenceProvider _preferencesProvider;
  final String _programUid;
  final String? _initialOrgUnitUid;

  Future<EventOrgUnit> call(
      DateTime? selectedDate, String? selectedOrgUnit) async {
    return EventOrgUnit(
        visible: _isVisible(),
        enable: await _isEnable(),
        fixed: await _isFixed(),
        selectedOrgUnit:
            await _getSelectedOrgUnit(selectedDate, selectedOrgUnit),
        orgUnits: await _getOrgUnitsByProgramId(),
        programUid: _programUid);
  }

  Future<bool> _isEnable() async {
    if (await _repository.getEvent() != null) {
      return false;
    }

    final bool canWrite = await _repository.hasAccessDataWrite();
    final bool isEnrollmentOpen = await _repository.isEnrollmentOpen();
    if (!canWrite || !isEnrollmentOpen) {
      return false;
    }

    return true;
  }

  bool _isVisible() {
    return _creationType != EventCreationType.SCHEDULE;
  }

  Future<bool> _isFixed() async {
    return _creationType == EventCreationType.SCHEDULE ||
        await _repository.getEvent() != null;
  }

  Future<OrganisationUnit?> _getSelectedOrgUnit(
      DateTime? selectedDate, String? selectedOrgUnit) async {
    final OrganisationUnit? orgUnit = await selectedDate?.aLet(
            (DateTime date) async =>
                await _getOrgUnitBySelectedDate(date) ??
                await _getStoredOrgUnit(selectedOrgUnit)) ??
        await _getStoredOrgUnit(selectedOrgUnit) ??
        await _getOrgUnitIfOnlyOne();

    orgUnit?.let((OrganisationUnit it) => _setCurrentOrgUnit(it.id!));

    return orgUnit;
  }

  Future<OrganisationUnit?> _getOrgUnitBySelectedDate(
      DateTime selectedDate) async {
    final String dateDBFormat =
        DateUtils.databaseDateFormat().format(selectedDate);
    final List<OrganisationUnit> orgUnits =
        await _repository.getFilteredOrgUnits(dateDBFormat, null);

    final OrganisationUnit? orgUnit = _getCurrentOrgUnit()?.let(
        (String currentOrgUnitUid) => orgUnits.firstOrNullWhere(
            (OrganisationUnit it) => it.id == currentOrgUnitUid));
    if (orgUnit != null) {
      return orgUnit;
    }

    if (orgUnits.length == 1) {
      switch (_creationType) {
        case EventCreationType.ADDNEW:
        case EventCreationType.DEFAULT:
          return orgUnits.firstOrNull;
        default:
      }
    }
    return null;
  }

  String? _getCurrentOrgUnit() {
    if (_preferencesProvider.contains([CURRENT_ORG_UNIT])) {
      return _preferencesProvider.getString(CURRENT_ORG_UNIT);
    } else {
      return null;
    }
  }

  Future<OrganisationUnit?> _getStoredOrgUnit(String? selectedOrgUnit) async {
    if (!selectedOrgUnit.isNullOrEmpty) {
      return _repository.getOrganisationUnit(selectedOrgUnit!);
    }

    final OrganisationUnit? orgUnit =
        await (await _repository.getEvent())?.aLet((Event event) async {
      if (event.orgUnit != null) {
        return _repository.getOrganisationUnit(event.orgUnit);
      }
      return null;
    });
    // final OrganisationUnit? orgUnit =
    //     await _repository.getEvent().aaLet((Event? event) {
    //   if (event?.orgUnit != null) {
    //     return _repository.getOrganisationUnit(event!.orgUnit);
    //   }
    //   return null;
    // });

    if (orgUnit != null) {
      return orgUnit;
    }

    final String? currentOrgUnit = _getCurrentOrgUnit() ?? _initialOrgUnitUid;

    return await currentOrgUnit
        ?.aLet((String it) async => _repository.getOrganisationUnit(it));
  }

  Future<List<OrganisationUnit>> _getOrgUnitsByProgramId() async {
    return _repository.getOrganisationUnits();
  }

  Future<OrganisationUnit?> _getOrgUnitIfOnlyOne() async =>
      (await _getOrgUnitsByProgramId())
          .takeIf((List<OrganisationUnit> it) => it.length == 1)
          ?.firstOrNull;

  Future<bool> _setCurrentOrgUnit(String organisationUnitUid) {
    return _preferencesProvider.setValue(CURRENT_ORG_UNIT, organisationUnitUid);
  }
}
