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

  /// [softWrap] mengatur text soft warp
  bool? softWrap;

  /// [fontFamily] Mengatur jenis font
  FontFamily? fontFamily;

  /// [fontWeight] Mengatur ketebalan font
  FontWeight? fontWeight;

  /// [fontSize] Mengatur ukuran font
  double? fontSize;

  /// [fontStyle] mengatur bentuk font
  FontStyle? fontStyle;

  /// [letterSpacing] mengatur jarak pada huruf
  double? letterSpacing;

  /// [color] Mengatur warna font
  Color? color;

  /// [decoration] mengatur dekorasi dari teks
  TextDecoration? decoration;

  /// [decorationStyle] mengatur gaya dari dekorasi (dashed, dotted, double atau combine)
  TextDecorationStyle? decorationStyle;

  /// [decorationColor] mengatur warna dari dekorasi
  Color? decorationColor;

  /// [decorationThickness] mengatur ketebalan dari dekorasi
  double? decorationThickness;

  MagicTextStyle({
    this.maxLines,
    this.minLines,
    this.textAlign,
    this.textOverflow,
    this.softWrap,
    this.fontFamily,
    this.fontWeight,
    this.fontSize,
    this.fontStyle,
    this.letterSpacing,
    this.color,
    this.decoration,
    this.decorationStyle,
    this.decorationColor,
    this.decorationThickness,
  });

  MagicTextStyle copyWith({
    int? maxLines,
    int? minLines,
    TextAlign? textAlign,
    TextOverflow? textOverflow,
    bool? softWrap,
    FontFamily? fontFamily,
    FontWeight? fontWeight,
    double? fontSize,
    FontStyle? fontStyle,
    double? letterSpacing,
    Color? color,
    TextDecoration? decoration,
    TextDecorationStyle? decorationStyle,
    Color? decorationColor,
    double? decorationThickness,
  }) {
    return MagicTextStyle(
      maxLines: maxLines ?? this.maxLines,
      minLines: maxLines ?? this.minLines,
      textAlign: textAlign ?? this.textAlign,
      textOverflow: textOverflow ?? this.textOverflow,
      softWrap: softWrap ?? this.softWrap,
      fontFamily: fontFamily ?? this.fontFamily,
      fontWeight: fontWeight ?? this.fontWeight,
      fontSize: fontSize ?? this.fontSize,
      fontStyle: fontStyle ?? this.fontStyle,
      letterSpacing: letterSpacing ?? this.letterSpacing,
      color: color ?? this.color,
      decoration: decoration ?? this.decoration,
      decorationStyle: decorationStyle ?? this.decorationStyle,
      decorationColor: decorationColor ?? this.decorationColor,
      decorationThickness: decorationThickness ?? this.decorationThickness,
    );
  }
}

extension MagicTextStyleExtension on MagicTextStyle? {
  TextStyle toTextStyle() {
    return TextStyle(
      fontFamily: this?.fontFamily?.value ??
          MagicFactory.magicTextStyle.fontFamily?.value ??
          "",
      fontSize: this?.fontSize,
      fontWeight: this?.fontWeight,
      color: this?.color,
      fontStyle: this?.fontStyle,
      overflow: this?.textOverflow,
      letterSpacing: this?.letterSpacing,
      decoration: this?.decoration,
      decorationStyle: this?.decorationStyle,
      decorationColor: this?.decorationColor,
      decorationThickness: this?.decorationThickness,
    );
  }

  TextStyle toGoogleTextStyle() {
    if (this == null) {
      debugPrint("NULLLL");
    }
    return GoogleFonts.getFont(
        this?.fontFamily?.value ??
            MagicFactory.magicTextStyle.fontFamily?.value ??
            "",
        textStyle: TextStyle(
          fontSize: this?.fontSize,
          fontWeight: this?.fontWeight,
          color: this?.color,
          fontStyle: this?.fontStyle,
          overflow: this?.textOverflow,
          letterSpacing: this?.letterSpacing,
          decoration: this?.decoration,
          decorationStyle: this?.decorationStyle,
          decorationColor: this?.decorationColor,
          decorationThickness: this?.decorationThickness,
        ));
  }
}
