import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../color_palette.dart';

class PlusJakartaSansFontPalette {
  static const String plusJakartaSansFamily = "PlusJakartaSans";

  //! 🔹 Base styles by weight
  static TextStyle base400(
    double fontSize, {
    Color color = ColorPalette.black,
    Gradient? gradient,
    double? height,
    double? letterSpacing,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontFamily: plusJakartaSansFamily,
      fontSize: fontSize.sp,
      fontWeight: FontWeight.w400,
      color: gradient == null ? color : null,
      foreground: gradient != null
          ? (Paint()
              ..shader = gradient.createShader(Rect.fromLTWH(0, 0, 200, 70)))
          : null,
      height: height,
      letterSpacing: letterSpacing,
      decoration: decoration,
    );
  }

  static TextStyle base500(
    double fontSize, {
    Color color = ColorPalette.black,
    Gradient? gradient,
    double? height,
    double? letterSpacing,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontFamily: plusJakartaSansFamily,
      fontSize: fontSize.sp,
      fontWeight: FontWeight.w500,
      color: gradient == null ? color : null,
      foreground: gradient != null
          ? (Paint()
              ..shader = gradient.createShader(Rect.fromLTWH(0, 0, 200, 70)))
          : null,
      height: height,
      letterSpacing: letterSpacing,
      decoration: decoration,
    );
  }

  static TextStyle base600(
    double fontSize, {
    Color color = ColorPalette.black,
    Gradient? gradient,
    double? height,
    double? letterSpacing,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontFamily: plusJakartaSansFamily,
      fontSize: fontSize.sp,
      fontWeight: FontWeight.w600,
      color: gradient == null ? color : null,
      foreground: gradient != null
          ? (Paint()
              ..shader = gradient.createShader(Rect.fromLTWH(0, 0, 200, 70)))
          : null,
      height: height,
      letterSpacing: letterSpacing,
      decoration: decoration,
    );
  }

  static TextStyle base700(
    double fontSize, {
    Color color = ColorPalette.black,
    Gradient? gradient,
    double? height,
    double? letterSpacing,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontFamily: plusJakartaSansFamily,
      fontSize: fontSize.sp,
      fontWeight: FontWeight.w700,
      color: gradient == null ? color : null,
      foreground: gradient != null
          ? (Paint()
              ..shader = gradient.createShader(Rect.fromLTWH(0, 0, 200, 70)))
          : null,
      height: height,
      letterSpacing: letterSpacing,
      decoration: decoration,
    );
  }

  /*<--- PLUS JAKARTA SANS STYLES --->*/

  /*<---10--->*/
  static TextStyle get f616068_10_400 =>
      base400(10, color: ColorPalette.f616068);

  /*<---11--->*/
  static TextStyle get fWhite_28_600 => base600(28, color: ColorPalette.white);

  static TextStyle get fWhite_11_500 => base500(11, color: ColorPalette.white);

  /*<---16--->*/
  static TextStyle get fWhite_16_600 => base600(16, color: ColorPalette.white);

  static TextStyle get f489F53_16_500 =>
      base500(16, color: ColorPalette.f489F53);

  static TextStyle get fWhite_18_600 => base600(18, color: ColorPalette.white);

  static TextStyle get fWhite_20_600 => base600(20, color: ColorPalette.white);
  /*<---56--->*/
  static TextStyle get fWhite_56_700 =>
      base700(56, color: ColorPalette.white, height: 1.0);
  /*<---32--->*/
  static TextStyle get f0E0F0C_32_700 =>
      base700(32, color: ColorPalette.primaryColorDark);
  static TextStyle get f0E0F0C_28_700 =>
      base700(28, color: ColorPalette.primaryColorDark);
  static TextStyle get f0E0F0C_32_700_2 => base700(
    32,
    color: ColorPalette.primaryColorDark,
    letterSpacing: -1,
    height: 1.2,
  );

