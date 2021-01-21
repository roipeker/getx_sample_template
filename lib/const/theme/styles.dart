/*
 * Copyright (c) 2020. roipeker™ [Rodrigo López Peker]
 * All rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_app_template/const/const.dart';
import 'app_theme.dart';

// ignore: avoid_classes_with_only_static_members
abstract class Styles {
  static void initSystemOverlay() {
    SystemChrome.setApplicationSwitcherDescription(
        ApplicationSwitcherDescription(
      label: AppStrings.appName,
      primaryColor: primaryColor.value,
    ));
    systemOverlayWhite(navDark: true, statusDark: true);
  }

  static void overlayColor() {
    SystemUiOverlayStyle style;
    style = SystemUiOverlayStyle(statusBarBrightness: Brightness.dark);
    SystemChrome.setSystemUIOverlayStyle(style);
  }

  static void overlayWhite() {
    SystemUiOverlayStyle style;

    /// iOS
    style = SystemUiOverlayStyle(statusBarBrightness: Brightness.light);
    SystemChrome.setSystemUIOverlayStyle(style);
  }

  static SystemUiOverlayStyle defaultSystemOverlayStyle =
      SystemUiOverlayStyle.light;

  static Brightness _darkBrightness([bool value]) {
    if (value == null) return null;
    if (value) {
      return Brightness.dark;
    } else {
      return Brightness.light;
    }
  }

  static void systemOverlayPrimary() {
    if (GetPlatform.isIOS) {
      Styles.overlayWhite();
    } else {
      systemOverlay(
        navColor: primaryColor,
        navIconsBrightness: _darkBrightness(false),
        statusColor: Colors.transparent,
        statusIconsBrightness: _darkBrightness(false),
        baseBrightness: _darkBrightness(false),
      );
    }
  }

  static void systemOverlayWhite({bool statusDark, bool navDark = true}) {
    systemOverlay(
      navColor: Colors.transparent,
      navIconsBrightness: _darkBrightness(navDark),
      statusColor: Colors.transparent,
      statusIconsBrightness: _darkBrightness(statusDark),
      baseBrightness: _darkBrightness(false),
    );
  }

  static void systemOverlay({
    Color statusColor = Colors.transparent,
    Color navColor = Colors.white,
    Brightness baseBrightness,
    Brightness statusIconsBrightness,
    Brightness navIconsBrightness,
  }) {
    SystemUiOverlayStyle _baseUIStyle;
    if (baseBrightness == Brightness.dark) {
      _baseUIStyle = SystemUiOverlayStyle.dark;
    } else if (baseBrightness == Brightness.light) {
      _baseUIStyle = SystemUiOverlayStyle.light;
    }
    final s = _baseUIStyle ?? defaultSystemOverlayStyle;
    final result = s.copyWith(
      statusBarColor: statusColor,
      systemNavigationBarColor: navColor,
      statusBarIconBrightness: statusIconsBrightness,
      statusBarBrightness: statusIconsBrightness,
      systemNavigationBarIconBrightness: navIconsBrightness,
    );
    SystemChrome.setSystemUIOverlayStyle(result);
  }

  static Future<void> showSystemOverlay({
    bool showTop = true,
    bool showBottom = true,
  }) {
    return SystemChrome.setEnabledSystemUIOverlays([
      if (showTop ?? true) SystemUiOverlay.top,
      if (showBottom ?? true) SystemUiOverlay.bottom,
    ]);
  }

  static ThemeData get light => lightTheme;
  static ThemeData get dark => darkTheme;

  static const green = Color(0xff61D34C);
  static const primaryColor = green;
  static const lightGrey = Color(0xffACACAC);
  static const buttonSplashColor = Color(0x1262D34C);
  static const circularProgress = primaryColor;
  static const dividerGray = Color(0x70ACACAC);
  static const darkGrey = Color(0xff808080);
  static const accesoryGrey = Color(0xffD1D1D1);
  static const itemBgGrey = Color(0xffe8e8e8);

  static void toggleTheme() {
    Get.changeThemeMode(
      Get.isDarkMode ? ThemeMode.light : ThemeMode.dark,
    );
  }

  static const compraListHeaderTitleTextStyle = TextStyle(
    color: Styles.darkGrey,
    fontSize: 13,
    fontWeight: FontWeight.w500,
  );

  static const compraListDateTextStyle = TextStyle(
    color: Styles.darkGrey,
    fontSize: 13,
    fontWeight: FontWeight.w400,
  );

  static const compraListComercioTextStyle = TextStyle(
    color: Styles.darkGrey,
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );

  /// TEXT STYLES
  static const membresiaItemTitleTextStyle = TextStyle(
    color: Styles.darkGrey,
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );

  static const ventasTitutlo1 = TextStyle(
    color: Styles.primaryColor,
    fontSize: 17,
    fontWeight: FontWeight.w900,
  );
  static const ventasTitutlo2 = TextStyle(
      color: Styles.darkGrey,
      fontSize: 17,
      fontWeight: FontWeight.w500,
      letterSpacing: .3);

  static const ventasSmallCopy = TextStyle(
    color: Styles.darkGrey,
    fontSize: 12,
    height: 1.7,
    fontWeight: FontWeight.w400,
  );

  /// status bar styles
  static SystemUiOverlayStyle lastSavedState;
  static SystemUiOverlayStyle saveStatusbarState() {
    lastSavedState = SystemChrome?.latestStyle;
    return lastSavedState;
  }

  static void restoreStatusbarState() {
    SystemChrome.setSystemUIOverlayStyle(lastSavedState);
  }

  static void statusIconsB() {
    if (GetPlatform.isAndroid) {
    } else if (GetPlatform.isIOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
        ),
      );
    }
  }

  static void statusIconsW() {
    if (GetPlatform.isAndroid) {
    } else if (GetPlatform.isIOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
        ),
      );
    }
  }
}
