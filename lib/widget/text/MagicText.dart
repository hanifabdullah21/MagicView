// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:magic_view/factory.dart';
import 'package:magic_view/property/font/font.dart';
import 'package:magic_view/style/MagicTextStyle.dart';

class MagicText extends StatelessWidget {
  /// Teks yang akan ditampilkan
  final String text;

  /// [style] Mengatur gaya dari teks secara paket
  ///
  /// Lihat juga :
  ///
  /// class [MagicTextStyle] untuk melihat lebih detail isinya
  final MagicTextStyle? style;

  /// [maxLines] Mengatur maksimal baris dari teks
  final int? maxLines;

  /// [textAlign] Mengatur perataan dari teks
  final TextAlign? textAlign;

  /// [textOverflow] Mengatur luapan teks
  final TextOverflow? textOverflow;

  /// [fontFamily] Mengatur jenis font
  final FontFamily? fontFamily;

  /// [fontWeight] Mengatur ketebalan font
  final FontWeight? fontWeight;

  /// [fontSize] Mengatur ukuran font
  final double? fontSize;

  /// [fontStyle] mengatur bentuk font
  final FontStyle? fontStyle;

  /// [letterSpacing] mengatur jarak pada huruf
  double? letterSpacing;

  /// [color] Mengatur warna font
  final Color? color;

  /// [decoration] mengatur dekorasi dari teks
  final TextDecoration? decoration;

  /// [decorationStyle] mengatur gaya dari dekorasi (dashed, dotted, double atau combine)
  final TextDecorationStyle? decorationStyle;

  /// [decorationColor] mengatur warna dari dekorasi
  final Color? decorationColor;

  /// [decorationThickness] mengatur ketebalan dari dekorasi
  final double? decorationThickness;

  /// Default Constructor of MagicText
  MagicText(
    this.text, {
    super.key,
    this.style,
    this.maxLines,
    this.textOverflow,
    this.textAlign,
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
  }) {
    MagicTextAssertion.assertStyleConfiguration(
      MagicTextType.BODY,
      style,
      maxLines: maxLines,
      textOverflow: textOverflow,
      textAlign: textAlign,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      fontSize: fontSize,
      fontStyle: fontStyle,
      color: color,
      decoration: decoration,
      decorationStyle: decorationStyle,
      decorationColor: decorationColor,
      decorationThickness: decorationThickness,
    );
  }

  /// Constructor MagicText yang mengatur untuk teks judul
  /// dengan nilai default untuk fontSize = 18 dan fontWeight = FontWeight.bold
  MagicText.head(
    this.text, {
    super.key,
    this.style,
    this.maxLines,
    this.textOverflow,
    this.textAlign,
    this.fontFamily,
    this.fontWeight = FontWeight.bold,
    this.fontSize = 18,
    this.fontStyle,
    this.letterSpacing,
    this.color,
    this.decoration,
    this.decorationStyle,
    this.decorationColor,
    this.decorationThickness,
  }) {
    MagicTextAssertion.assertStyleConfiguration(
      MagicTextType.HEAD,
      style,
      maxLines: maxLines,
      textOverflow: textOverflow,
      textAlign: textAlign,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      fontSize: fontSize,
      fontStyle: fontStyle,
      color: color,
      decoration: decoration,
      decorationStyle: decorationStyle,
      decorationColor: decorationColor,
      decorationThickness: decorationThickness,
    );
  }

  /// Constructor MagicText yang mengatur untuk teks subjudul
  /// dengan nilai default untuk fontSize = 16 dan fontWeight = FontWeight.w600
  MagicText.subhead(
    this.text, {
    super.key,
    this.style,
    this.maxLines,
    this.textOverflow,
    this.textAlign,
    this.fontFamily,
    this.fontWeight = FontWeight.w600,
    this.fontSize = 16,
    this.fontStyle,
    this.letterSpacing,
    this.color,
    this.decoration,
    this.decorationStyle,
    this.decorationColor,
    this.decorationThickness,
  }) {
    MagicTextAssertion.assertStyleConfiguration(
      MagicTextType.SUBHEAD,
      style,
      maxLines: maxLines,
      textOverflow: textOverflow,
      textAlign: textAlign,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      fontSize: fontSize,
      fontStyle: fontStyle,
      color: color,
      decoration: decoration,
      decorationStyle: decorationStyle,
      decorationColor: decorationColor,
      decorationThickness: decorationThickness,
    );
  }

