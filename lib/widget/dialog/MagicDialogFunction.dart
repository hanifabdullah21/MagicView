import 'dart:math' show pi;

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
      const width = 420.0;
      const minDialogHeight = (width * 186) / 286;
      final maxDialogHeight = MediaQuery.sizeOf(context).height - 100;

      return MagicDialog(
        background: Colors.transparent,
        elevation: 0,
        padding: 0,
        scrollable: false,
        maxHeight: maxDialogHeight,
        child: SizedBox(
          width: width,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: maxDialogHeight),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final availableHeight = constraints.maxHeight.isFinite
                    ? constraints.maxHeight
                    : maxDialogHeight;

                const verticalPadding = 48.0;
                var fixedParts = 16.0 + 4.0 + 56.0;
                if (iconType != EnumDialogIconType.none) {
                  fixedParts += 64 + 16;
                }
                if (title != null) {
                  fixedParts += 40 + 16;
                }
                final innerMaxHeight =
                    (availableHeight - verticalPadding).clamp(0.0, availableHeight);
                final contentMaxHeight =
                    (innerMaxHeight - fixedParts).clamp(48.0, innerMaxHeight);

                return Stack(
                  clipBehavior: Clip.hardEdge,
                  children: [
                    Positioned.fill(
                      child: Transform.rotate(
                        angle: -5 * pi / 180,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: borderColor ?? MagicFactory.colorBrand,
                              width: borderWidth,
                            ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: ColoredBox(
                          color: background ?? Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: Material(
                        color: Colors.transparent,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: minDialogHeight - verticalPadding,
                            maxHeight: innerMaxHeight,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (iconType != EnumDialogIconType.none) ...[
                                icon ?? const SizedBox.shrink(),
                                const SizedBox(height: 16),
                              ],
                              if (title != null) ...[
                                MagicText.head(
                                  title!,
                                  style: titleStyle,
                                ),
                                const SizedBox(height: 16),
                              ],
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxHeight: contentMaxHeight,
                                ),
                                child: SingleChildScrollView(
                                  physics: const ClampingScrollPhysics(),
                                  child: MagicText(
                                    content ?? "",
                                    style: contentStyle,
                                    textAlign: TextAlign.center,
                                    softWrap: true,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
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
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: (textPrimary != null &&
                                            onPrimary != null) &&
                                        (textSecondary != null &&
                                            onSecondary != null),
                                    child: const SizedBox(width: 16),
                                  ),
                                  Visibility(
                                    visible: textPrimary != null &&
                                        onPrimary != null,
                                    child: Expanded(
                                      flex: 1,
                                      child: MagicButton(
                                        onPrimary,
                                        text: "$textPrimary",
                                        textColor: textColorPrimary,
                                        textSize: textSizePrimary,
                                        background: colorPrimary ??
                                            MagicFactory.colorBrand,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
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
