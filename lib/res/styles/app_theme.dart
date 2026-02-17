import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hrms_mobile/utils/helpers/extensions.dart';

import 'color_palette.dart';
import 'fonts/inter_font_palette.dart';

class AppTheme {
  static ThemeData get themeData => ThemeData(
    scaffoldBackgroundColor: ColorPalette.white,
    primarySwatch: materialPrimary,
    highlightColor: ColorPalette.primaryColor.mimicOpacityColor(0.03),
    splashColor: ColorPalette.primaryColor.mimicOpacityColor(0.06),
    fontFamily: InterFontPalette.interFontFamily,
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorPalette.primaryColor,
      primary: ColorPalette.primaryColor,
      secondary: ColorPalette.accentColor,
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: ColorPalette.white,
      elevation: 0,
      titleTextStyle: InterFontPalette.fBlack_20_700,
      systemOverlayStyle: Platform.isIOS
          ? SystemUiOverlayStyle.dark
          : SystemUiOverlayStyle.light,
      iconTheme: const IconThemeData(color: ColorPalette.black),
    ),
    brightness: Brightness.light,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: ColorPalette.primaryColor,
    ),
    cardTheme: CardThemeData(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorPalette.primaryColor,
        foregroundColor: ColorPalette.white,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorPalette.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: ColorPalette.grey.withOpacity(0.3)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: ColorPalette.grey.withOpacity(0.3)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: ColorPalette.accentColor, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: ColorPalette.formValidationErrorColor,
        ),
      ),
    ),
  );

  static Color get barrierColor => ColorPalette.black.mimicOpacityColor(0.5);

  static const MaterialColor materialPrimary =
      MaterialColor(0xFF001F54, <int, Color>{
        50: ColorPalette.primaryColor,
        100: ColorPalette.primaryColor,
        200: ColorPalette.primaryColor,
        300: ColorPalette.primaryColor,
        400: ColorPalette.primaryColor,
        500: ColorPalette.primaryColor,
        600: ColorPalette.primaryColor,
        700: ColorPalette.primaryColor,
        800: ColorPalette.primaryColor,
        900: ColorPalette.primaryColor,
      });
}
