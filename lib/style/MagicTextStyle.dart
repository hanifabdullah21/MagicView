import 'package:flutter/material.dart';
import 'package:magic_view/widget/text/MagicText.dart';

import '../property/font/font.dart';

/// Sebuah kelas model yang menampung properti yang dapat digunakan
/// untuk mengatur [MagicText]
///
class MagicTextStyle {
  /// [maxLines] Mengatur maksimal baris dari teks
  int? maxLines;

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
      this.textAlign,
      this.textOverflow,
      this.fontFamily,
      this.fontWeight,
      this.fontSize,
      this.fontStyle,
      this.color});

  MagicTextStyle copyWith({
    int? maxLines,
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
