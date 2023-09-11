import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magic_view/property/font/font.dart';
import 'package:magic_view/style/MagicTextFieldBorder.dart';
import 'package:magic_view/style/MagicTextStyle.dart';

class MagicFactory {
  static initMagicFactory(
      {required Color colorBrand,
      required Color colorBrand2,
      Color? colorStroke,
      Color? colorText,
      Color? colorDisable,
      Color? colorError,
      FontFamily? fontFamily,
      MagicTextStyle? magicTextStyle,
      MagicTextFieldBorder? magicTextFieldBorder,
      double? buttonBorderRadius,
      bool useScreenUtil = false}) {
    MagicFactory.colorBrand = colorBrand;
    MagicFactory.colorBrand2 = colorBrand2;
    if (colorStroke != null) MagicFactory.colorStroke = colorStroke;
    if (colorText != null) MagicFactory.colorText = colorText;
    if (colorDisable != null) MagicFactory.colorDisable = colorDisable;
    if (colorError != null) MagicFactory.colorError = colorError;
    if (fontFamily != null) MagicFactory.fontFamily = fontFamily;
    if (magicTextStyle != null) MagicFactory.magicTextStyle = magicTextStyle;
    if (magicTextStyle != null) MagicFactory.magicTextStyle = magicTextStyle;
    if (magicTextFieldBorder != null) {
      MagicFactory.border = magicTextFieldBorder;
    }
    if (buttonBorderRadius != null) {
      MagicFactory.buttonRadius = buttonBorderRadius;
    }
    MagicFactory.useScreenUtil = useScreenUtil;
  }

  /// Mengatur warna
  static Color colorBrand = Color(0xFF4086EF);
  static Color colorBrand2 = Color(0xFFFFFFFF);
  static Color colorStroke = colorBrand;
  static Color colorText = Color(0xFF2F2F2F);
  static Color colorDisable = Color(0xFFA9A9A9);
  static Color colorError = Color(0xFFFF0000);

  static bool useScreenUtil = false;

  /// Mengatur font yang akan digunakan
  static FontFamily fontFamily = FontFamily.lato;

  /// Mengatur gaya teks [default]
  static MagicTextStyle magicTextStyle = MagicTextStyle(
    maxLines: null,
    minLines: 1,
    textAlign: null,
    textOverflow: null,
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: colorText,
    fontStyle: FontStyle.normal,
  );

  /// Mengatur radius tombol [default]
  static double buttonRadius = 20;

  /// Mengatur border textfield [default]
  static MagicTextFieldBorder border = MagicTextFieldBorder(
    border: MagicTextFieldBorderProperty(
        type: MagicTextFieldBorderType.OUTLINE,
        sideColor: colorBrand,
        sideWidth: 1,
        radiusAll: buttonRadius),
    enableBorder: MagicTextFieldBorderProperty(
        type: MagicTextFieldBorderType.OUTLINE,
        sideColor: colorBrand,
        sideWidth: 1,
        radiusAll: buttonRadius),
    disableBorder: MagicTextFieldBorderProperty(
        type: MagicTextFieldBorderType.OUTLINE,
        sideColor: colorDisable,
        sideWidth: 1,
        radiusAll: buttonRadius),
    focusedBorder: MagicTextFieldBorderProperty(
        type: MagicTextFieldBorderType.OUTLINE,
        sideColor: colorBrand,
        sideWidth: 1,
        radiusAll: buttonRadius),
    errorBorder: MagicTextFieldBorderProperty(
        type: MagicTextFieldBorderType.OUTLINE,
        sideColor: colorError,
        sideWidth: 1,
        radiusAll: buttonRadius),
    focusedErrorBorder: MagicTextFieldBorderProperty(
        type: MagicTextFieldBorderType.OUTLINE,
        sideColor: colorError,
        sideWidth: 2,
        radiusAll: buttonRadius),
  );

  static initScreen(BuildContext context) {
    ScreenUtil.init(context, designSize: MediaQuery.of(context).size);
  }
}