  static TextStyle get f0E0F0C_32_700_1_2sp =>
      base700(32, color: ColorPalette.primaryColorDark, height: 1.2);

  static TextStyle get f0E0F0C_32_700_1_0sp =>
      base700(32, color: ColorPalette.primaryColorDark, height: 1.0);

  static TextStyle get fBlack_18_700 => base700(18, color: ColorPalette.black);

  static TextStyle get fBlack_16_500 => base500(16, color: ColorPalette.black);

  static TextStyle get f0E0F0C_34_700_1sp =>
      base700(34, color: ColorPalette.primaryColorDark, height: 1.0);

  static TextStyle get fWhite_28_700_1sp =>
      base700(28, color: ColorPalette.white, height: 1.0);

  static TextStyle get f0E0F0C_40_700 =>
      base700(40, color: ColorPalette.f0E0F0C);

  static TextStyle get fWhite_32_700 =>
      base700(32, color: ColorPalette.white, height: 1.2);

  /*<---10--->*/
  static TextStyle get f0E0F0C_20_700 => base700(20, color: Color(0XFF0E0F0C));

  /*<---28--->*/
  static TextStyle get fWhite_28_700 => base700(28, color: ColorPalette.white);

  /*<---22--->*/
  static TextStyle get fBlack_22_700 => base700(22, color: ColorPalette.black);

  /*<--- MERGED INTER STYLES --->*/

  /*<---10--->*/
  static final TextStyle fBlack_10_500 = base500(10, color: ColorPalette.black);
  static final TextStyle f767676_10_400 = base400(
    10,
    color: ColorPalette.f767676,
  );

  /*<---11--->*/
  static final TextStyle f378241_11_600 = base600(
    11,
    color: ColorPalette.f378241,
  );
  static final TextStyle fE53B40_11_600 = base600(
    11,
    color: ColorPalette.fE53B40,
  );
  static final TextStyle fB0B0B0_11_400 = base400(
    11,
    color: ColorPalette.fB0B0B0,
  );

  /*<---12--->*/
  static final TextStyle f767676_12_400 = base400(
    12,
    color: ColorPalette.f767676,
  );
  static final TextStyle fBlack_12_400 = base400(12, color: ColorPalette.black);
  static final TextStyle fFF0000_12_400 = base400(
    12,
    color: ColorPalette.fFF0000,
  );

  static final TextStyle f6A7282_12_400 = base400(
    12,
    color: ColorPalette.f6A7282,
  );
  static final TextStyle f6A7282_12_500 = base500(
    12,
    color: ColorPalette.f6A7282,
  );
  static final TextStyle fBlack_12_500 = base500(12, color: ColorPalette.black);
  static final TextStyle fD1D1D1_12_400 = base400(12, color: Color(0xFFD1D1D1));
  static final TextStyle f489F53_12_500 = base500(12, color: Color(0xFF489F53));
  static final TextStyle f489F53_12_600 = base600(12, color: Color(0xFF489F53));
  static final TextStyle fWhite_12_400 = base400(12, color: ColorPalette.white);
  static final TextStyle fWhite_12_600 = base600(12, color: ColorPalette.white);
  static final TextStyle f6F6F6F_12_400 = base400(12, color: Color(0xFF6F6F6F));
  static final TextStyle f5D5D5D_12_400 = base400(12, color: Color(0xFF5D5D5D));
  static final TextStyle f888888_12_400 = base400(12, color: Color(0xFF888888));
  static final TextStyle f6D6D6D_12_400 = base400(
    12,
    color: ColorPalette.f6D6D6D,
  );
  static final TextStyle f0E0F0C_12_400 = base400(
    12,
    color: ColorPalette.f0E0F0C,
  );
  static final TextStyle f0E0F0C_12_600 = base600(
    12,
    color: ColorPalette.f0E0F0C,
  );
  static final TextStyle f4F4F4F_12_400 = base400(
    12,
    color: ColorPalette.f4F4F4F,
  );
  static final TextStyle f99A1AF_12_400 = base400(
    12,
    color: ColorPalette.f99A1AF,
  );
  static final TextStyle fBlack_12_600 = base600(12, color: ColorPalette.black);
  static final TextStyle fSecondary_12_600 = base600(
    12,
    color: ColorPalette.secondaryColor,
  );
  static final TextStyle f3D3D3D_12_600 = base600(12, color: Color(0xFF3D3D3D));
  static final TextStyle f3D3D3D_12_400 = base400(12, color: Color(0xFF3D3D3D));
  static final TextStyle f1B351F_12_600 = base600(12, color: Color(0xFF1B351F));

