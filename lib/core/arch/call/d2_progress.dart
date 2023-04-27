// DH Value Class
import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

class D2Progress with EquatableMixin {
  D2Progress({
    String? message,
    String? serverMessage,
    bool? isComplete,
    this.totalCalls,
    num? percentage,
    IList<String>? doneCalls,
  })  : message = message ?? '',
        serverMessage = serverMessage ?? '',
        isComplete = isComplete ?? false,
        percentage = percentage ?? 0,
        doneCalls = IList.orNull(doneCalls) ?? IList();

  static D2Progress empty(int? totalCalls) {
    if (totalCalls != null && totalCalls < 0) {
      throw ArgumentError('Negative total calls');
    }
    return D2Progress(
        isComplete: totalCalls != null && totalCalls == 0,
        totalCalls: totalCalls,
        doneCalls: IList());
  }

  final String? message;
  final String? serverMessage;
  final bool? isComplete;
  final int? totalCalls;
  final IList<String>? doneCalls;

  D2Progress copyWith({
    String? message,
    String? serverMessage,
    bool? isComplete,
    int? totalCalls,
    num? percentage,
    IList<String>? doneCalls,
  }) {
    return D2Progress(
        message: message ?? this.message,
        serverMessage: serverMessage ?? this.serverMessage,
        isComplete: isComplete ?? this.isComplete,
        totalCalls: totalCalls ?? this.totalCalls,
        percentage: percentage ?? this.percentage,
        doneCalls: IList.orNull(doneCalls) ?? this.doneCalls);
  }

  String? get lastCall {
    if (doneCalls?.isNotEmpty ?? false) {
      return doneCalls![doneCalls!.length - 1];
    }
    return null;
  }

  final num percentage;

  @override
  List<Object?> get props =>
      [message, serverMessage, isComplete, totalCalls, doneCalls, percentage];
}