  /// Constructor MagicText yang mengatur untuk teks hint
  /// dengan nilai default untuk fontSize = 12 dan fontWeight = FontWeight.w400
  MagicText.hint(
    this.text, {
    super.key,
    this.style,
    this.maxLines,
    this.textOverflow,
    this.textAlign,
    this.fontFamily,
    this.fontWeight = FontWeight.w400,
    this.fontSize = 12,
    this.fontStyle,
    this.letterSpacing,
    this.color,
    this.decoration,
    this.decorationStyle,
    this.decorationColor,
    this.decorationThickness,
  }) {
    MagicTextAssertion.assertStyleConfiguration(
      MagicTextType.HINT,
      style,
      maxLines: maxLines,
      textOverflow: textOverflow,
      textAlign: textAlign,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      fontSize: fontSize,
      fontStyle: fontStyle,
      letterSpacing: letterSpacing,
      color: color,
      decoration: decoration,
      decorationStyle: decorationStyle,
      decorationColor: decorationColor,
      decorationThickness: decorationThickness,
    );
  }

  @override
  Widget build(BuildContext context) {
    MagicTextStyle defaultTextStyle = _defaultStyle();

    return Text(
      text,
      maxLines: defaultTextStyle.maxLines,
      textAlign: defaultTextStyle.textAlign,
      overflow: defaultTextStyle.textOverflow,
      style: GoogleFonts.getFont(defaultTextStyle.fontFamily?.value ?? "",
          fontWeight: defaultTextStyle.fontWeight,
          fontSize: MagicFactory.useScreenUtil
              ? (defaultTextStyle.fontSize)?.sp
              : defaultTextStyle.fontSize,
          fontStyle: defaultTextStyle.fontStyle,
          color: defaultTextStyle.color,
          decoration: defaultTextStyle.decoration,
          decorationStyle: defaultTextStyle.decorationStyle,
          decorationColor: defaultTextStyle.decorationColor,
          decorationThickness: defaultTextStyle.decorationThickness,
          letterSpacing: defaultTextStyle.letterSpacing),
    );
  }

  _defaultStyle() {
    MagicTextStyle defaultTextStyle = MagicFactory.magicTextStyle.copyWith();
    if (style != null) {
      defaultTextStyle = style!;
    } else {
      defaultTextStyle.maxLines = maxLines ?? defaultTextStyle.maxLines;
      defaultTextStyle.textAlign = textAlign ?? defaultTextStyle.textAlign;
      defaultTextStyle.textOverflow =
          textOverflow ?? defaultTextStyle.textOverflow;
      defaultTextStyle.fontFamily = fontFamily ?? defaultTextStyle.fontFamily;
      defaultTextStyle.fontWeight = fontWeight ?? defaultTextStyle.fontWeight;
      defaultTextStyle.fontSize = (fontSize ?? defaultTextStyle.fontSize);
      defaultTextStyle.fontStyle = fontStyle ?? defaultTextStyle.fontStyle;
      defaultTextStyle.letterSpacing =
          letterSpacing ?? defaultTextStyle.letterSpacing;
      defaultTextStyle.color = color ?? defaultTextStyle.color;
      defaultTextStyle.decoration = decoration ?? defaultTextStyle.decoration;
      defaultTextStyle.decorationStyle =
          decorationStyle ?? defaultTextStyle.decorationStyle;
      defaultTextStyle.decorationThickness =
          decorationThickness ?? defaultTextStyle.decorationThickness;
      defaultTextStyle.decorationColor =
          decorationColor ?? defaultTextStyle.decorationColor;
    }
    return defaultTextStyle;
  }
}

/// Menyediakan tipe dari MagicText yang akan dipakai
enum MagicTextType { BODY, HEAD, SUBHEAD, HINT }

/// Mengatur 'assert' atau kondisi untuk penggunaan MagicText
class MagicTextAssertion {
  static void assertStyleConfiguration(
    MagicTextType type,
    MagicTextStyle? style, {
    int? maxLines,
    TextOverflow? textOverflow,
    TextAlign? textAlign,
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
    if (type == MagicTextType.BODY) {
      assert(
          style == null ||
              (maxLines == null &&
                  textOverflow == null &&
                  textAlign == null &&
                  fontFamily == null &&
                  fontWeight == null &&
                  fontSize == null &&
                  fontStyle == null &&
                  letterSpacing == null &&
                  color == null &&
                  decoration == null &&
                  decorationColor == null &&
                  decorationThickness == null &&
                  decorationStyle == null),
          'Invalid configuration: If style is not null, all other properties must be null.');
    } else {
      assert(
          style == null ||
              (maxLines == null &&
                  textOverflow == null &&
                  textAlign == null &&
                  fontFamily == null &&
                  fontStyle == null &&
                  letterSpacing == null &&
                  color == null &&
                  decoration == null &&
                  decorationColor == null &&
                  decorationThickness == null &&
                  decorationStyle == null),
          'Invalid configuration: If style is not null, all other properties must be null.');
    }
  }
}
