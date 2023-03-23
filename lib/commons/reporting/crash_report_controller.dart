abstract class CrashReportController {
  void trackUser(String? user, String? server);

  void trackServer(String? server);

  void trackError(Exception exception, String? message);

  void logMessage(String message);

  void addBreadCrumb(String category, String message);
}