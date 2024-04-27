import 'package:d2_remote/shared/entities/identifiable.entity.dart';
import 'package:d2_remote/shared/queries/base.query.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../main/usescases/login/login_screen.widget.dart';
import '../constants.dart';

part 'ui_state.freezed.dart';

@freezed
class UIState with _$UIState {
  const factory UIState({
    required String currentRoute,
    // required int selectedCompanyIndex,
    required int filterClearedAt,
    required int lastActivityAt,
    required String previousRoute,
    required List<BaseQuery<IdentifiableEntity>> previewStack,
    required List<IdentifiableEntity> filterStack,
    BaseQuery<IdentifiableEntity>? loadingEntityType,
    String? filter,
  }) = _UIState;

  factory UIState.initial({
    String? currentRoute,
    // required int selectedCompanyIndex,
    int? filterClearedAt,
    int? lastActivityAt,
    String? previousRoute,
    List<BaseQuery<IdentifiableEntity>>? previewStack,
    List<IdentifiableEntity>? filterStack,
    BaseQuery<IdentifiableEntity>? loadingEntityType,
    String? filter,
    // Map<BaseQuery, PrefStateSortField>? sortFields
  }) =>
      UIState(
        // selectedCompanyIndex: 0,
        filterClearedAt: filterClearedAt ?? 0,
        lastActivityAt: lastActivityAt ?? 0,
        currentRoute: currentRoute ?? LoginScreen.route,
        previousRoute: previousRoute ?? '',
        previewStack: previewStack ?? <BaseQuery<IdentifiableEntity>>[],
        filterStack: filterStack ?? <IdentifiableEntity>[],
        loadingEntityType: loadingEntityType,
      );

  const UIState._();

  // @override
  // // @memoized
  // int get hashCode;

  // int get selectedCompanyIndex;

  @override
  String get currentRoute;

  @override
  String get previousRoute;

  @override
  BaseQuery<IdentifiableEntity>? get loadingEntityType;

  @override
  List<BaseQuery<IdentifiableEntity>> get previewStack;

  @override
  List<IdentifiableEntity> get filterStack;

  IdentifiableEntity get filterEntity => filterStack.last;

  String? get filterEntityId =>
      filterStack.isEmpty ? null : filterEntity.id.toString();

  // BaseQuery? get filterEntityType =>
  //     filterStack.isEmpty ? null : filterEntity.entityType;

  @override
  String? get filter;

  @override
  int get filterClearedAt;

  @override
  int get lastActivityAt;

  bool containsRoute(String? route) {
    if (route == null || route.isEmpty) {
      return false;
    }
    return currentRoute.contains(route);
  }

  // BaseQuery get entityTypeRoute {
  //   final entityType = mainRoute.replaceFirst('/', '');
  //   return EntityType.valueOf(toCamelCase(entityType));
  // }

  String get mainRoute {
    final parts =
        currentRoute.split('/').where((part) => part.isNotEmpty).toList();
    return parts.isNotEmpty ? parts[0] : '';
  }

  String get subRoute {
    final parts =
        currentRoute.split('/').where((part) => part.isNotEmpty).toList();
    if (parts.length == 3) {
      return '${parts[1]}/${parts[2]}';
    } else {
      return parts.length > 1 ? parts[1] : '';
    }
  }

  String get baseRoute {
    String route = currentRoute;
    route = route.replaceAll('/edit', '');
    route = route.replaceAll('/view', '');
    route = route.replaceAll('/pdf', '');
    route = route.replaceAll('/email', '');
    return route;
  }

  String get baseSubRoute {
    String route = subRoute;
    route = route.replaceAll('/edit', '');
    route = route.replaceAll('/view', '');
    route = route.replaceAll('/pdf', '');
    route = route.replaceAll('/email', '');
    return route;
  }

  String get previousMainRoute {
    final parts =
        previousRoute.split('/').where((part) => part.isNotEmpty).toList();
    return parts.isNotEmpty ? parts[0] : '';
  }

  String get previousSubRoute {
    final parts =
        previousRoute.split('/').where((part) => part.isNotEmpty).toList();
    return parts.length > 1 ? parts[1] : '';
  }

  bool get isEditing =>
      currentRoute.endsWith('/edit') || currentRoute.endsWith('refund');

  bool get isEmailing => currentRoute.endsWith('/email');

  bool get isPDF => currentRoute.endsWith('/pdf');

  bool get isViewing => !isEditing && !isEmailing;

  bool get isInSettings => currentRoute.startsWith('/settings');

  bool get isPreviewing => previewStack.isNotEmpty;

  bool get isList => !isEditing && !isEmailing && !isPDF && !isInSettings;

  bool get hasRecentActivity {
    if (lastActivityAt == 0) {
      return false;
    }

    return DateTime.now().millisecondsSinceEpoch - lastActivityAt <
        kMillisecondsToRefreshStaticData;
  }
}