  /*<---13--->*/
  static final TextStyle f6D6D6D_13_400 = TextStyle(
    fontFamily: PlusJakartaSansFontPalette.plusJakartaSansFamily,
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    color: ColorPalette.f6D6D6D,
  );
  static final TextStyle fBlack_13_400 = TextStyle(
    fontFamily: PlusJakartaSansFontPalette.plusJakartaSansFamily,
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    color: ColorPalette.black,
  );
  static final TextStyle fBlack_13_600 = TextStyle(
    decoration: TextDecoration.underline,
    fontFamily: PlusJakartaSansFontPalette.plusJakartaSansFamily,
    fontSize: 13.sp,
    fontWeight: FontWeight.w600,
    color: ColorPalette.black,
  );

  /*<---14--->*/

  static final TextStyle f00A63E_14_400 = TextStyle(
    fontFamily: PlusJakartaSansFontPalette.plusJakartaSansFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: ColorPalette.f00A63E,
  );

  static final TextStyle f0098FF_14_400 = TextStyle(
    fontFamily: PlusJakartaSansFontPalette.plusJakartaSansFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: ColorPalette.f0098FF,
  );

  static final TextStyle f0098FF_14_600 = TextStyle(
    fontFamily: PlusJakartaSansFontPalette.plusJakartaSansFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: ColorPalette.f0098FF,
  );

