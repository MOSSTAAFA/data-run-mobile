// import 'package:d2_remote/shared/models/request_progress.model.dart';
// import 'package:equatable/equatable.dart';

// import '../../../core/arch/call/d2_progress_status.dart';

// /// RequestProgress
// class D2RequestProgress with EquatableMixin {
//   const D2RequestProgress()
//       : resourceName = '',
//         message = '',
//         serverMessage = '',
//         progressStatus = const D2ProgressStatus(),
//         percentage = 0;

//   const D2RequestProgress._(
//       {required this.resourceName,
//       required this.message,
//       this.serverMessage,
//       required this.progressStatus,
//       required this.percentage});

//   D2RequestProgress updateRequestProgress(RequestProgress requestProgress,
//           {bool? isComplete}) =>
//       D2RequestProgress._(
//           resourceName: requestProgress.resourceName,
//           message: requestProgress.message,
//           serverMessage: requestProgress.serverMessage,
//           progressStatus: D2ProgressStatus(
//               isComplete: isComplete ?? requestProgress.percentage == 100,
//               syncStatus: requestProgress.status.toD2ProgressSyncStatus),
//           percentage: requestProgress.percentage);

//   final String resourceName;
//   final String message;
//   final String? serverMessage;
//   final D2ProgressStatus progressStatus;
//   final num percentage;

//   @override
//   List<Object?> get props =>
//       [resourceName, message, serverMessage, progressStatus, percentage];
// }
