// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:magic_view/factory.dart';
import 'package:magic_view/style/MagicTextStyle.dart';
import 'package:magic_view/widget/text/MagicText.dart';

/// Sebuah enum yang menyediakan tipe yang berfungsi untuk menentukan gambar
/// akan dimuat dari mana (aset lokal atau internet atau icon)
enum MagicTextIconType { asset, network, icon, svg }

/// Sebuah enum yang menyediakan posisi gambar akan ditempatkan disebelah mana
enum MagicTextIconSide { left, right }

/// Sebuah [Widget] yang digunakan untuk menampilkan teks dengan gambar
class MagicTextIcon extends StatelessWidget {
  MagicTextIconType? type;

  final String text;

  /// Mengatur gaya teks
  final MagicTextStyle? textStyle;

  /// Mengatur posisi dari ikon / gambar
  final MagicTextIconSide side;

  /// Mengatur jarak gambar dengan teks
  final double spaces;

  /// Mengatur perataan secara vertikal
  final CrossAxisAlignment verticalAlignment;

  /// Mengatur perataan secara horizontal
  final MainAxisAlignment horizontalAlignment;

  /// Mengatur warna dari gambar
  final Color? color;

  /// Jika [type] = [MagicTextIconType.ASSET] maka variabel ini akan dipakai
  /// untuk menampilkan gambar dari lokal aset
  String? asset;

  /// Jika [type] = [MagicTextIconType.NETWORK] maka variabel ini akan dipakai
  /// untuk menampilkan gambar dari internet
  String? url;

  /// Jika [type] = [MagicTextIconType.ICON] maka variabel ini akan dipakai
  /// untuk menampilkan gambar dari IconData
  IconData? icon;

  /// Jika [type] = [MagicTextIconType.ASSET] atau [MagicTextIconType.NETWORK]
  /// maka variabel ini akan dipakai untuk mengatur lebar gambar
  double? width;

  /// Jika [type] = [MagicTextIconType.ASSET] atau [MagicTextIconType.NETWORK]
  /// maka variabel ini akan dipakai untuk mengatur tinggi gambar
  double? height;

  /// Jika [type] = [MagicTextIconType.ICON]
  /// maka variabel ini akan dipakai untuk mengatur ukuran gambar
  double? size;

  TextAlign? textAlign;

  bool? isExpand;

  /// Default Constructor of MagicText dengan Icon dari asset
  MagicTextIcon.asset(
    this.text, {
    required this.asset,
    this.textStyle,
    this.height,
    this.width,
    this.side = MagicTextIconSide.left,
    this.spaces = 8,
    this.color,
    this.verticalAlignment = CrossAxisAlignment.center,
    this.horizontalAlignment = MainAxisAlignment.start,
    this.textAlign,
        this.isExpand,
    Key? key,
  }) : super(key: key) {
    type = MagicTextIconType.asset;
  }

  /// Default Constructor of MagicText dengan SVG dari asset
  MagicTextIcon.svg(
    this.text, {
    required this.asset,
    this.textStyle,
    this.height,
    this.width,
    this.side = MagicTextIconSide.left,
    this.spaces = 8,
    this.color,
    this.verticalAlignment = CrossAxisAlignment.center,
    this.horizontalAlignment = MainAxisAlignment.start,
    Key? key,
  }) : super(key: key) {
    type = MagicTextIconType.svg;
  }

  /// Default Constructor of MagicText dengan Icon dari internet
  MagicTextIcon.network(
    this.text, {
    required this.url,
    this.textStyle,
    this.height,
    this.width,
    this.color,
    this.side = MagicTextIconSide.left,
    this.spaces = 8,
    this.verticalAlignment = CrossAxisAlignment.center,
    this.horizontalAlignment = MainAxisAlignment.start,
    this.textAlign,
        this.isExpand,
    Key? key,
  }) : super(key: key) {
    type = MagicTextIconType.network;
  }

  /// Default Constructor of MagicText dengan Icon dari icon Data
  MagicTextIcon.icon(
    this.text, {
    required this.icon,
    this.textStyle,
    this.size,
    this.color,
    this.side = MagicTextIconSide.left,
    this.spaces = 8,
    this.verticalAlignment = CrossAxisAlignment.center,
    this.horizontalAlignment = MainAxisAlignment.start,
    this.textAlign,
        this.isExpand,
    Key? key,
  }) : super(key: key) {
    type = MagicTextIconType.icon;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: verticalAlignment,
      mainAxisAlignment: horizontalAlignment,
      spacing: spaces,
      children: [
        side == MagicTextIconSide.left ? getIconWidget() : getTextWidget(),
        side == MagicTextIconSide.left ? getTextWidget() : getIconWidget(),
      ],
    );
  }

  /// Mendapatkan dan mengatur ikon berdasarkan tipe (ASSET / NETWORK).
  /// Mengembalikan berupa Widget
  Widget getIconWidget() {
    switch (type) {
      case MagicTextIconType.asset:
        return Image.asset(
          "$asset",
          width: width,
          height: height,
          color: color,
        );
      case MagicTextIconType.network:
        return Image.network(
          "$url",
          width: width,
          height: height,
          color: color,
        );
      case MagicTextIconType.icon:
        return Icon(
          icon,
          size: size,
          color: color,
        );
      case MagicTextIconType.svg:
        return SvgPicture.asset(
          "$asset",
          width: width,
          height: height,
          color: color,
        );
      default:
        return Container();
    }
  }

  Widget getTextWidget() {
    return Expanded(
      flex: isExpand == true ? 1 : 0,
      child: MagicText(
        text,
        style: (textStyle ?? MagicFactory.magicTextStyle)
          ..textAlign = textAlign ?? TextAlign.center,
      ),
    );
  }
}
