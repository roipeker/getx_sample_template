import 'dart:ui';

abstract class AppStrings {
  static String appVersion = '1.0.0';

  static const locale = Locale('en', 'US');
  static const appName = 'Getx Template';

  static const String email = 'Email';
  static const String password = 'Password';
  static const String name = 'Name';
  static const String lastname = 'Lastname';
  static const String phone = 'Phone';
  static const String repeatPassword = 'Repeat Password';

  static const String oldPassword = 'previous password';
  static const String newPassword = 'new password';
  static const String repeatNewPassword = 'repeat new password';

  static const String changePassword = 'change password';

  static const profileUserSettingsPasswordWarning =
      // ignore: lines_longer_than_80_chars
      'password must include alphanumeric characters';

  static const String exitDialogText = 'Are you sure to quit?';

  static const String dialogClose = 'CLOSE';
  static const String dialogYes = 'YES';
  static const String dialogNo = 'NO';
  static const String closeSessionDialogTitle = '¿Close Session?';

  static const String accept = 'ACCEPT';

  static const String edit = 'EDIT';
  static const String cancel = 'CANCEL';

  /// profile tabs.
  static const String profileSettings = 'settings';
  static const String profileFavs = 'favs';
  static const String profileStats = 'stats';
  static const String profileSales = 'sales';
}
