// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../global_functions/global_functions.dart';
import '../../utils/view_actions.dart';

part 'nav_info_notifier.g.dart';

@riverpod
class NavInfoNotifier extends _$NavInfoNotifier {
  // Object? key;

  @override
  NavigationInfo build() {
    // this.key = key;
    return const NavigationInfo();
  }

  /// set index(int x)
  void selectTabIndex(int index) {
    state = state.copyWith(index: index);
  }

  void selectTabView(ViewAction viewAction) {}

  void hideBottomNavBar([bool? hide]) {
    state = state.copyWith(hideBottomNavBar: hide ?? !state.hideBottomNavBar);
  }

  void hideActionBtn([bool? hide]) {
    state = state.copyWith(hideActionBtn: hide ?? !state.hideActionBtn);
  }

// // pop routes from the nested navigator stack and not the main stack
// // this is done based on the currentIndex of the bottom navbar
// // if the backButton is pressed on the initial route the app will be terminated
// FutureOr<bool> onBackButtonPressed() async {
//   bool exitingApp = true;
//   switch (state.index) {
//     case 0:
//       if (homeKey.currentState != null && homeKey.currentState!.canPop()) {
//         homeKey.currentState!.pop();
//         exitingApp = false;
//       }
//       break;
//     case 1:
//       if (productsKey.currentState != null &&
//           productsKey.currentState!.canPop()) {
//         productsKey.currentState!.pop();
//         exitingApp = false;
//       }
//       break;
//     case 2:
//       if (profileKey.currentState != null &&
//           profileKey.currentState!.canPop()) {
//         profileKey.currentState!.pop();
//         exitingApp = false;
//       }
//       break;
//     default:
//       return false;
//   }
//   if (exitingApp) {
//     return true;
//   } else {
//     return false;
//   }
// }

// // pops all routes except first, if there are more than 1 route in each navigator stack
// void popAllRoutes(int index) {
//   switch (index) {
//     case 0:
//       if (homeKey.currentState!.canPop()) {
//         homeKey.currentState!.popUntil((route) => route.isFirst);
//       }
//       return;
//     case 1:
//       if (productsKey.currentState!.canPop()) {
//         productsKey.currentState!.popUntil((route) => route.isFirst);
//       }
//       return;
//     case 2:
//       if (profileKey.currentState!.canPop()) {
//         profileKey.currentState!.popUntil((route) => route.isFirst);
//       }
//       return;
//     default:
//       break;
//   }
// }
}

class NavigationInfo with EquatableMixin {
  const NavigationInfo(
      [this.index = 0,
      this.hideBottomNavBar = false,
      this.hideActionBtn = false]);

  final int index;
  final bool hideBottomNavBar;
  final bool hideActionBtn;

  @override
  List<Object?> get props => [index, hideBottomNavBar, hideActionBtn];

  NavigationInfo copyWith({
    int? index,
    bool? hideBottomNavBar,
    bool? hideActionBtn,
  }) {
    return NavigationInfo(
      index ?? this.index,
      hideBottomNavBar ?? this.hideBottomNavBar,
      hideActionBtn ?? this.hideActionBtn,
    );
  }

  @override
  String toString() {
    return mapPropsToString(runtimeType, ['index: $index']);
  }
}
