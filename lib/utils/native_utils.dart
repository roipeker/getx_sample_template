import 'package:get/get.dart';

// import 'package:move_to_background/move_to_background.dart' as bg;
class AppNativeUtils {
  //  reference: https://pub.dev/packages/move_to_background
  static void toBackground() {
    if (GetPlatform.isAndroid) {
      // bg.MoveToBackground.moveTaskToBack();
    }
  }
}
