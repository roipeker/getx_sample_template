import 'package:flutter/material.dart';

import 'styles.dart';

final _base = ThemeData.light();
final _baseDark = ThemeData.dark();

final colorScheme = ColorScheme.fromSwatch(
  brightness: Brightness.light,
  accentColor: Styles.primaryColor,
  primarySwatch: Colors.green,
  backgroundColor: Colors.white,
);

final colorSchemeDark = ColorScheme.fromSwatch(
  brightness: Brightness.dark,
  accentColor: Styles.primaryColor,
  primarySwatch: Colors.green,
);

final lightTheme = _base.copyWith(
    colorScheme: colorScheme,
    disabledColor: Styles.lightGrey,
    textTheme: _base.textTheme.copyWith(
      headline5: _base.textTheme.headline5.copyWith(
        color: Styles.darkGrey,
        fontSize: 17,
        fontWeight: FontWeight.w500,
        letterSpacing: -.07,
      ),
    ),
    primaryColor: Styles.primaryColor,
    accentColor: Styles.primaryColor,
    buttonTheme: _base.buttonTheme.copyWith(
      colorScheme: colorScheme,
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Styles.lightGrey)),
    ));

final darkTheme = _baseDark.copyWith(
  colorScheme: colorSchemeDark,
  primaryColor: Styles.primaryColor,
  accentColor: Styles.primaryColor,
  buttonTheme: _base.buttonTheme.copyWith(
    colorScheme: colorSchemeDark,
  ),
);
