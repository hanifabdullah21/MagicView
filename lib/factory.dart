import 'dart:ui';

import 'package:magic_view/property/font/font.dart';
import 'package:magic_view/style/MagicTextStyle.dart';

class MagicFactory {
  /// Mengatur warna
  static Color colorBrand = Color(0xFF4086EF);
  static Color colorBrand2 = Color(0xFFFFFFFF);
  static Color colorStroke = colorBrand;
  static Color colorText = Color(0xFF2F2F2F);

  /// Mengatur font yang akan digunakan
  static FontFamily fontFamily = FontFamily.lato;

  /// Mengatur gaya teks [default]
  static MagicTextStyle magicTextStyle = MagicTextStyle(
    maxLines: null,
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
}
