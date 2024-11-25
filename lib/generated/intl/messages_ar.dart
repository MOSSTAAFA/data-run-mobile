// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ar locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ar';

  static String m0(error) => "حدث خطأ أثناء التواصل API النظام: \$${error}.";

  static String m1(error) => "يجب إدخال \$${error} عنصر على الأقل";

  static String m2(error) => "واجهت قاعدة البيانات خطأ: \$${error}.";

  static String m3(count) =>
      "${Intl.plural(count, zero: 'لا تتوفر استمارات لهذا النشاط', one: 'تتوفر 1 استمارة', two: 'تتوفر استمارتان', other: '${count} استمارة متوفرة')}";

  static String m4(error) => "الحد الأقصى للطول المسموح به هو \$${error}.";

  static String m5(count) =>
      "${Intl.plural(count, zero: ' ', one: 'شهر', two: 'شهران', few: '${count} أشهر', other: '${count} شهر')}";

  static String m6(error) =>
      "حدث خطأ أثناء مزامنة البيانات: \$${error}. يرجى المحاولة مرة أخرى.";

  static String m7(error) =>
      "حدث خطأ غير متوقع: \$${error}. يرجى المحاولة مرة أخرى.";

  static String m8(error) => "يجب أن تكون القيمة أكبر من أو تساوي \$${error}.";

  static String m9(error) => "يجب أن تكون القيمة أقل من أو تساوي \$${error}.";

  static String m10(count) =>
      "${Intl.plural(count, zero: '', one: 'سنة', two: 'سنتان', few: '${count} سنوات', other: '${count} سنة')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("عنا"),
        "accept": MessageLookupByLibrary.simpleMessage("قبول"),
        "accountDisabled": MessageLookupByLibrary.simpleMessage(
            "تم تعطيل هذا الحساب. يرجى الاتصال بالمسؤول للمساعدة."),
        "accountInformation":
            MessageLookupByLibrary.simpleMessage("معلومات الحساب"),
        "addNew": MessageLookupByLibrary.simpleMessage("إضافة جديد"),
        "and": MessageLookupByLibrary.simpleMessage("و"),
        "apiError": m0,
        "appInformation":
            MessageLookupByLibrary.simpleMessage("معلومات التطبيق"),
        "appName": MessageLookupByLibrary.simpleMessage("Datarun"),
        "appVersion": MessageLookupByLibrary.simpleMessage("إصدار التطبيق"),
        "appearance": MessageLookupByLibrary.simpleMessage("المظهر"),
        "atLeastErrorItemMustBeProvided": m1,
        "authInvalidCredentials": MessageLookupByLibrary.simpleMessage(
            "بيانات الدخول التي تم إدخالها غير صحيحة. يرجى التحقق والمحاولة مرة أخرى."),
        "authSessionExpired": MessageLookupByLibrary.simpleMessage(
            "انتهت صلاحية الجلسة. يرجى تسجيل الدخول للمتابعة."),
        "barcodeQrScan":
            MessageLookupByLibrary.simpleMessage("Barcode/QR Code"),
        "cancel": MessageLookupByLibrary.simpleMessage("إلغاء"),
        "changePassword":
            MessageLookupByLibrary.simpleMessage("تغيير كلمة السر"),
        "checkFieldsLater": MessageLookupByLibrary.simpleMessage("ليس الآن"),
        "clear": MessageLookupByLibrary.simpleMessage("تصفية"),
        "configurationReady":
            MessageLookupByLibrary.simpleMessage("اكتملت تهيئة التطبيق"),
        "confirm": MessageLookupByLibrary.simpleMessage("تأكيد"),
        "confirmSyncFormData": MessageLookupByLibrary.simpleMessage(
            "هل أنت متأكد أنك تريد مزامنة البيانات المحددة؟"),
        "conformDeleteMsg": MessageLookupByLibrary.simpleMessage(
            "هل أنت متأكد أنك تريد إزالة هذا القسم؟"),
        "currentUsername":
            MessageLookupByLibrary.simpleMessage("المستخدم الحالي"),
        "daily": MessageLookupByLibrary.simpleMessage("يومي"),
        "dashboard": MessageLookupByLibrary.simpleMessage("الرئيسية"),
        "databaseConnectionFailed": MessageLookupByLibrary.simpleMessage(
            "فشل في الاتصال بقاعدة البيانات. يرجى المحاولة مرة أخرى أو الاتصال بالدعم."),
        "databaseInternalError": m2,
        "databaseQueryFailed": MessageLookupByLibrary.simpleMessage(
            "حدث خطأ أثناء معالجة طلب قاعدة البيانات. يرجى المحاولة مرة أخرى."),
        "delete": MessageLookupByLibrary.simpleMessage("حذف"),
        "deleteConfirmationMessage": MessageLookupByLibrary.simpleMessage(
            "هل تريد بالتأكيد حذف هذا العنصر؟"),
        "developer": MessageLookupByLibrary.simpleMessage(
            "البرنامج الوطني لمكافحة الملاريا"),
        "developerInfoText":
            MessageLookupByLibrary.simpleMessage("info@nmcpye.org"),
        "developerInformation":
            MessageLookupByLibrary.simpleMessage("معلومات المطور"),
        "differentOfflineUser": MessageLookupByLibrary.simpleMessage(
            "جلسة عدم الاتصال الحالية موثقة لمستخدم مختلف."),
        "discard": MessageLookupByLibrary.simpleMessage("تجاهل"),
        "dismiss": MessageLookupByLibrary.simpleMessage("حسنًا"),
        "done": MessageLookupByLibrary.simpleMessage("نجاح"),
        "edit": MessageLookupByLibrary.simpleMessage("تعديل"),
        "empty": MessageLookupByLibrary.simpleMessage("فارغ"),
        "enterAValidNumber":
            MessageLookupByLibrary.simpleMessage("يرجى إدخال رقم صالح."),
        "enterYourUsername":
            MessageLookupByLibrary.simpleMessage("من فضلك أدخل اسم المستخدم"),
        "error": MessageLookupByLibrary.simpleMessage("خطأ"),
        "errorOpeningNewForm":
            MessageLookupByLibrary.simpleMessage("حدث خطأ أثناء فتح الإستمارة"),
        "everyFifteenDays": MessageLookupByLibrary.simpleMessage("كل 15 يوم"),
        "everyTwoDays": MessageLookupByLibrary.simpleMessage("كل يومين"),
        "failed": MessageLookupByLibrary.simpleMessage("فشل"),
        "fetchUpdates": MessageLookupByLibrary.simpleMessage("تحديث"),
        "fieldContainErrors":
            MessageLookupByLibrary.simpleMessage("يحوي أخطاء"),
        "fieldsWithErrorInfo": MessageLookupByLibrary.simpleMessage(
            "قم بالرجوع ومراجعة الإخطاء أو (ليس الآن) للحفظ والمراجعة في وقت لاحق! لن يتسنى لك تعيين الاستمارة كنهائية وإرسالها إلا بعد تصحيح الأخطاء: "),
        "finalData": MessageLookupByLibrary.simpleMessage("بيانات نهائية"),
        "firstName": MessageLookupByLibrary.simpleMessage("الاسم الأول"),
        "form": m3,
        "formContainsSomeErrors":
            MessageLookupByLibrary.simpleMessage(" يوجد أخطاء في بعض الحقول"),
        "formSummaryView":
            MessageLookupByLibrary.simpleMessage("عرض خلاصة الاستمارة"),
        "fullName": MessageLookupByLibrary.simpleMessage("الاسم الكامل"),
        "hidePassword": MessageLookupByLibrary.simpleMessage("اخفاء كلمة السر"),
        "home": MessageLookupByLibrary.simpleMessage("الرئيسة"),
        "internetIsConnected":
            MessageLookupByLibrary.simpleMessage("متصل بالإنترنت"),
        "itemRemoved": MessageLookupByLibrary.simpleMessage("تم الحذف"),
        "language": MessageLookupByLibrary.simpleMessage("اللغة"),
        "lastConfigurationSyncTime":
            MessageLookupByLibrary.simpleMessage("آخر تحديث"),
        "lastName": MessageLookupByLibrary.simpleMessage("اللقب"),
        "lastSyncStatus":
            MessageLookupByLibrary.simpleMessage("حالة آخر تحديث"),
        "level": MessageLookupByLibrary.simpleMessage("المستوى"),
        "login": MessageLookupByLibrary.simpleMessage("تسجيل الدخول"),
        "loginUsername":
            MessageLookupByLibrary.simpleMessage("حساب تسجيل الدخول"),
        "logout": MessageLookupByLibrary.simpleMessage("تسجيل الخروج"),
        "logoutNote":
            MessageLookupByLibrary.simpleMessage("تسجيل خروج المستخدم الحالي"),
        "makeFormFinalOrSaveBody": MessageLookupByLibrary.simpleMessage(
            "قم بتعيين الاستمار كنهائية حتى يتسنى لك إرسالها، أو اختر (ليس الآن) لحفظها كمسودة إلى وقت لاحق!"),
        "markAsFinalData": MessageLookupByLibrary.simpleMessage(
            "حقول مكتملة، هل تبريد تعيين هذه البيانات كنهائية وجاهزة للإرسال؟"),
        "maximumAllowedLengthIsError": m4,
        "middleName": MessageLookupByLibrary.simpleMessage("الاسم الأوسط"),
        "mobile": MessageLookupByLibrary.simpleMessage("رقم الموبايل"),
        "month": m5,
        "monthly": MessageLookupByLibrary.simpleMessage("شهري"),
        "months": MessageLookupByLibrary.simpleMessage("أشهر"),
        "networkConnectionFailed": MessageLookupByLibrary.simpleMessage(
            "فشل في الاتصال بالشبكة. يرجى التحقق من الاتصال والمحاولة مرة أخرى."),
        "networkTimeout": MessageLookupByLibrary.simpleMessage(
            "انتهت مهلة الطلب. يرجى المحاولة مرة أخرى."),
        "nmcpYemen": MessageLookupByLibrary.simpleMessage(
            "البرنامج الوطني لمكافحة الملاريا"),
        "noAuthenticatedUser": MessageLookupByLibrary.simpleMessage(
            "بيانات الاعتماد المقدمة لا تطابق مستخدمًا سبق وأن سجل. لا يمكن تسجيل الدخول في وضع عدم الاتصال بالإنترنت."),
        "noAuthenticatedUserOffline": MessageLookupByLibrary.simpleMessage(
            "لم يتم توثيق المستخدم مسبقاً. لا يمكن تسجيل الدخول في وضع عدم الاتصال."),
        "noFormsAvailable": MessageLookupByLibrary.simpleMessage(
            "لا تتوفر استمارات لهذا النشاط"),
        "noInternetAccess": MessageLookupByLibrary.simpleMessage("غير متصل"),
        "noSyncYet": MessageLookupByLibrary.simpleMessage("لم يحدث بعد"),
        "notNow": MessageLookupByLibrary.simpleMessage("ليس الآن"),
        "notifications": MessageLookupByLibrary.simpleMessage("تنبيهات"),
        "objectAccessClosed":
            MessageLookupByLibrary.simpleMessage("الوصول مغلق لهذا الكائن"),
        "objectAccessDenied":
            MessageLookupByLibrary.simpleMessage("الوصول مرفوض لهذا الكائن"),
        "ok": MessageLookupByLibrary.simpleMessage("موافق"),
        "online": MessageLookupByLibrary.simpleMessage("متصل"),
        "open": MessageLookupByLibrary.simpleMessage("فتح"),
        "openNewForm":
            MessageLookupByLibrary.simpleMessage("فتح استمارة جديدة"),
        "openSettings": MessageLookupByLibrary.simpleMessage("فتح الإعدادات"),
        "orgUnitDialogTitle":
            MessageLookupByLibrary.simpleMessage("ابحث عن المكان"),
        "orgUnitHelpText":
            MessageLookupByLibrary.simpleMessage("اختر اسم المكان"),
        "orgUnitInputLabel":
            MessageLookupByLibrary.simpleMessage("اختر اسم المكان"),
        "organization":
            MessageLookupByLibrary.simpleMessage("الوحدة التنظيمية"),
        "password": MessageLookupByLibrary.simpleMessage("كلمة المرور"),
        "personInformation":
            MessageLookupByLibrary.simpleMessage("معلومات الشخص"),
        "pleaseEnterAValidEmailAddress": MessageLookupByLibrary.simpleMessage(
            "يرجى إدخال عنوان بريد إلكتروني صالح."),
        "preferences": MessageLookupByLibrary.simpleMessage("التفضيلات"),
        "reviewFormData":
            MessageLookupByLibrary.simpleMessage("مراجعة الأخطاء"),
        "save": MessageLookupByLibrary.simpleMessage("حفظ"),
        "saveAndCheck": MessageLookupByLibrary.simpleMessage("حفظ وتحقق"),
        "scanYourCode": MessageLookupByLibrary.simpleMessage("Scan your code"),
        "searchOrgUnitsHelpText":
            MessageLookupByLibrary.simpleMessage("البحث عن مكان..."),
        "selectAColorExtractionImage":
            MessageLookupByLibrary.simpleMessage("حدد صورة لإستخلاص الألوان"),
        "selectASeedColor":
            MessageLookupByLibrary.simpleMessage("حدد لون الأساس"),
        "selectColorTheme": MessageLookupByLibrary.simpleMessage("ثيم الألوان"),
        "selectImageForColorExtraction":
            MessageLookupByLibrary.simpleMessage("حدد صورة لاستخلاص ثيم منها"),
        "selected": MessageLookupByLibrary.simpleMessage("عناصر محددة"),
        "send": MessageLookupByLibrary.simpleMessage("إرسال"),
        "serverUrl": MessageLookupByLibrary.simpleMessage("رابط السيرفر"),
        "settings": MessageLookupByLibrary.simpleMessage("إعدادات"),
        "showPassword": MessageLookupByLibrary.simpleMessage("أظهر كلمة السر"),
        "startingSync": MessageLookupByLibrary.simpleMessage("بدء التحديث"),
        "submissionDataEntry": MessageLookupByLibrary.simpleMessage("بيانات"),
        "submissionInitialData":
            MessageLookupByLibrary.simpleMessage("الرئيسة"),
        "syncError": m6,
        "syncFormData":
            MessageLookupByLibrary.simpleMessage("مزامنة بيانات الاستمارة"),
        "syncInterval":
            MessageLookupByLibrary.simpleMessage("ظبط فترة التحديث التلقائي"),
        "syncNow": MessageLookupByLibrary.simpleMessage("التحديث الآن"),
        "syncSettings":
            MessageLookupByLibrary.simpleMessage("التحديث التلقائي"),
        "syncingConfiguration":
            MessageLookupByLibrary.simpleMessage("إعدادات المزامنة"),
        "syncingData": MessageLookupByLibrary.simpleMessage("مزامنة بيانات"),
        "syncingEvents":
            MessageLookupByLibrary.simpleMessage("مزامنة الإستمارات"),
        "thisFieldIsRequired":
            MessageLookupByLibrary.simpleMessage("هذا الحقل مطلوب."),
        "toggleBrightness":
            MessageLookupByLibrary.simpleMessage("تبديل الإضاءة"),
        "undo": MessageLookupByLibrary.simpleMessage("تراجع"),
        "unknownError": m7,
        "user": MessageLookupByLibrary.simpleMessage("مستخدم"),
        "userSettings":
            MessageLookupByLibrary.simpleMessage("إعدادات المستخدم"),
        "username": MessageLookupByLibrary.simpleMessage("اسم المستخدم"),
        "validationError": MessageLookupByLibrary.simpleMessage(
            "يرجى تصحيح الأخطاء في النموذج قبل المتابعة."),
        "valueMustBeGreaterThanOrEqualToError": m8,
        "valueMustBeLessThanOrEqualToError": m9,
        "version": MessageLookupByLibrary.simpleMessage("الإصدار"),
        "viewAvailableForms": MessageLookupByLibrary.simpleMessage(
            "افتح لاستعرض الاستمارات المتاحة"),
        "viewList": MessageLookupByLibrary.simpleMessage("عرض القائمة"),
        "weekly": MessageLookupByLibrary.simpleMessage("اسبوعي"),
        "year": m10,
        "years": MessageLookupByLibrary.simpleMessage("سنوات")
      };
}
