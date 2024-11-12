
class AuthenticatedUser {
  final String id;

  final String uid;

  final bool dirty;

  final String username;

  final String baseUrl;

  //
  // final IList<String> authorities;

  final bool isLoggedIn;

  final String langKey;

  // final bool activated;
  final String? firstName;
  final String? surname;
  final String? phoneNumber;
  final String? email;
  final String? imageUrl;

  final String? token;
  final DateTime? expirationDate;

  // final bool clearUserData;

//<editor-fold desc="Data Methods">
  AuthenticatedUser({
    required this.id,
    required this.uid,
    required this.username,
    required this.baseUrl,
    this.dirty = false,
    // Iterable<String>? authorities,
    this.isLoggedIn = false,
    this.langKey = 'ar',
    // this.activated = false,
    // this.clearUserData = false,
    this.firstName,
    this.surname,
    this.phoneNumber,
    this.email,
    this.imageUrl,
    this.token,
    this.expirationDate,
  }) /*: this.authorities = (IList.orNull(authorities) ?? IList([]))
            .withConfig(IList.defaultConfig.copyWith(cacheHashCode: false))*/
  ;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AuthenticatedUser &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          uid == other.uid &&
          dirty == other.dirty &&
          username == other.username &&
          baseUrl == other.baseUrl &&
          // authorities == other.authorities &&
          isLoggedIn == other.isLoggedIn &&
          langKey == other.langKey &&
          // activated == other.activated &&
          firstName == other.firstName &&
          surname == other.surname &&
          phoneNumber == other.phoneNumber &&
          // clearUserData == other.clearUserData &&
          email == other.email &&
          imageUrl == other.imageUrl &&
          token == other.token &&
          expirationDate == other.expirationDate);

  @override
  int get hashCode =>
      id.hashCode ^
      uid.hashCode ^
      dirty.hashCode ^
      username.hashCode ^
      baseUrl.hashCode ^
      // authorities.hashCode ^
      isLoggedIn.hashCode ^
      langKey.hashCode ^
      // activated.hashCode ^
      firstName.hashCode ^
      surname.hashCode ^
      phoneNumber.hashCode ^
      // clearUserData.hashCode ^
      email.hashCode ^
      imageUrl.hashCode ^
      token.hashCode ^
      expirationDate.hashCode;

  @override
  String toString() {
    return 'AuthenticatedUser{' +
        ' id: $id,' +
        ' uid: $uid,' +
        ' dirty: $dirty,' +
        ' username: $username,' +
        ' baseUrl: $baseUrl,' +
        // ' authorities: $authorities,' +
        ' isLoggedIn: $isLoggedIn,' +
        ' langKey: $langKey,' +
        // ' activated: $activated,' +
        ' firstName: $firstName,' +
        ' surname: $surname,' +
        ' phoneNumber: $phoneNumber,' +
        // ' clearUserData: $clearUserData,' +
        ' email: $email,' +
        ' imageUrl: $imageUrl,' +
        ' token: $token,' +
        ' expirationDate: $expirationDate,' +
        '}';
  }

  AuthenticatedUser copyWith({
    String? id,
    String? uid,
    bool? dirty,
    String? username,
    String? baseUrl,
    // Iterable<String>? authorities,
    bool? isLoggedIn,
    String? langKey,
    // bool? activated,
    String? firstName,
    String? surname,
    String? phoneNumber,
    bool? clearUserData,
    String? email,
    String? imageUrl,
    String? token,
    DateTime? expirationDate,
  }) {
    return AuthenticatedUser(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      dirty: dirty ?? this.dirty,
      username: username ?? this.username,
      baseUrl: baseUrl ?? this.baseUrl,
      // authorities: IList.orNull(authorities)?.withConfig(
      //         IList.defaultConfig.copyWith(cacheHashCode: false)) ??
      //     this.authorities,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      langKey: langKey ?? this.langKey,
      // activated: activated ?? this.activated,
      firstName: firstName ?? this.firstName,
      surname: surname ?? this.surname,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      // clearUserData: clearUserData ?? this.clearUserData,
      email: email ?? this.email,
      imageUrl: imageUrl ?? this.imageUrl,
      token: token ?? this.token,
      expirationDate: expirationDate ?? this.expirationDate, //
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'uid': this.uid,
      'dirty': this.dirty,
      'username': this.username,
      'baseUrl': this.baseUrl,
      // 'authorities': this.authorities.unlock,
      'isLoggedIn': this.isLoggedIn,
      'langKey': this.langKey,
      // 'activated': this.activated,
      'firstName': this.firstName,
      'surname': this.surname,
      'phoneNumber': this.phoneNumber,
      // 'clearUserData': this.clearUserData,
      'email': this.email,
      'imageUrl': this.imageUrl,
      'token': this.token,
      'expirationDate': this.expirationDate?.toUtc().millisecondsSinceEpoch,
    };
  }

  factory AuthenticatedUser.fromMap(Map<String, dynamic> map) {
    return AuthenticatedUser(
      id: map['id'] as String,
      uid: map['uid'] as String,
      dirty: map['dirty'] as bool,
      username: map['username'] as String,
      baseUrl: map['baseUrl'] as String,
      // authorities:
      //     (map['authorities'] as List).map((authority) => authority.authority),
      isLoggedIn: map['isLoggedIn'] as bool,
      langKey: map['langKey'] as String,
      // activated: map['activated'] as bool,
      firstName: map['firstName'] as String?,
      surname: map['surname'] as String?,
      phoneNumber: map['phoneNumber'] as String?,
      // clearUserData: (map['clearUserData'] as bool?) ?? false,
      email: map['email'] as String,
      imageUrl: map['imageUrl'] as String?,
      token: map['token'] as String?,
      // expirationDate: (map['expirationDate'] as int)?.millisecondsSinceEpoch.map()
    );
  }

//</editor-fold>
}
