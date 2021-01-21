import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app_template/widgets/widgets.dart';

class AppGetUtils {
  static bool isPreloading = false;
  static bool get isSnackbarOpened => _oldSnackStatus != SnackbarStatus.OPEN;
  static SnackbarStatus _oldSnackStatus;

  static Future<void> hidePreloader() async {
    if (!isPreloading) return;
    isPreloading = false;
    if (!Get.isSnackbarOpen) {
      Get.back();
    }
  }

  static Future<void> showPreloader() async {
    if (isPreloading) return;
    isPreloading = true;
    Get.dialog(
      Center(child: PreloaderCircular()),
      barrierDismissible: false,
    );
  }

  static void showError(
    String errors, {
    String title = 'Error:',
    SnackbarStatusCallback onStatus,
  }) {
    if (isPreloading && Get.isDialogOpen) {
      hidePreloader();
    }

    Get.snackbar(
      title,
      errors,
      colorText: Colors.white,
      borderRadius: 0,
      snackbarStatus: (status) {
        _oldSnackStatus = status;
        onStatus?.call(status);
      },
      backgroundColor: Colors.red.shade800,
      icon: Icon(Icons.error, color: Colors.white),
      animationDuration: 0.45.seconds,
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      reverseAnimationCurve: Curves.easeOutExpo,
      overlayColor: Colors.white54,
      overlayBlur: .1,
      margin: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static void showSuccess(
    String message, {
    String title,
    SnackbarStatusCallback onStatus,
  }) {
    if (isPreloading && Get.isDialogOpen) {
      hidePreloader();
    }
    Get.snackbar(
      title,
      message,
      colorText: Colors.white,
      borderRadius: 0,
      backgroundColor: Colors.green.shade800,
      icon: Icon(Icons.check, color: Colors.white),
      snackbarStatus: (status) {
        _oldSnackStatus = status;
        onStatus?.call(status);
      },
      animationDuration: 0.3.seconds,
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      reverseAnimationCurve: Curves.easeOutExpo,
      shouldIconPulse: false,
      margin: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      overlayColor: Colors.white54,
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  /// unfocus current widget.
  static void unfocus() {
    Get.focusScope?.unfocus();
  }

  /// Show Firebase notification.
  static void showFCM({String title, String body}) {
    Get.snackbar(
      title,
      body,
      colorText: Colors.white,
      borderRadius: 0,
      duration: 6.seconds,
      barBlur: 0,
      backgroundColor: Colors.black87,
      icon: Icon(Icons.notification_important, color: Colors.white),
      animationDuration: 0.8.seconds,
      forwardAnimationCurve: Curves.easeOut,
      reverseAnimationCurve: Curves.easeOutExpo,
      shouldIconPulse: true,
      margin: EdgeInsets.zero,
      overlayColor: Colors.black38,
      snackStyle: SnackStyle.GROUNDED,
      snackPosition: SnackPosition.TOP,
    );
  }
}
