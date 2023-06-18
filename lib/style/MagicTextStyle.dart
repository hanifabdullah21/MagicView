import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:magic_view/factory.dart';
import 'package:magic_view/widget/text/MagicText.dart';
import 'package:magic_view/widget/textfield/MagicTextField.dart';

import '../property/font/font.dart';

/// Sebuah kelas model yang menampung properti yang dapat digunakan
/// untuk mengatur [MagicText]
///
class MagicTextStyle {
  /// [maxLines] Mengatur maksimal baris dari teks
  int? maxLines;

  /// [minLines] Mengatur minimal baris dari teks.
  /// Saat ini hanya berlaku di penggunaan [MagicTextField]
  int? minLines;

  /// [textAlign] Mengatur perataan dari teks
  TextAlign? textAlign;

  /// [textOverflow] Mengatur luapan teks
  TextOverflow? textOverflow;

  /// [fontFamily] Mengatur jenis font
  FontFamily? fontFamily;

  /// [fontWeight] Mengatur ketebalan font
  FontWeight? fontWeight;

  /// [fontSize] Mengatur ukuran font
  double? fontSize;

  /// [fontStyle] mengatur bentuk font
  FontStyle? fontStyle;

  /// [color] Mengatur warna font
  Color? color;

  MagicTextStyle(
      {this.maxLines,
      this.minLines,
      this.textAlign,
      this.textOverflow,
      this.fontFamily,
      this.fontWeight,
      this.fontSize,
      this.fontStyle,
      this.color});

  MagicTextStyle copyWith({
    int? maxLines,
    int? minLines,
    TextAlign? textAlign,
    TextOverflow? textOverflow,
    FontFamily? fontFamily,
    FontWeight? fontWeight,
    double? fontSize,
    FontStyle? fontStyle,
    Color? color,
  }) {
    return MagicTextStyle(
      maxLines: maxLines ?? this.maxLines,
      minLines: maxLines ?? this.minLines,
      textAlign: textAlign ?? this.textAlign,
      textOverflow: textOverflow ?? this.textOverflow,
      fontFamily: fontFamily ?? this.fontFamily,
      fontWeight: fontWeight ?? this.fontWeight,
      fontSize: fontSize ?? this.fontSize,
      fontStyle: fontStyle ?? this.fontStyle,
      color: color ?? this.color,
    );
  }
}

extension MagicTextStyleExtension on MagicTextStyle? {
  TextStyle toTextStyle() {
    return TextStyle(
      fontFamily: this?.fontFamily?.value ?? MagicFactory.magicTextStyle.fontFamily?.value ?? "",
      fontSize: this?.fontSize,
      fontWeight: this?.fontWeight,
      color: this?.color,
      fontStyle: this?.fontStyle,
      overflow: this?.textOverflow,
    );
  }
  TextStyle toGoogleTextStyle() {
    if(this==null){
      debugPrint("NULLLL");
    }
    return GoogleFonts.getFont(this?.fontFamily?.value ?? MagicFactory.magicTextStyle.fontFamily?.value ?? "",
        textStyle: TextStyle(
          fontSize: this?.fontSize,
          fontWeight: this?.fontWeight,
          color: this?.color,
          fontStyle: this?.fontStyle,
          overflow: this?.textOverflow,
        ));
  }
}