  static final TextStyle f009689_14_400 = TextStyle(
    fontFamily: PlusJakartaSansFontPalette.plusJakartaSansFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: ColorPalette.f009689,
  );
  static final TextStyle fFF2727_14_500 = TextStyle(
    fontFamily: PlusJakartaSansFontPalette.plusJakartaSansFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: ColorPalette.fFF2727,
  );
  static final TextStyle fWhite_14_600 = TextStyle(
    fontFamily: PlusJakartaSansFontPalette.plusJakartaSansFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
  static final TextStyle fWhitelsMinus_2_14_600 = TextStyle(
    fontFamily: PlusJakartaSansFontPalette.plusJakartaSansFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    letterSpacing: -0.4,
  );
  static final TextStyle fWhite_14_500 = TextStyle(
    fontFamily: PlusJakartaSansFontPalette.plusJakartaSansFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
  static final TextStyle f5D5D5D_14_400 = TextStyle(
    fontFamily: PlusJakartaSansFontPalette.plusJakartaSansFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: Color(0xFF5D5D5D),
  );

  static final TextStyle f6C7278_14_500 = TextStyle(
    fontFamily: PlusJakartaSansFontPalette.plusJakartaSansFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: Color(0xFF6C7278),
  );
  static final TextStyle f6D6D6D_14_400 = TextStyle(
    fontFamily: PlusJakartaSansFontPalette.plusJakartaSansFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: Color(0xFF6D6D6D),
  );
  static final TextStyle f6D6D6D_14_500 = TextStyle(
    fontFamily: PlusJakartaSansFontPalette.plusJakartaSansFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: Color(0xFF6D6D6D),
  );
  static final TextStyle f1B351F_14_600 = TextStyle(
    fontFamily: PlusJakartaSansFontPalette.plusJakartaSansFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: ColorPalette.f1B351F,
  );
  static final TextStyle fB0B0B0_14_600 = TextStyle(
    fontFamily: PlusJakartaSansFontPalette.plusJakartaSansFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: Color(0xFFB0B0B0),
  );
  static final TextStyle f0E0F0C_14_600 = TextStyle(
    fontFamily: PlusJakartaSansFontPalette.plusJakartaSansFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: ColorPalette.f0E0F0C,
  );
  static final TextStyle fB0B0B0_14_500 = TextStyle(
    fontFamily: PlusJakartaSansFontPalette.plusJakartaSansFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: ColorPalette.fB0B0B0,
  );
  static final TextStyle f1D5BFE_14_600 = TextStyle(
    fontFamily: PlusJakartaSansFontPalette.plusJakartaSansFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: ColorPalette.f1D5BFE,
  );
  static final TextStyle f498605_14_500 = TextStyle(
    fontFamily: PlusJakartaSansFontPalette.plusJakartaSansFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: ColorPalette.f498605,
  );
  static final TextStyle f9FD6A6_14_500 = TextStyle(
    fontFamily: PlusJakartaSansFontPalette.plusJakartaSansFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: ColorPalette.f9FD6A6,
  );
  static final TextStyle f888888_14_500 = TextStyle(
    fontFamily: PlusJakartaSansFontPalette.plusJakartaSansFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: ColorPalette.f888888,
  );
  static final TextStyle f378241_14_500 = TextStyle(
    fontFamily: PlusJakartaSansFontPalette.plusJakartaSansFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: ColorPalette.f378241,
  );
  static final TextStyle f4F4F4F_14_400 = TextStyle(
    fontFamily: PlusJakartaSansFontPalette.plusJakartaSansFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: ColorPalette.f4F4F4F,
  );
  static final TextStyle f4F4F4F_14_500 = TextStyle(
    fontFamily: PlusJakartaSansFontPalette.plusJakartaSansFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: ColorPalette.f4F4F4F,
  );
  static final TextStyle f4F4F4F_14_600 = TextStyle(
    fontFamily: PlusJakartaSansFontPalette.plusJakartaSansFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: ColorPalette.f4F4F4F,
  );
  static final TextStyle fBD1A0F_14_500 = TextStyle(
    fontFamily: PlusJakartaSansFontPalette.plusJakartaSansFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: ColorPalette.fBD1A0F,
  );
  static final TextStyle fBlacklsMinus_2_14_500 = TextStyle(
    fontFamily: PlusJakartaSansFontPalette.plusJakartaSansFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: ColorPalette.black,
    letterSpacing: -0.2,
  );
  static final TextStyle f454545lsMinus_2_14_500 = TextStyle(
    fontFamily: PlusJakartaSansFontPalette.plusJakartaSansFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: ColorPalette.f454545,
    letterSpacing: -0.2,
  );
  static final TextStyle fBlackLetterSpacingMinus_1_14_500 = TextStyle(
    fontFamily: PlusJakartaSansFontPalette.plusJakartaSansFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: ColorPalette.black,
    letterSpacing: -1,
  );
  static final TextStyle fBlack_14_400 = TextStyle(
    fontFamily: PlusJakartaSansFontPalette.plusJakartaSansFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: ColorPalette.black,
  );
  static final TextStyle fBlack_14_500 = TextStyle(
    fontFamily: PlusJakartaSansFontPalette.plusJakartaSansFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: ColorPalette.black,
  );
  static final TextStyle fSecondary_14_400 = TextStyle(
    fontFamily: PlusJakartaSansFontPalette.plusJakartaSansFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: ColorPalette.secondaryColor,
  );
  static final TextStyle fSecondary_14_600 = base600(
    14,
    color: ColorPalette.secondaryColor,
  );
  static final TextStyle fED6802_14_400 = base400(
    14,
    color: ColorPalette.fED6802,
  );
  static final TextStyle f191B1E_14_500 = base500(
    14,
    color: ColorPalette.f191B1E,
  );
  static final TextStyle f191B1E_14_600 = base600(
    14,
    color: ColorPalette.f191B1E,
  );
  static final TextStyle fBlack_14_600 = base600(14, color: ColorPalette.black);
  static final TextStyle fB0B0B0_14_400 = base400(
    14,
    color: ColorPalette.fB0B0B0,
  );
  static final TextStyle f489F53_14_500 = base500(14, color: Color(0xFF489F53));
  static final TextStyle f0E0F0C_14_500 = base500(14, color: Color(0xFF0E0F0C));
  static final TextStyle f0E0F0C_14_400 = base400(14, color: Color(0xFF0E0F0C));
  static final TextStyle f3D3D3D_14_500 = base500(14, color: Color(0xFF3D3D3D));
  static final TextStyle f3D3D3D_14_400 = base400(14, color: Color(0xFF3D3D3D));
  static final TextStyle f1B351F_14_500 = base500(14, color: Color(0xFF1B351F));
  static final TextStyle f5D5D5D_14_500 = base500(14, color: Color(0xFF5D5D5D));
  static final TextStyle f489F53_14_600 = base600(14, color: Color(0xFF489F53));

  /*<---15--->*/
  static final TextStyle fBlack_15_400 = base400(15, color: ColorPalette.black);
  static final TextStyle f0E0F0C_15_400 = base400(15, color: Color(0xFF0E0F0C));

  /*<---16--->*/
  static final TextStyle fD1D1D1_16_400 = base400(16, color: Color(0xFFD1D1D1));
  static final TextStyle f6D6D6D_16_500 = base500(16, color: Color(0xFF6D6D6D));
  static final TextStyle fE53B40_16_500 = base500(
    16,
    color: ColorPalette.fE53B40,
  );
  static final TextStyle fBlack_16_600 = base600(16, color: ColorPalette.black);
  static final TextStyle fBlack_16_400 = base400(16, color: ColorPalette.black);
  static final TextStyle f4F4F4F_16_600 = base600(
    16,
    color: ColorPalette.f4F4F4F,
  );
  static final TextStyle fBlack_16_700 = base700(16, color: ColorPalette.black);
  static final TextStyle f489F53_16_500_merged = base500(
    // Renamed to avoid alias with getter
    16,
    color: ColorPalette.f489F53,
  );
  static final TextStyle fSecondary_16_500 = base500(
    16,
    color: ColorPalette.secondaryColor,
  );
  static final TextStyle f489F53_16_600 = base600(
    16,
    color: ColorPalette.f489F53,
  );
  static final TextStyle fWhite_16_400 = base400(16, color: ColorPalette.white);
  static final TextStyle fWhite_16_500 = base500(16, color: ColorPalette.white);
  static final TextStyle fB0B0B0_16_500 = base500(
    16,
    color: ColorPalette.fB0B0B0,
  );
  static final TextStyle f0E0F0C_16_600 = base600(16, color: Color(0xFF0E0F0C));

  static final fSecondary_16_600 = base600(
    16,
    color: ColorPalette.secondaryColor,
  );
  static final TextStyle f1B351F_16_600 = base600(16, color: Color(0xFF1B351F));
  static final TextStyle f0E0F0C_16_500 = base500(16, color: Color(0xFF0E0F0C));
  static final TextStyle f0E0F0C_16_400_1_2sp = base400(
    16,
    color: Color(0xFF0E0F0C),
    height: 1.2.sp,
  );
  static final TextStyle f0E0F0C_16_500_1_2sp = base500(
    16,
    color: Color(0xFF0E0F0C),
    height: 1.2.sp,
  );
  static final TextStyle fC5FF71_16_600 = base600(
    16,
    color: ColorPalette.fC5FF71,
  );
  static final TextStyle fE53B40_16_600 = base600(
    16,
    color: ColorPalette.fE53B40,
  );
  static final TextStyle f191B1E_16_500 = base500(
    16,
    color: ColorPalette.f191B1E,
  );
  static final TextStyle f191B1E_16_600 = base600(
    16,
    color: ColorPalette.f191B1E,
  );

  /*<---18--->*/
  static final TextStyle f191B1E_18_500 = base500(
    18,
    color: ColorPalette.f191B1E,
  );
  static final TextStyle f191B1E_18_700 = base700(
    18,
    color: ColorPalette.f191B1E,
  );
  static final TextStyle f0E0F0C_18_600 = base600(
    18,
    color: ColorPalette.f0E0F0C,
  );
  static final TextStyle fBlack_18_600 = base600(18, color: ColorPalette.black);
  static final TextStyle fBlack_18_600LS01 = base600(
    18,
    letterSpacing: 0.1.sp,
    color: Colors.black,
  );
  static final TextStyle fBlack_14_400LS01 = base600(
    18,
    letterSpacing: 0.1.sp,
    color: Colors.black,
  );

  /*<---20--->*/
  static final TextStyle f0E0F0C_20_500 = base500(
    20,
    color: ColorPalette.f0E0F0C,
  );

  static final TextStyle fBlack_20_700 = base700(20, color: ColorPalette.black);

  /*<---22--->*/
  static final TextStyle fBlack_22_700_merged = base700(
    // Renamed to avoid alias
    22,
    color: ColorPalette.black,
  );

  /*<---25--->*/
  static final TextStyle f0E0F0C_25_600 = base600(
    25,
    color: ColorPalette.f0E0F0C,
  );
  static final TextStyle fBlack_25_700 = base700(
    25,
    letterSpacing: 0,
    color: ColorPalette.f0E0F0C,
  );
  static final TextStyle fBlack_25_600 = base600(
    25,
    letterSpacing: 0,
    color: ColorPalette.f0E0F0C,
  );
  static final TextStyle fWhite_25_600_1_9sp = base600(
    25,
    color: ColorPalette.white,
    height: 1.9,
  );

  /*<---28--->*/
  static final TextStyle fBlack_28_700 = base700(28, color: ColorPalette.black);
  static final TextStyle f101828_28_700 = base700(
    28,
    color: ColorPalette.f101828,
  );

  /*<---32--->*/
  static final TextStyle fBlack_32_600 = base600(32, color: ColorPalette.black);
  static final TextStyle fWhite_32_700_merged = base700(
    // Renamed
    32,
    color: ColorPalette.white,
  );

  /*<---64--->*/
  static final TextStyle fBlack_64_400 = base400(64, color: Colors.black);
  static final TextStyle fWhite_64_700 = base700(64, color: ColorPalette.white);
  static final TextStyle fBlack_64_600 = base600(64, color: ColorPalette.black);

  static TextStyle get fWhite_48_700 =>
      base700(48, color: ColorPalette.white, height: 1.2);
  static TextStyle get fPrimary_12_600 =>
      base600(12, color: ColorPalette.primaryColor);

  static TextStyle get fWhite_10_600 => base600(10, color: ColorPalette.white);

  static TextStyle get fPrimary_10_500 =>
      base500(10, color: ColorPalette.primaryColor);

  static TextStyle get fBlack_13_500 => base500(13, color: ColorPalette.black);

  static TextStyle get f6A7282_10_400 =>
      base400(10, color: ColorPalette.f6A7282);

  static TextStyle get fWhite_13_600 => base600(13, color: ColorPalette.white);

  static TextStyle get fB54708_12_600 =>
      base600(12, color: ColorPalette.fB54708);

  static TextStyle get f344054_15_500 =>
      base500(15, color: ColorPalette.f344054);

  static TextStyle get f344054_12_500 =>
      base500(12, color: ColorPalette.f344054);
}
