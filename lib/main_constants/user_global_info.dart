import 'package:equatable/equatable.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

class AppUserInfo with EquatableMixin {
  final String? uid;
  final String? login;
  final String? fullName;
  final String? mobile;
  final bool isLoggedIn;
  final String local;
  final bool disabled;

//<editor-fold desc="Data Methods">
  const AppUserInfo({
    this.uid,
    this.login,
    this.fullName,
    this.mobile,
    this.isLoggedIn = false,
    this.local = 'ar',
    this.disabled = true,
  });

  @override
  String toString() {
    return 'UserGlobalInfo{' +
        ' login: $login,' +
        ' isLoggedIn: $isLoggedIn,' +
        ' local: $local,' +
        ' disabled: $disabled,' +
        '}';
  }

  AppUserInfo copyWith({
    String? uid,
    String? login,
    String? fullName,
    String? mobile,
    bool? isLoggedIn,
    String? local,
    bool? disabled,
  }) {
    return AppUserInfo(
      uid: uid ?? this.uid,
      login: login ?? this.login,
      fullName: fullName ?? this.fullName,
      mobile: mobile ?? this.mobile,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      local: local ?? this.local,
      disabled: disabled ?? this.disabled,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': this.uid,
      'login': this.login,
      'fullName': this.fullName,
      'mobile': this.mobile,
      'isLoggedIn': this.isLoggedIn,
      'local': this.local,
      'disabled': this.disabled,
    };
  }

  factory AppUserInfo.fromMap(Map<String, dynamic> map) {
    return AppUserInfo(
      uid: map['uid'] as String,
      login: map['login'] as String,
      fullName: map['fullName'] as String,
      mobile: map['mobile'] as String,
      isLoggedIn: map['isLoggedIn'] as bool,
      local: map['local'] as String,
      disabled: map['disabled'] as bool,
    );
  }

  @override
  List<Object?> get props =>
      [uid, login, fullName, mobile, isLoggedIn, local, disabled];

//</editor-fold>
}

class AppUserInfoInheritedWidget extends InheritedWidget {
  const AppUserInfoInheritedWidget({
    Key? key,
    required this.appUserInfo,
    required this.child,
  }) : super(key: key, child: child);
  final AppUserInfo appUserInfo;
  final Widget child;

  static AppUserInfo of(BuildContext context) {
    final AppUserInfoInheritedWidget? inheritedWidget =
        context.dependOnInheritedWidgetOfExactType();
    if (inheritedWidget == null) {
      throw 'No User info found in context.';
    }
    return inheritedWidget.appUserInfo;
  }

  @override
  bool updateShouldNotify(covariant AppUserInfoInheritedWidget oldWidget) =>
      true;
}
