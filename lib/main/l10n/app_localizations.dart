// import 'dart:async';
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_gen/gen_l10n/app_localization.dart';
//
// import 'package:mass_pro/commons/constants.dart';
// import 'package:mass_pro/utils/mass_utils/strings.dart';
//
// class L {
//   L();
//
//   static const LocalizationsDelegate<L> delegate = _AppLocalizationsDelegate();
//
//   static L? of(BuildContext context) {
//     return Localizations.of<L>(context, L);
//   }
//
//   Map<String, String>? _localizedStrings;
//   Map<String, String>? _defaultLocalizedStrings;
//   AppLocalizations? localized;
//
//   static Locale createLocale(String locale) {
//     locale = locale.replaceAll('-', '_');
//     if (!kLanguages.contains(locale)) {
//       return const Locale('en');
//     }
//     final parts = locale.split('_');
//     return Locale(parts[0]);
//   }
//
//   Future<bool> load(Locale locale) async {
//     localized = lookupAppLocalizations(locale);
//
//     final defaultJsonString = await rootBundle.loadString('lib/l10n/intl_en.arb');
//     final defaultJsonMap = json.decode(defaultJsonString) as Map<String, dynamic>;
//
//     _defaultLocalizedStrings = defaultJsonMap.map((key, value) => MapEntry(key, value.toString()));
//
//     //
//     final jsonString = await rootBundle.loadString('lib/l10n/intl_${locale.languageCode}.arb');
//     final jsonMap = json.decode(jsonString) as Map<String, dynamic>;
//
//     _localizedStrings = jsonMap.map((key, value) => MapEntry(key, value.toString()));
//
//     return true;
//   }
//
//   String lookup(String? key) {
//     if ((key ?? '').isEmpty) {
//       return '';
//     }
//
//     final lookupKey = key!.toLowerCase();
//
//     if (lookupKey.startsWith('_')) {
//       return key;
//     }
//
//     if (_localizedStrings == null) {
//       debugPrint('## ERROR: _localizedStrings not initialized');
//       return key;
//     }
//
//     final value = _localizedStrings![lookupKey] ??
//         _localizedStrings![lookupKey.replaceFirst('_id', '')] ?? '';
//
//     if (value.isEmpty) {
//       debugPrint('## ERROR: localization key not found - $key');
//       final defaultValue = _defaultLocalizedStrings![lookupKey] ?? '';
//       return defaultValue.isEmpty ? key : defaultValue;
//     }
//
//     return value;
//   }
// }
//
// class _AppLocalizationsDelegate extends LocalizationsDelegate<L> {
//   const _AppLocalizationsDelegate();
//
//   @override
//   bool isSupported(Locale locale) {
//     return kLanguages.contains(locale.toString());
//   }
//
//   @override
//   Future<L> load(Locale locale) async {
//     final localizations = L();
//     await localizations.load(locale);
//     return localizations;
//   }
//
//   @override
//   bool shouldReload(_AppLocalizationsDelegate old) => false;
// }
