// Dart imports:
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// Package imports:
import 'package:flutter_gen/gen_l10n/app_localization.dart';

import '../../commons/constants.dart';
import '../../utils/mass_utils/strings.dart';

class AppLocalization {
  // final Locale locale;

  // AppLocalization(this.locale) : super(locale.languageCode);
  AppLocalization();

  static const LocalizationsDelegate<AppLocalization> delegate =
      _AppLocalizationsDelegate();

  // Helper method to keep the code in the widgets concise
  // Localizations are accessed using an InheritedWidget "of" syntax
  static AppLocalization? of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  Map<String, String>? _localizedStrings;

  Map<String, String>? _defaultLocalizedStrings;

  AppLocalizations? localized;

  static Locale createLocale(String locale) {
    locale = locale.replaceAll('-', '_');
    if (!kLanguages.contains(locale)) {
      return const Locale('en');
    }
    final parts = locale.split('_');
    // return Locale(parts[0], parts.length > 1 ? parts[1] : null);
    return Locale(parts[0]);
  }

  Future<bool> load(Locale locale) async {
    // default language to fall back to in case the strings does not exist
    localized = lookupAppLocalizations(locale);

    String defaultJsonString =
        await rootBundle.loadString('lib/main/l10n/locales_strings/app_en.arb');
    Map<String, dynamic> defaultJsonMap = json.decode(defaultJsonString);

    _defaultLocalizedStrings = defaultJsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    // Load the language JSON file from the "strings" folder
    String jsonString = await rootBundle.loadString(
        'lib/main/l10n/locales_strings/app_${locale.languageCode}.arb');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }

  /// This method will be called from every widget
  /// which needs a localized text
  String lookup(String? key) {
    // final lookupKey = toSnakeCase(key);
    if ((key ?? '').isEmpty) {
      return '';
    }

    final lookupKey = toCamelCase(key!.toLowerCase());

    if (lookupKey.startsWith('_')) {
      return key;
    }

    if (_localizedStrings == null) {
      print('## ERROR: NMCP _localizedStrings not initialized');
      return key;
    }

    final value = _localizedStrings![lookupKey] ??
        _localizedStrings![lookupKey.replaceFirst('_id', '')] ??
        '';

    if (value.isEmpty) {
      print('## ERROR: localization key not found - $key');

      final defaultValue = _defaultLocalizedStrings![lookupKey] ?? '';

      return defaultValue.isEmpty ? key : defaultValue;
    }

    return value;
  }
}

// LocalizationsDelegate is a factory for a set of localized resources
// In this case, the localized strings will be gotten in an AppLocalizations object
class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalization> {
  // This delegate instance will never change (it doesn't even have fields!)
  // It can provide a constant constructor.
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    // Include all of your supported language codes here
    // return ['en', 'sk'].contains(locale.languageCode);
    return kLanguages.contains(locale.toString());
  }

  @override
  Future<AppLocalization> load(Locale locale) async {
    // AppLocalizations class is where the JSON loading actually runs
    AppLocalization localizations = AppLocalization();
    await localizations.load(locale);
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
