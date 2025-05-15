import 'package:flutter/material.dart';
import 'package:magic_view/factory.dart';

enum MagicTextFieldBorderType { NONE, UNDERLINE, OUTLINE }

class MagicTextFieldBorder {
  final MagicTextFieldBorderProperty? border;
  final MagicTextFieldBorderProperty? enableBorder;
  final MagicTextFieldBorderProperty? disableBorder;
  final MagicTextFieldBorderProperty? focusedBorder;
  final MagicTextFieldBorderProperty? errorBorder;
  final MagicTextFieldBorderProperty? focusedErrorBorder;

  MagicTextFieldBorder({
    this.border,
    this.enableBorder,
    this.disableBorder,
    this.focusedBorder,
    this.errorBorder,
    this.focusedErrorBorder,
  });

  MagicTextFieldBorder copyWith({
    MagicTextFieldBorderProperty? border,
    MagicTextFieldBorderProperty? enableBorder,
    MagicTextFieldBorderProperty? disableBorder,
    MagicTextFieldBorderProperty? focusedBorder,
    MagicTextFieldBorderProperty? errorBorder,
    MagicTextFieldBorderProperty? focusedErrorBorder,
  }) {
    return MagicTextFieldBorder(
      border: border ?? this.border,
      enableBorder: enableBorder ?? this.enableBorder,
      disableBorder: disableBorder ?? this.disableBorder,
      focusedBorder: focusedBorder ?? this.focusedBorder,
      errorBorder: errorBorder ?? this.errorBorder,
      focusedErrorBorder: focusedErrorBorder ?? this.focusedErrorBorder,
    );
  }
}

class MagicTextFieldBorderProperty {
  final MagicTextFieldBorderType type;

  final Color? sideColor;
  final double? sideWidth;
  final double? radiusAll;
  final double? radiusTopLeft;
  final double? radiusTopRight;
  final double? radiusBottomLeft;
  final double? radiusBottomRight;

  MagicTextFieldBorderProperty(
      {this.type = MagicTextFieldBorderType.NONE,
      this.sideColor,
      this.sideWidth,
      this.radiusAll,
      this.radiusTopLeft,
      this.radiusTopRight,
      this.radiusBottomLeft,
      this.radiusBottomRight});

  MagicTextFieldBorderProperty copyWith({
    MagicTextFieldBorderType? type,
    Color? sideColor,
    double? sideWidth,
    double? radiusAll,
    double? radiusTopLeft,
    double? radiusTopRight,
    double? radiusBottomLeft,
    double? radiusBottomRight,
  }) {
    return MagicTextFieldBorderProperty(
      type: type ?? this.type,
      sideColor: sideColor ?? this.sideColor,
      sideWidth: sideWidth ?? this.sideWidth,
      radiusAll: radiusAll ?? this.radiusAll,
      radiusTopLeft: radiusTopLeft ?? this.radiusTopLeft,
      radiusTopRight: radiusTopRight ?? this.radiusTopRight,
      radiusBottomLeft: radiusBottomLeft ?? this.radiusBottomLeft,
      radiusBottomRight: radiusBottomRight ?? this.radiusBottomRight,
    );
  }
}

extension MagicTextFieldBorderPropertyExtension
    on MagicTextFieldBorderProperty {
  InputBorder toBorder() {
    BorderSide borderSide = BorderSide(
        color: sideColor ?? MagicFactory.colorBrand, width: sideWidth ?? 1);

    BorderRadius borderRadius = BorderRadius.only(
      topLeft: Radius.circular(radiusAll ?? radiusTopLeft ?? 0),
      topRight: Radius.circular(radiusAll ?? radiusTopRight ?? 0),
      bottomLeft: Radius.circular(radiusAll ?? radiusBottomLeft ?? 0),
      bottomRight: Radius.circular(radiusAll ?? radiusBottomRight ?? 0),
    );

    if (type == MagicTextFieldBorderType.UNDERLINE) {
      return UnderlineInputBorder(
          borderSide: borderSide, borderRadius: borderRadius);
    }
    if (type == MagicTextFieldBorderType.OUTLINE) {
      return OutlineInputBorder(
          borderSide: borderSide, borderRadius: borderRadius);
    }

    return InputBorder.none;
  }
}
