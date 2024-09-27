import 'package:d2_remote/modules/auth/user/entities/d_user.entity.dart';
import 'package:d2_remote/modules/datarun/form/entities/form_definition.entity.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:mass_pro/data_run/screens/form/model/device_info_service.dart';
import 'package:mass_pro/data_run/screens/form/model/form_metadata.dart';
import 'package:uuid/uuid.dart';

class FormAttributeService {
  FormAttributeService(
      {required FormTemplateV template,
        AndroidDeviceInfo? deviceInfo,
        required this.loggedInUser,
        required this.formMetadata,
        required this.orgUnit})
      : _template = template,
        _uuid = Uuid().v4(),
        _deviceInfoService = AndroidDeviceInfoService(deviceInfo: deviceInfo);

  final FormMetadata formMetadata;
  final DUser loggedInUser;
  final String? orgUnit;
  final String _uuid;
  final AndroidDeviceInfoService _deviceInfoService;
  final FormTemplateV _template;

}