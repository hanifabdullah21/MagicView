import 'package:flutter/material.dart';
import 'package:magic_view/factory.dart';
import 'package:magic_view/style/MagicTextStyle.dart';
import 'package:magic_view/widget/button/MagicButton.dart';
import 'package:magic_view/widget/dialog/MagicDialog.dart';
import 'package:magic_view/widget/text/MagicText.dart';

showMagicDialog(
  BuildContext context, {
  /// [REQUIRED] Widget konten atau isi dari dialog
  required Widget child,

  /// Digunakan untuk menutup dialog jika menekan di bagian area luar dialog. Secara default bernilai true
  bool barrierDismissable = true,

  /// Warna background dari dialog
  Color? background,

  /// Mengatur maksimal tinggi dari dialog. Secara default bernilai sesuai dengan tinggi perangkat - 100
  double? maxHeight,

  /// Mengatur radius sudut dialog
  double? cornerRadius,

  /// Mengatur elevation
  double? elevation,

  /// Mengatur padding
  double? padding,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return MagicDialog(
        background: background,
        maxHeight: maxHeight,
        elevation: elevation,
        padding: padding,
        cornerRadius: cornerRadius,
        child: child,
      );
    },
    barrierDismissible: barrierDismissable,
  );
}

showMagicAlertDialog(
  BuildContext context, {
  /// Teks untuk isi
  required String? content,

  /// Style Teks untuk konten
  MagicTextStyle? contentStyle,

  /// Mode icon. Diambil dari EnumDialogIconType yang berisi none, success, failed, warning, custom. Secara default bernilai EnumDialogIconType.none
  EnumDialogIconType? iconType = EnumDialogIconType.none,

  /// Jika iconType bernilai EnumDialogIconType.custom, anda dapat mengisi icon disini
  Widget? icon,

  /// Teks untuk judul
  String? title,

  /// Style teks untuk judul
  MagicTextStyle? titleStyle,

  /// Digunakan untuk menutup dialog jika menekan di bagian area luar dialog. Secara default bernilai true
  bool barrierDismissable = true,

  /// Teks untuk tombol primary
  String? textPrimary,

  /// Aksi untuk tombol primary
  Function()? onPrimary,

  /// Warna untuk tombol primary
  Color? colorPrimary,

  /// Warna teks untuk tombol primary
  Color? textColorPrimary,

  /// Ukuran teks untuk tombol primary
  double? textSizePrimary,

  /// Teks untuk tombol sekunder
  String? textSecondary,

  /// Aksi untuk tombol sekunder
  Function()? onSecondary,

  /// Warna tombol sekunder
  Color? colorSecondary,

  /// Warna teks untuk tombol sekunder
  Color? textColorSecondary,

  /// Ukuran teks untuk tombol sekunder
  double? textSizeSecondary,

  /// Warna background dialog
  Color? background,

  /// Warna batas dialog
  Color? borderColor,

  /// Ketebalan batas dialog. Secara default bernilai 2
  double borderWidth = 2,
}) {
  icon = _getDialogIcon(icon, iconType);
  showDialog(
    context: context,
    builder: (context) {
      double width = 420;
      return MagicDialog(
        background: Colors.transparent,
        elevation: 0,
        child: SizedBox(
          width: width,
          child: Stack(
            children: [
              Container(
                width: width,
                height: (width * 186) / 286,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: borderColor ?? MagicFactory.colorBrand,
                      width: borderWidth,
                    ),
                    borderRadius: BorderRadius.circular(40)),
              ),
              RotationTransition(
                turns: const AlwaysStoppedAnimation(355 / 360),
                child: Container(
                  width: width,
                  height: (width * 186) / 286,
                  decoration: ShapeDecoration(
                    color: background ?? Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(24),
                width: width,
                height: (width * 186) / 286,
                child: Material(
                    color: background ?? Colors.white,
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Visibility(
                            visible: iconType != EnumDialogIconType.none,
                            child: icon ?? SizedBox()),
                        const SizedBox(
                          height: 16,
                        ),
                        Visibility(
                            visible: title != null,
                            child: MagicText.head(
                              title ?? "",
                              style: titleStyle,
                            )),
                        const SizedBox(
                          height: 16,
                        ),
                        MagicText(
                          content ?? "",
                          style: contentStyle,
                          maxLines: 4,
                          textOverflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            Visibility(
                                visible: textSecondary != null &&
                                    onSecondary != null,
                                child: Expanded(
                                    flex: 1,
                                    child: MagicButton(
                                      onSecondary,
                                      text: "$textSecondary",
                                      textColor: textColorSecondary,
                                      strokeColor: colorSecondary ??
                                          MagicFactory.colorBrand2,
                                      strokeWidth: 2,
                                      textSize: textSizeSecondary,
                                      background: Colors.white,
                                    ))),
                            Visibility(
                                visible: (textPrimary != null &&
                                        onPrimary != null) &&
                                    (textSecondary != null &&
                                        onSecondary != null),
                                child: const SizedBox(
                                  width: 16,
                                )),
                            Visibility(
                                visible:
                                textPrimary != null && onPrimary != null,
                                child: Expanded(
                                    flex: 1,
                                    child: MagicButton(
                                      onPrimary,
                                      text: "$textPrimary",
                                      textColor: textColorPrimary,
                                      textSize: textSizePrimary,
                                      background: colorPrimary ??
                                          MagicFactory.colorBrand,
                                    ))),
                          ],
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                      ],
                    ))),
              ),
            ],
          ),
        ),
      );
    },
    barrierDismissible: barrierDismissable,
  );
}

enum EnumDialogIconType { none, success, failed, warning, custom }

Widget? _getDialogIcon(Widget? icon, EnumDialogIconType? iconType) {
  switch (iconType) {
    case EnumDialogIconType.none:
      {
        icon = null;
        break;
      }
    case EnumDialogIconType.success:
      {
        icon = MagicFactory.iconSuccess;
        break;
      }
    case EnumDialogIconType.failed:
      {
        icon = MagicFactory.iconFailed;
        break;
      }
    case EnumDialogIconType.warning:
      {
        icon = MagicFactory.iconWarning;
        break;
      }
    default:
      {}
  }
  return icon;
}
