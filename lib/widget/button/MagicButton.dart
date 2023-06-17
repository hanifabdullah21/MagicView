import 'package:flutter/material.dart';
import 'package:magic_view/factory.dart';
import 'package:magic_view/property/font/font.dart';
import 'package:magic_view/style/MagicTextStyle.dart';
import 'package:magic_view/widget/text/MagicTextIcon.dart';

import '../text/MagicText.dart';

class MagicButton extends StatelessWidget {
  final Function()? onPressed;

  /// Mengatur kustomisasi child pada tombol.
  /// child dapat diisi dengan [MagicTextIcon] atau bahkan [Widget] lain
  final Widget? child;

  /// Mengatur teks yang akan ditampilkan
  final String? text;

  /// Mengatur gaya teks. Jika [child] != null maka [textStyle] diabaikan.
  /// Jika [textStyle] != null maka [textColor],[textSize],[fontWeight],[fontFamily] diabaikan.
  final MagicTextStyle? textStyle;

  /// Mengatur warna dari teks.
  /// Jika [child] != null atau [textStyle] != null maka [textColor] diabaikan
  final Color? textColor;

  /// Mengatur ukuran font.
  /// Jika [child] != null atau [textStyle] != null maka [textSize] diabaikan
  final double? textSize;

  /// Mengatur ketebalan font.
  /// Jika [child] != null atau [textStyle] != null maka [fontWeight] diabaikan
  final FontWeight? fontWeight;

  /// Mengatur jenis font.
  /// Jika [child] != null atau [textStyle] != null maka [fontFamily] diabaikan
  final FontFamily? fontFamily;

  /// Mengatur warna dasar dari tombol
  final Color? background;

  /// Mengatur warna dari tombol. Akan terlihat jika tombol di-hover atau ditekan
  final Color? foreground;

  /// Mengatur warna garis dari tombol. Jika [strokeWidth] bernilai lebih dari 0
  /// dan [strokeColor] bernilai null, maka warna garis akan diambil dari [MagicFactory.colorStroke]
  final Color? strokeColor;

  /// Mengatur ketebalan garis dari tombol. Secara default [strokeWidth] bernilai 0.
  /// Jika [strokeWidth] bernilai 0 maka dianggap tidak memiliki garis dan
  /// [strokeColor] akan diabaikan
  final double strokeWidth;

  /// Mengatur kelengkungan dari sisi tombol. Secara default [radius] bernilai [MagicFactory.buttonRadius]
  final double? radius;

  /// Mengatur jarak ke dalam antara tombol dengan `child`-nya
  final EdgeInsetsGeometry? padding;

  const MagicButton(
    this.onPressed, {
    super.key,
    this.text,
    this.textStyle,
    this.textColor,
    this.fontFamily,
    this.textSize,
    this.fontWeight,
    this.background,
    this.foreground,
    this.strokeColor,
    this.strokeWidth = 0,
    this.radius,
    this.padding,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: background ?? MagicFactory.colorBrand,
        foregroundColor: foreground ?? MagicFactory.colorBrand2,
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(radius ?? MagicFactory.buttonRadius),
          side: strokeWidth == 0
              ? BorderSide.none
              : BorderSide(
                  color: strokeColor ?? MagicFactory.colorStroke,
                  width: strokeWidth,
                ),
        ),
      ),
      child: child ??
          MagicText(
            text ?? "",
            style: textStyle,
            color: textColor,
            fontSize: textSize,
            fontFamily: fontFamily,
            fontWeight: fontWeight,
          ),
    );
  }
}
