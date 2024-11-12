// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(error) =>
      "An error occurred while interacting with the API \$${error}.";

  static String m1(error) => "Database returned an Error \$${error}.";

  static String m2(count) =>
      "${Intl.plural(count, zero: 'no forms available', one: '1 form available', two: '2 forms available', other: '${count} forms available')}";

  static String m3(error) => "The maximum allowed length is \$${error}.";

  static String m4(count) =>
      "${Intl.plural(count, zero: ' ', one: '1 Month', two: '2 Months', few: '${count} Years', other: '${count} Months')}";

  static String m5(error) => "Error While Trying to Sync data \$${error}.";

  static String m6(error) => "Error: \$${error}.";

  static String m7(error) =>
      "The value must be greater than or equal to \$${error}.";

  static String m8(error) =>
      "The value must be less than or equal to \$${error}.";

  static String m9(count) =>
      "${Intl.plural(count, zero: ' ', one: '1 Year', two: '2 Years', few: '${count} Years', other: '${count} Years')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("About"),
        "accept": MessageLookupByLibrary.simpleMessage("Accept"),
        "accountDisabled": MessageLookupByLibrary.simpleMessage(
            "This account is disabled. contact Administrator for details."),
        "accountInformation":
            MessageLookupByLibrary.simpleMessage("Account Information"),
        "addNew": MessageLookupByLibrary.simpleMessage("Add New"),
        "and": MessageLookupByLibrary.simpleMessage("And"),
        "apiError": m0,
        "appInformation":
            MessageLookupByLibrary.simpleMessage("App Information"),
        "appName": MessageLookupByLibrary.simpleMessage("Datarun"),
        "appVersion": MessageLookupByLibrary.simpleMessage("App Version"),
        "appearance": MessageLookupByLibrary.simpleMessage("Appearance"),
        "authInvalidCredentials": MessageLookupByLibrary.simpleMessage(
            "Invalid login credentials provided."),
        "authSessionExpired": MessageLookupByLibrary.simpleMessage(
            "Your session has expired. Please log in again."),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "changePassword":
            MessageLookupByLibrary.simpleMessage("Change Password"),
        "checkFieldsLater":
            MessageLookupByLibrary.simpleMessage("Check Fields later"),
        "clear": MessageLookupByLibrary.simpleMessage("Clear"),
        "configurationReady":
            MessageLookupByLibrary.simpleMessage("Configuration Ready"),
        "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
        "confirmSyncFormData": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to sync the selected entities?"),
        "conformDeleteMsg": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to remove this section?"),
        "currentUsername":
            MessageLookupByLibrary.simpleMessage("Current username"),
        "daily": MessageLookupByLibrary.simpleMessage("Daily"),
        "dashboard": MessageLookupByLibrary.simpleMessage("Dashboard"),
        "databaseConnectionFailed": MessageLookupByLibrary.simpleMessage(
            "Failed to connect to the database."),
        "databaseInternalError": m1,
        "databaseQueryFailed": MessageLookupByLibrary.simpleMessage(
            "Error occurred while querying the database."),
        "delete": MessageLookupByLibrary.simpleMessage("Delete"),
        "deleteConfirmationMessage": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to delete this item?"),
        "developer": MessageLookupByLibrary.simpleMessage("MOH, NMCP Yemen"),
        "developerInfoText": MessageLookupByLibrary.simpleMessage(
            "Hamza Assada. email: 7amza.it@gmail.com"),
        "developerInformation":
            MessageLookupByLibrary.simpleMessage("Developer Information"),
        "differentOfflineUser": MessageLookupByLibrary.simpleMessage(
            "Different authenticated user offline"),
        "discard": MessageLookupByLibrary.simpleMessage("Discard"),
        "dismiss": MessageLookupByLibrary.simpleMessage("Dismiss"),
        "done": MessageLookupByLibrary.simpleMessage("Done"),
        "edit": MessageLookupByLibrary.simpleMessage("Edit"),
        "empty": MessageLookupByLibrary.simpleMessage("Empty"),
        "enterAValidNumber": MessageLookupByLibrary.simpleMessage(
            "Please enter a valid number."),
        "enterYourUsername":
            MessageLookupByLibrary.simpleMessage("Enter Your Username"),
        "error": MessageLookupByLibrary.simpleMessage("Error"),
        "errorOpeningNewForm":
            MessageLookupByLibrary.simpleMessage("Error Opening New Form"),
        "everyFifteenDays":
            MessageLookupByLibrary.simpleMessage("Every 15 days"),
        "everyTwoDays": MessageLookupByLibrary.simpleMessage("Every two days"),
        "failed": MessageLookupByLibrary.simpleMessage("Failed"),
        "fetchUpdates":
            MessageLookupByLibrary.simpleMessage("Fetch From Server"),
        "fieldContainErrors":
            MessageLookupByLibrary.simpleMessage("field Contain Errors"),
        "fieldsWithErrorInfo":
            MessageLookupByLibrary.simpleMessage("Fields with Error"),
        "finalData": MessageLookupByLibrary.simpleMessage("Final Data"),
        "firstName": MessageLookupByLibrary.simpleMessage("First Name"),
        "form": m2,
        "formContainsSomeErrors":
            MessageLookupByLibrary.simpleMessage("Form contains some errors"),
        "formSummaryView":
            MessageLookupByLibrary.simpleMessage("Form Summary View"),
        "fullName": MessageLookupByLibrary.simpleMessage("Full Name"),
        "hidePassword": MessageLookupByLibrary.simpleMessage("Hide Password"),
        "home": MessageLookupByLibrary.simpleMessage("Home"),
        "internetIsConnected":
            MessageLookupByLibrary.simpleMessage("internet Is Connected"),
        "itemRemoved": MessageLookupByLibrary.simpleMessage("Item Removed"),
        "language": MessageLookupByLibrary.simpleMessage("Language"),
        "lastConfigurationSyncTime":
            MessageLookupByLibrary.simpleMessage("Sync Time"),
        "lastName": MessageLookupByLibrary.simpleMessage("Last Name"),
        "lastSyncStatus":
            MessageLookupByLibrary.simpleMessage("last sync status"),
        "level": MessageLookupByLibrary.simpleMessage("Level"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "loginUsername": MessageLookupByLibrary.simpleMessage("Login Username"),
        "logout": MessageLookupByLibrary.simpleMessage("Logout"),
        "logoutNote": MessageLookupByLibrary.simpleMessage(
            "your data will not be deleted when you login back again"),
        "makeFormFinalOrSaveBody": MessageLookupByLibrary.simpleMessage(
            "Make Form Final for Send to server, or save as draft!"),
        "markAsFinalData": MessageLookupByLibrary.simpleMessage(
            "Make the form Final before exiting."),
        "maximumAllowedLengthIsError": m3,
        "middleName": MessageLookupByLibrary.simpleMessage("Middle Name"),
        "mobile": MessageLookupByLibrary.simpleMessage("Mobile"),
        "month": m4,
        "monthly": MessageLookupByLibrary.simpleMessage("Monthly"),
        "months": MessageLookupByLibrary.simpleMessage("Months"),
        "networkConnectionFailed": MessageLookupByLibrary.simpleMessage(
            "Connection failed. Check your network."),
        "networkTimeout": MessageLookupByLibrary.simpleMessage(
            "Request timed out. Please try again."),
        "nmcpYemen": MessageLookupByLibrary.simpleMessage("NMCP Yemen"),
        "noAuthenticatedUser": MessageLookupByLibrary.simpleMessage(
            "Credentials do not match authenticated user. Cannot login offline."),
        "noAuthenticatedUserOffline": MessageLookupByLibrary.simpleMessage(
            "The user hasn\'t been previously authenticated. Cannot login offline."),
        "noFormsAvailable":
            MessageLookupByLibrary.simpleMessage("No forms available"),
        "noInternetAccess":
            MessageLookupByLibrary.simpleMessage("No internet access"),
        "noSyncYet": MessageLookupByLibrary.simpleMessage("No sync yet"),
        "notNow": MessageLookupByLibrary.simpleMessage("Not Now"),
        "notifications": MessageLookupByLibrary.simpleMessage("Notifications"),
        "objectAccessClosed":
            MessageLookupByLibrary.simpleMessage("objectAccessClosed"),
        "objectAccessDenied":
            MessageLookupByLibrary.simpleMessage("objectAccessDenied"),
        "ok": MessageLookupByLibrary.simpleMessage("OK"),
        "online": MessageLookupByLibrary.simpleMessage("online!"),
        "open": MessageLookupByLibrary.simpleMessage("Open"),
        "openNewForm": MessageLookupByLibrary.simpleMessage("Open New Form"),
        "openSettings": MessageLookupByLibrary.simpleMessage("Open settings"),
        "orgUnitDialogTitle": MessageLookupByLibrary.simpleMessage(
            "Search for and Select OrgUnit"),
        "orgUnitHelpText":
            MessageLookupByLibrary.simpleMessage("Select Org Unit"),
        "orgUnitInputLabel":
            MessageLookupByLibrary.simpleMessage("Select Org Unit"),
        "organization": MessageLookupByLibrary.simpleMessage("Organization"),
        "password": MessageLookupByLibrary.simpleMessage("password"),
        "personInformation":
            MessageLookupByLibrary.simpleMessage("Person Information"),
        "pleaseEnterAValidEmailAddress": MessageLookupByLibrary.simpleMessage(
            "enter a valid email address."),
        "preferences": MessageLookupByLibrary.simpleMessage("Preferences"),
        "reviewFormData": MessageLookupByLibrary.simpleMessage("Review Form"),
        "save": MessageLookupByLibrary.simpleMessage("Save"),
        "saveAndCheck": MessageLookupByLibrary.simpleMessage("Save and Check"),
        "searchOrgUnitsHelpText":
            MessageLookupByLibrary.simpleMessage("Search Org Units..."),
        "selectAColorExtractionImage": MessageLookupByLibrary.simpleMessage(
            "Select a color extraction image"),
        "selectASeedColor":
            MessageLookupByLibrary.simpleMessage("Select a seed color"),
        "selectColorTheme":
            MessageLookupByLibrary.simpleMessage("Select Color Theme"),
        "selectImageForColorExtraction": MessageLookupByLibrary.simpleMessage(
            "Select Image for Color Extraction"),
        "selected": MessageLookupByLibrary.simpleMessage("selected"),
        "send": MessageLookupByLibrary.simpleMessage("Send"),
        "serverUrl": MessageLookupByLibrary.simpleMessage("Server URL"),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "showPassword": MessageLookupByLibrary.simpleMessage("Show Password"),
        "startingSync":
            MessageLookupByLibrary.simpleMessage("Starting sync..."),
        "submissionDataEntry": MessageLookupByLibrary.simpleMessage("Data"),
        "submissionInitialData": MessageLookupByLibrary.simpleMessage("Main"),
        "syncError": m5,
        "syncFormData": MessageLookupByLibrary.simpleMessage("Sync Form Data"),
        "syncInterval": MessageLookupByLibrary.simpleMessage("Sync Interval"),
        "syncNow": MessageLookupByLibrary.simpleMessage("Sync Now"),
        "syncSettings": MessageLookupByLibrary.simpleMessage("Sync Settings"),
        "syncingConfiguration":
            MessageLookupByLibrary.simpleMessage("Syncing Configuration"),
        "syncingData": MessageLookupByLibrary.simpleMessage("Syncing Data"),
        "syncingEvents": MessageLookupByLibrary.simpleMessage("Syncing Events"),
        "thisFieldIsRequired":
            MessageLookupByLibrary.simpleMessage("This field is required."),
        "toggleBrightness":
            MessageLookupByLibrary.simpleMessage("Toggle Brightness"),
        "undo": MessageLookupByLibrary.simpleMessage("Undo"),
        "unknownError": m6,
        "user": MessageLookupByLibrary.simpleMessage("user"),
        "userSettings": MessageLookupByLibrary.simpleMessage("User Settings"),
        "username": MessageLookupByLibrary.simpleMessage("Username"),
        "validationError": MessageLookupByLibrary.simpleMessage(
            "Please correct the errors in the form."),
        "valueMustBeGreaterThanOrEqualToError": m7,
        "valueMustBeLessThanOrEqualToError": m8,
        "version": MessageLookupByLibrary.simpleMessage("Version"),
        "viewAvailableForms": MessageLookupByLibrary.simpleMessage(
            "Expand to View Available Forms"),
        "viewList": MessageLookupByLibrary.simpleMessage("View List"),
        "weekly": MessageLookupByLibrary.simpleMessage("Weekly"),
        "year": m9,
        "years": MessageLookupByLibrary.simpleMessage("Years")
      };
}
