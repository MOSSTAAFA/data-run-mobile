// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `لا يمكن أن تكون كلمة المرور فارغة`
  String get login_error_null_pass {
    return Intl.message(
      'لا يمكن أن تكون كلمة المرور فارغة',
      name: 'login_error_null_pass',
      desc: '',
      args: [],
    );
  }

  /// `لا يمكن أن يكون اسم المستخدم فارغًا`
  String get login_error_null_username {
    return Intl.message(
      'لا يمكن أن يكون اسم المستخدم فارغًا',
      name: 'login_error_null_username',
      desc: '',
      args: [],
    );
  }

  /// `استجابة غير ناجحة من الخادم`
  String get login_error_unsuccessful_response {
    return Intl.message(
      'استجابة غير ناجحة من الخادم',
      name: 'login_error_unsuccessful_response',
      desc: '',
      args: [],
    );
  }

  /// `خطأ في معالجة الاستجابة`
  String get login_error_error_response {
    return Intl.message(
      'خطأ في معالجة الاستجابة',
      name: 'login_error_error_response',
      desc: '',
      args: [],
    );
  }

  /// `لم يتم العثور على مثيل للخادم`
  String get login_error_no_am_instance {
    return Intl.message(
      'لم يتم العثور على مثيل للخادم',
      name: 'login_error_no_am_instance',
      desc: '',
      args: [],
    );
  }

  /// `بيانات اعتماد غير صالحة`
  String get login_error_bad_credentials {
    return Intl.message(
      'بيانات اعتماد غير صالحة',
      name: 'login_error_bad_credentials',
      desc: '',
      args: [],
    );
  }

  /// `مضيف غير معروف`
  String get login_error_unknown_host {
    return Intl.message(
      'مضيف غير معروف',
      name: 'login_error_unknown_host',
      desc: '',
      args: [],
    );
  }

  /// `حدث خطأ غير متوقع`
  String get error_unexpected {
    return Intl.message(
      'حدث خطأ غير متوقع',
      name: 'error_unexpected',
      desc: '',
      args: [],
    );
  }

  /// `عدد كبير جدًا من الوحدات التنظيمية`
  String get error_too_manu_org_units {
    return Intl.message(
      'عدد كبير جدًا من الوحدات التنظيمية',
      name: 'error_too_manu_org_units',
      desc: '',
      args: [],
    );
  }

  /// `تم الوصول إلى الحد الأقصى لعدد TEI`
  String get error_max_tei_count_reached {
    return Intl.message(
      'تم الوصول إلى الحد الأقصى لعدد TEI',
      name: 'error_max_tei_count_reached',
      desc: '',
      args: [],
    );
  }

  /// `الكثير من الطلبات`
  String get error_many_requests {
    return Intl.message(
      'الكثير من الطلبات',
      name: 'error_many_requests',
      desc: '',
      args: [],
    );
  }

  /// `المستخدم مصادق عليه بالفعل`
  String get error_already_authenticated {
    return Intl.message(
      'المستخدم مصادق عليه بالفعل',
      name: 'error_already_authenticated',
      desc: '',
      args: [],
    );
  }

  /// `الإجراء تم تنفيذه بالفعل`
  String get error_already_executed {
    return Intl.message(
      'الإجراء تم تنفيذه بالفعل',
      name: 'error_already_executed',
      desc: '',
      args: [],
    );
  }

  /// `استعلام API غير صالح`
  String get error_api_invalid_query {
    return Intl.message(
      'استعلام API غير صالح',
      name: 'error_api_invalid_query',
      desc: '',
      args: [],
    );
  }

  /// `اسم التطبيق غير مضبوط`
  String get error_app_name_not_set {
    return Intl.message(
      'اسم التطبيق غير مضبوط',
      name: 'error_app_name_not_set',
      desc: '',
      args: [],
    );
  }

  /// `إصدار التطبيق غير مضبوط`
  String get error_app_version_not_set {
    return Intl.message(
      'إصدار التطبيق غير مضبوط',
      name: 'error_app_version_not_set',
      desc: '',
      args: [],
    );
  }

  /// `لا يمكن الوصول إلى مستودع المفاتيح`
  String get error_access_keystore {
    return Intl.message(
      'لا يمكن الوصول إلى مستودع المفاتيح',
      name: 'error_access_keystore',
      desc: '',
      args: [],
    );
  }

  /// `لا يمكن إنشاء كائن موجود بالفعل`
  String get error_create_existing_error {
    return Intl.message(
      'لا يمكن إنشاء كائن موجود بالفعل',
      name: 'error_create_existing_error',
      desc: '',
      args: [],
    );
  }

  /// `لا يمكن حذف كائن غير موجود`
  String get error_delete_non_existing_object {
    return Intl.message(
      'لا يمكن حذف كائن غير موجود',
      name: 'error_delete_non_existing_object',
      desc: '',
      args: [],
    );
  }

  /// `لا يمكن إنشاء مثيل مستودع المفاتيح`
  String get error_instance_keystore {
    return Intl.message(
      'لا يمكن إنشاء مثيل مستودع المفاتيح',
      name: 'error_instance_keystore',
      desc: '',
      args: [],
    );
  }

  /// `تعذر الحجز على القيمة على الخادم`
  String get error_reserve_value_on_server {
    return Intl.message(
      'تعذر الحجز على القيمة على الخادم',
      name: 'error_reserve_value_on_server',
      desc: '',
      args: [],
    );
  }

  /// `يرجى تسجيل الدخول للتصدير`
  String get error_export_login {
    return Intl.message(
      'يرجى تسجيل الدخول للتصدير',
      name: 'error_export_login',
      desc: '',
      args: [],
    );
  }

  /// `لا يتم دعم التصدير المشفر`
  String get error_export_encrypted {
    return Intl.message(
      'لا يتم دعم التصدير المشفر',
      name: 'error_export_encrypted',
      desc: '',
      args: [],
    );
  }

  /// `الاستيراد موجود بالفعل`
  String get error_import_exist {
    return Intl.message(
      'الاستيراد موجود بالفعل',
      name: 'error_import_exist',
      desc: '',
      args: [],
    );
  }

  /// `الرجاء تسجيل الخروج قبل الاستيراد`
  String get error_import_logout {
    return Intl.message(
      'الرجاء تسجيل الخروج قبل الاستيراد',
      name: 'error_import_logout',
      desc: '',
      args: [],
    );
  }

  /// `إصدار الاستيراد أعلى من المدعوم`
  String get error_import_version {
    return Intl.message(
      'إصدار الاستيراد أعلى من المدعوم',
      name: 'error_import_version',
      desc: '',
      args: [],
    );
  }

  /// `الملف غير موجود`
  String get error_file_not_found {
    return Intl.message(
      'الملف غير موجود',
      name: 'error_file_not_found',
      desc: '',
      args: [],
    );
  }

  /// `فشل تغيير حجم الصورة`
  String get error_file_resize {
    return Intl.message(
      'فشل تغيير حجم الصورة',
      name: 'error_file_resize',
      desc: '',
      args: [],
    );
  }

  /// `تعذر إنشاء الإحداثيات`
  String get error_generate_coordinate {
    return Intl.message(
      'تعذر إنشاء الإحداثيات',
      name: 'error_generate_coordinate',
      desc: '',
      args: [],
    );
  }

  /// `تقرير العمل غير متاح`
  String get error_job {
    return Intl.message(
      'تقرير العمل غير متاح',
      name: 'error_job',
      desc: '',
      args: [],
    );
  }

  /// `نقص القيم المتاحة`
  String get error_low_on_available_values {
    return Intl.message(
      'نقص القيم المتاحة',
      name: 'error_low_on_available_values',
      desc: '',
      args: [],
    );
  }

  /// `لا يوجد مستخدم مصادق عليه`
  String get error_user_no_authenticated {
    return Intl.message(
      'لا يوجد مستخدم مصادق عليه',
      name: 'error_user_no_authenticated',
      desc: '',
      args: [],
    );
  }

  /// `لا يوجد مستخدم مصادق عليه حاليًا`
  String get error_user_no_authenticated_offline {
    return Intl.message(
      'لا يوجد مستخدم مصادق عليه حاليًا',
      name: 'error_user_no_authenticated_offline',
      desc: '',
      args: [],
    );
  }

  /// `لا توجد قيم متبقية للحجز على الخادم`
  String get error_no_values_left_on_server {
    return Intl.message(
      'لا توجد قيم متبقية للحجز على الخادم',
      name: 'error_no_values_left_on_server',
      desc: '',
      args: [],
    );
  }

  /// `مستخدم آخر مصادق عليه بشكل غير متصل`
  String get error_different_offline_user {
    return Intl.message(
      'مستخدم آخر مصادق عليه بشكل غير متصل',
      name: 'error_different_offline_user',
      desc: '',
      args: [],
    );
  }

  /// `قيمة هندسية غير صالحة`
  String get error_invalid_geometry {
    return Intl.message(
      'قيمة هندسية غير صالحة',
      name: 'error_invalid_geometry',
      desc: '',
      args: [],
    );
  }

  /// `لا توجد قيم محجوزة`
  String get error_no_reserved_values {
    return Intl.message(
      'لا توجد قيم محجوزة',
      name: 'error_no_reserved_values',
      desc: '',
      args: [],
    );
  }

  /// `لا يمكن تحديث الكائن`
  String get error_object_update {
    return Intl.message(
      'لا يمكن تحديث الكائن',
      name: 'error_object_update',
      desc: '',
      args: [],
    );
  }

  /// `لا يمكن إدراج الكائن`
  String get error_object_insert {
    return Intl.message(
      'لا يمكن إدراج الكائن',
      name: 'error_object_insert',
      desc: '',
      args: [],
    );
  }

  /// `تم رفض وصول الملكية`
  String get error_ownership_access {
    return Intl.message(
      'تم رفض وصول الملكية',
      name: 'error_ownership_access',
      desc: '',
      args: [],
    );
  }

  /// `خطأ في تحليل بحث الشبكة`
  String get online_search_parsing_error {
    return Intl.message(
      'خطأ في تحليل بحث الشبكة',
      name: 'online_search_parsing_error',
      desc: '',
      args: [],
    );
  }

  /// `عنوان URL للخادم لا يمكن أن يكون فارغًا`
  String get error_null_url {
    return Intl.message(
      'عنوان URL للخادم لا يمكن أن يكون فارغًا',
      name: 'error_null_url',
      desc: '',
      args: [],
    );
  }

  /// `عنوان URL للخادم غير صحيح`
  String get error_server_malformed {
    return Intl.message(
      'عنوان URL للخادم غير صحيح',
      name: 'error_server_malformed',
      desc: '',
      args: [],
    );
  }

  /// `تطبيق الإعدادات غير مدعوم`
  String get error_settings_app_not_supported {
    return Intl.message(
      'تطبيق الإعدادات غير مدعوم',
      name: 'error_settings_app_not_supported',
      desc: '',
      args: [],
    );
  }

  /// `تطبيق الإعدادات غير مثبت`
  String get error_settings_app_not_intalled {
    return Intl.message(
      'تطبيق الإعدادات غير مثبت',
      name: 'error_settings_app_not_intalled',
      desc: '',
      args: [],
    );
  }

  /// `انتهاء مهلة الاتصال`
  String get error_socket_timeout {
    return Intl.message(
      'انتهاء مهلة الاتصال',
      name: 'error_socket_timeout',
      desc: '',
      args: [],
    );
  }

  /// `لا يمكن تحديث العلاقات`
  String get error_relationship_updated {
    return Intl.message(
      'لا يمكن تحديث العلاقات',
      name: 'error_relationship_updated',
      desc: '',
      args: [],
    );
  }

  /// `عدد كبير جدًا من الفترات`
  String get error_too_many_periods {
    return Intl.message(
      'عدد كبير جدًا من الفترات',
      name: 'error_too_many_periods',
      desc: '',
      args: [],
    );
  }

  /// `عنوان URL غير موجود`
  String get error_url_not_found {
    return Intl.message(
      'عنوان URL غير موجود',
      name: 'error_url_not_found',
      desc: '',
      args: [],
    );
  }

  /// `تم تعطيل حساب المستخدم`
  String get error_account_disabled {
    return Intl.message(
      'تم تعطيل حساب المستخدم',
      name: 'error_account_disabled',
      desc: '',
      args: [],
    );
  }

  /// `تم قفل حساب المستخدم`
  String get error_account_locked {
    return Intl.message(
      'تم قفل حساب المستخدم',
      name: 'error_account_locked',
      desc: '',
      args: [],
    );
  }

  /// `لا يمكن تعيين القيمة`
  String get error_set_value {
    return Intl.message(
      'لا يمكن تعيين القيمة',
      name: 'error_set_value',
      desc: '',
      args: [],
    );
  }

  /// `استغرق حجز القيم وقتًا طويلاً`
  String get error_value_reservation_time {
    return Intl.message(
      'استغرق حجز القيم وقتًا طويلاً',
      name: 'error_value_reservation_time',
      desc: '',
      args: [],
    );
  }

  /// `خطأ SSL`
  String get error_ssl {
    return Intl.message(
      'خطأ SSL',
      name: 'error_ssl',
      desc: '',
      args: [],
    );
  }

  /// `غير مدعومة خدمة الرسائل القصيرة`
  String get error_sms_not_supported {
    return Intl.message(
      'غير مدعومة خدمة الرسائل القصيرة',
      name: 'error_sms_not_supported',
      desc: '',
      args: [],
    );
  }

  /// `الحد الأدنى للسمات المطلوبة في البحث`
  String get error_min_attributes {
    return Intl.message(
      'الحد الأدنى للسمات المطلوبة في البحث',
      name: 'error_min_attributes',
      desc: '',
      args: [],
    );
  }

  /// `الوحدة التنظيمية غير مشمولة في نطاق البحث`
  String get error_org_unit_scope {
    return Intl.message(
      'الوحدة التنظيمية غير مشمولة في نطاق البحث',
      name: 'error_org_unit_scope',
      desc: '',
      args: [],
    );
  }

  /// `أحرف غير صالحة`
  String get error_invalid_characters {
    return Intl.message(
      'أحرف غير صالحة',
      name: 'error_invalid_characters',
      desc: '',
      args: [],
    );
  }

  /// `خطأ غير معتمد`
  String get not_mapped_error {
    return Intl.message(
      'خطأ غير معتمد',
      name: 'not_mapped_error',
      desc: '',
      args: [],
    );
  }

  /// `ماس برو`
  String get app_name {
    return Intl.message(
      'ماس برو',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
