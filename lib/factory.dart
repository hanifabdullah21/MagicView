import 'dart:ui';

import 'package:magic_view/property/font/font.dart';
import 'package:magic_view/style/MagicTextFieldBorder.dart';
import 'package:magic_view/style/MagicTextStyle.dart';

class MagicFactory {
  /// Mengatur warna
  static Color colorBrand = Color(0xFF4086EF);
  static Color colorBrand2 = Color(0xFFFFFFFF);
  static Color colorStroke = colorBrand;
  static Color colorText = Color(0xFF2F2F2F);
  static Color colorDisable = Color(0xFFA9A9A9);
  static Color colorError = Color(0xFFFF0000);

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
      radiusAll: buttonRadius
    ),
    enableBorder: MagicTextFieldBorderProperty(
      type: MagicTextFieldBorderType.OUTLINE,
      sideColor: colorBrand,
      sideWidth: 1,
      radiusAll: buttonRadius
    ),
    disableBorder: MagicTextFieldBorderProperty(
      type: MagicTextFieldBorderType.OUTLINE,
      sideColor: colorDisable,
      sideWidth: 1,
      radiusAll: buttonRadius
    ),
    focusedBorder: MagicTextFieldBorderProperty(
        type: MagicTextFieldBorderType.OUTLINE,
        sideColor: colorBrand,
        sideWidth: 1,
        radiusAll: buttonRadius
    ),
    errorBorder: MagicTextFieldBorderProperty(
        type: MagicTextFieldBorderType.OUTLINE,
        sideColor: colorError,
        sideWidth: 1,
        radiusAll: buttonRadius
    ),
    focusedErrorBorder: MagicTextFieldBorderProperty(
        type: MagicTextFieldBorderType.OUTLINE,
        sideColor: colorError,
        sideWidth: 2,
        radiusAll: buttonRadius
    ),
  );
}
