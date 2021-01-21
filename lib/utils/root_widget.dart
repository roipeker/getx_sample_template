import 'package:flutter/material.dart';

class RootWidget extends StatelessWidget {
  const RootWidget({Key key, this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    // ImageUtils.imageScale = Get.devicePixelRatio;
    return Builder(builder: (ctx) => RootKeyboardManager(child: child));
  }

  static Widget builder(BuildContext context, Widget screen) =>
      RootWidget(child: screen);
}

/// Manages the softkeyboard closing, forcing unfocus when not touching
/// a TextField if `allowCloseKeyboard=true`.
class RootKeyboardManager extends StatelessWidget {
  final Widget child;

  /// Allow close keyboard on tap
  static bool allowCloseKeyboard = true;

  const RootKeyboardManager({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (allowCloseKeyboard) {
          WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
        }
      },
      child: child,
    );
  }
}
