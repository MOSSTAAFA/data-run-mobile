// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_editable_status.dart';

// **************************************************************************
// Generator: sealed_generators
// **************************************************************************

/// [EventEditableStatus] {
///
/// ([Editable] editable){} with data equality
///
/// ([NonEditable] nonEditable){[EventNonEditableReason] reason} with data equality
///
/// }
// @SealedManifest(_EventEditableStatus)
abstract class EventEditableStatus {
  const EventEditableStatus._internal();

  const factory EventEditableStatus.editable() = Editable;

  const factory EventEditableStatus.nonEditable({
    required EventNonEditableReason reason,
  }) = NonEditable;

  bool get isEditable => this is Editable;

  bool get isNonEditable => this is NonEditable;

  Editable get asEditable => this as Editable;

  NonEditable get asNonEditable => this as NonEditable;

  Editable? get asEditableOrNull {
    final eventEditableStatus = this;
    return eventEditableStatus is Editable ? eventEditableStatus : null;
  }

  NonEditable? get asNonEditableOrNull {
    final eventEditableStatus = this;
    return eventEditableStatus is NonEditable ? eventEditableStatus : null;
  }

  R when<R extends Object?>({
    required R Function() editable,
    required R Function(EventNonEditableReason reason) nonEditable,
  }) {
    final eventEditableStatus = this;
    if (eventEditableStatus is Editable) {
      return editable();
    } else if (eventEditableStatus is NonEditable) {
      return nonEditable(eventEditableStatus.reason);
    } else {
      throw AssertionError();
    }
  }

  R maybeWhen<R extends Object?>({
    R Function()? editable,
    R Function(EventNonEditableReason reason)? nonEditable,
    required R Function(EventEditableStatus eventEditableStatus) orElse,
  }) {
    final eventEditableStatus = this;
    if (eventEditableStatus is Editable) {
      return editable != null ? editable() : orElse(eventEditableStatus);
    } else if (eventEditableStatus is NonEditable) {
      return nonEditable != null
          ? nonEditable(eventEditableStatus.reason)
          : orElse(eventEditableStatus);
    } else {
      throw AssertionError();
    }
  }

  @Deprecated('Use `whenOrNull` instead. Will be removed by next release.')
  void partialWhen({
    void Function()? editable,
    void Function(EventNonEditableReason reason)? nonEditable,
    void Function(EventEditableStatus eventEditableStatus)? orElse,
  }) {
    final eventEditableStatus = this;
    if (eventEditableStatus is Editable) {
      if (editable != null) {
        editable();
      } else if (orElse != null) {
        orElse(eventEditableStatus);
      }
    } else if (eventEditableStatus is NonEditable) {
      if (nonEditable != null) {
        nonEditable(eventEditableStatus.reason);
      } else if (orElse != null) {
        orElse(eventEditableStatus);
      }
    } else {
      throw AssertionError();
    }
  }

  R? whenOrNull<R extends Object?>({
    R Function()? editable,
    R Function(EventNonEditableReason reason)? nonEditable,
    R Function(EventEditableStatus eventEditableStatus)? orElse,
  }) {
    final eventEditableStatus = this;
    if (eventEditableStatus is Editable) {
      return editable != null ? editable() : orElse?.call(eventEditableStatus);
    } else if (eventEditableStatus is NonEditable) {
      return nonEditable != null
          ? nonEditable(eventEditableStatus.reason)
          : orElse?.call(eventEditableStatus);
    } else {
      throw AssertionError();
    }
  }

  R map<R extends Object?>({
    required R Function(Editable editable) editable,
    required R Function(NonEditable nonEditable) nonEditable,
  }) {
    final eventEditableStatus = this;
    if (eventEditableStatus is Editable) {
      return editable(eventEditableStatus);
    } else if (eventEditableStatus is NonEditable) {
      return nonEditable(eventEditableStatus);
    } else {
      throw AssertionError();
    }
  }

  R maybeMap<R extends Object?>({
    R Function(Editable editable)? editable,
    R Function(NonEditable nonEditable)? nonEditable,
    required R Function(EventEditableStatus eventEditableStatus) orElse,
  }) {
    final eventEditableStatus = this;
    if (eventEditableStatus is Editable) {
      return editable != null
          ? editable(eventEditableStatus)
          : orElse(eventEditableStatus);
    } else if (eventEditableStatus is NonEditable) {
      return nonEditable != null
          ? nonEditable(eventEditableStatus)
          : orElse(eventEditableStatus);
    } else {
      throw AssertionError();
    }
  }

  @Deprecated('Use `mapOrNull` instead. Will be removed by next release.')
  void partialMap({
    void Function(Editable editable)? editable,
    void Function(NonEditable nonEditable)? nonEditable,
    void Function(EventEditableStatus eventEditableStatus)? orElse,
  }) {
    final eventEditableStatus = this;
    if (eventEditableStatus is Editable) {
      if (editable != null) {
        editable(eventEditableStatus);
      } else if (orElse != null) {
        orElse(eventEditableStatus);
      }
    } else if (eventEditableStatus is NonEditable) {
      if (nonEditable != null) {
        nonEditable(eventEditableStatus);
      } else if (orElse != null) {
        orElse(eventEditableStatus);
      }
    } else {
      throw AssertionError();
    }
  }

  R? mapOrNull<R extends Object?>({
    R Function(Editable editable)? editable,
    R Function(NonEditable nonEditable)? nonEditable,
    R Function(EventEditableStatus eventEditableStatus)? orElse,
  }) {
    final eventEditableStatus = this;
    if (eventEditableStatus is Editable) {
      return editable != null
          ? editable(eventEditableStatus)
          : orElse?.call(eventEditableStatus);
    } else if (eventEditableStatus is NonEditable) {
      return nonEditable != null
          ? nonEditable(eventEditableStatus)
          : orElse?.call(eventEditableStatus);
    } else {
      throw AssertionError();
    }
  }
}

/// (([Editable] : [EventEditableStatus]) editable){}
///
/// with data equality
class Editable extends EventEditableStatus with EquatableMixin {
  const Editable() : super._internal();

  @override
  String toString() => 'EventEditableStatus.editable()';

  @override
  List<Object?> get props => [];
}

/// (([NonEditable] : [EventEditableStatus]) nonEditable){[EventNonEditableReason] reason}
///
/// with data equality
class NonEditable extends EventEditableStatus with EquatableMixin {
  const NonEditable({
    required this.reason,
  }) : super._internal();

  final EventNonEditableReason reason;

  @override
  String toString() => 'EventEditableStatus.nonEditable(reason: $reason)';

  @override
  List<Object?> get props => [
        reason,
      ];
}
