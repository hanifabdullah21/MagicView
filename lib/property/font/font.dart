import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontFamily {
  FontFamily._(this.index, this.value, this.textTheme);

  final int index;

  final String value;

  final TextTheme textTheme;

  static final lato = FontFamily._(0, "Lato", GoogleFonts.latoTextTheme());
  static final roboto =
      FontFamily._(1, 'Roboto', GoogleFonts.robotoTextTheme());
  static final openSans =
      FontFamily._(2, 'Open Sans', GoogleFonts.openSansTextTheme());
  static final montserrat =
      FontFamily._(3, 'Montserrat', GoogleFonts.montserratTextTheme());
  static final oswald =
      FontFamily._(4, 'Oswald', GoogleFonts.oswaldTextTheme());
  static final raleway =
      FontFamily._(5, 'Raleway', GoogleFonts.ralewayTextTheme());
  static final notoSans =
      FontFamily._(6, 'Noto Sans', GoogleFonts.notoSansTextTheme());
  static final poppins =
      FontFamily._(7, 'Poppins', GoogleFonts.poppinsTextTheme());
  static final sourceSans3 =
      FontFamily._(8, 'Source Sans 3', GoogleFonts.sourceSans3TextTheme());
  static final ubuntu =
      FontFamily._(9, 'Ubuntu', GoogleFonts.ubuntuTextTheme());
  static final merriweather =
      FontFamily._(10, 'Merriweather', GoogleFonts.merriweatherTextTheme());
  static final workSans =
      FontFamily._(11, 'Work Sans', GoogleFonts.workSansTextTheme());
  static final robotoCondensed = FontFamily._(
      12, 'Roboto Condensed', GoogleFonts.robotoCondensedTextTheme());
  static final ptSans =
      FontFamily._(13, 'PT Sans', GoogleFonts.ptSansTextTheme());
  static final droidSans =
      FontFamily._(14, 'Droid Sans', GoogleFonts.openSansTextTheme());
  static final playfairDisplay = FontFamily._(
      15, 'Playfair Display', GoogleFonts.playfairDisplayTextTheme());
  static final comfortaa =
      FontFamily._(16, 'Comfortaa', GoogleFonts.comfortaaTextTheme());
  static final exo = FontFamily._(17, 'Exo', GoogleFonts.exoTextTheme());
  static final inconsolata =
      FontFamily._(18, 'Inconsolata', GoogleFonts.inconsolataTextTheme());
  static final quicksand =
      FontFamily._(19, 'Quicksand', GoogleFonts.quicksandTextTheme());
}
