import 'package:flutter/material.dart';

import 'MagicTextFieldBorder.dart';
import 'MagicTextStyle.dart';

class MagicTextFieldStyle {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final MagicTextStyle? textStyle;
  final bool readOnly;
  final bool? enabled;
  bool obscureText;
  final Color? cursorColor;
  final Function()? onEditingComplete;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChange;
  final String? Function(String?)? validator;
  final AutovalidateMode? autoValidateMode;
  final Function()? onTap;
  final FocusNode? focusNode;
  final TextCapitalization textCapitalization;
  final String? hint;
  final MagicTextStyle? hintStyle;
  final String? label;
  final MagicTextStyle? labelStyle;
  final Widget? labelCustom;
  final FloatingLabelAlignment? floatingLabelAlignment;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final MagicTextStyle? floatingLabelStyle;
  final Widget? icon;
  final Color? iconColor;
  final Widget? prefixIcon;
  final Color? prefixIconColor;
  final String? prefixText;
  final MagicTextStyle? prefixTextStyle;
  final Widget? prefix;
  Widget? suffixIcon;
  final Widget? suffixIconEyeOpen;
  final Widget? suffixIconEyeClose;
  final Color? suffixIconColor;
  final String? suffixText;
  final MagicTextStyle? suffixTextStyle;
  final Widget? suffix;
  MagicTextFieldBorder? border;
  final String? counterText;
  final MagicTextStyle? counterStyle;
  final String? helperText;
  final MagicTextStyle? helperStyle;
  final String? errorText;
  final MagicTextStyle? errorStyle;
  final Color? fillColor;
  final bool? filled;
  final EdgeInsetsGeometry? padding;
  final BoxConstraints? constraints;

  MagicTextFieldStyle({
    this.controller,
    this.keyboardType,
    this.textInputAction,
    this.textStyle,
    this.readOnly = false,
    this.enabled,
    this.obscureText = false,
    this.cursorColor,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onChange,
    this.validator,
    this.autoValidateMode,
    this.onTap,
    this.focusNode,
    this.textCapitalization = TextCapitalization.none,
    this.hint,
    this.hintStyle,
    this.label,
    this.labelStyle,
    this.labelCustom,
    this.floatingLabelAlignment,
    this.floatingLabelBehavior,
    this.floatingLabelStyle,
    this.icon,
    this.iconColor,
    this.prefixIcon,
    this.prefixIconColor,
    this.prefixText,
    this.prefixTextStyle,
    this.prefix,
    this.suffixIcon,
    this.suffixIconEyeOpen,
    this.suffixIconEyeClose,
    this.suffixIconColor,
    this.suffixText,
    this.suffixTextStyle,
    this.suffix,
    this.border,
    this.counterText,
    this.counterStyle,
    this.helperText,
    this.helperStyle,
    this.errorText,
    this.errorStyle,
    this.fillColor,
    this.filled,
    this.padding,
    this.constraints,
  });

  MagicTextFieldStyle copyWith({
    TextEditingController? controller,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    MagicTextStyle? textStyle,
    bool? readOnly,
    bool? enabled,
    bool? obscureText,
    Color? cursorColor,
    Function()? onEditingComplete,
    Function(String)? onFieldSubmitted,
    Function(String)? onChange,
    String? Function(String?)? validator,
    AutovalidateMode? autoValidateMode,
    Function()? onTap,
    FocusNode? focusNode,
    TextCapitalization? textCapitalization,
    String? hint,
    MagicTextStyle? hintStyle,
    String? label,
    MagicTextStyle? labelStyle,
    Widget? labelCustom,
    FloatingLabelAlignment? floatingLabelAlignment,
    FloatingLabelBehavior? floatingLabelBehavior,
    MagicTextStyle? floatingLabelStyle,
    Widget? icon,
    Color? iconColor,
    Widget? prefixIcon,
    Color? prefixIconColor,
    String? prefixText,
    MagicTextStyle? prefixTextStyle,
    Widget? prefix,
    Widget? suffixIcon,
    Widget? suffixIconEyeOpen,
    Widget? suffixIconEyeClose,
    Color? suffixIconColor,
    String? suffixText,
    MagicTextStyle? suffixTextStyle,
    Widget? suffix,
    MagicTextFieldBorder? border,
    String? counterText,
    MagicTextStyle? counterStyle,
    String? helperText,
    MagicTextStyle? helperStyle,
    String? errorText,
    MagicTextStyle? errorStyle,
    Color? fillColor,
    bool? filled,
    EdgeInsetsGeometry? padding,
    BoxConstraints? constraints,
  }) {
    return MagicTextFieldStyle(
      controller: controller ?? this.controller,
      keyboardType: keyboardType ?? this.keyboardType,
      textInputAction: textInputAction ?? this.textInputAction,
      textStyle: textStyle ?? this.textStyle,
      readOnly: readOnly ?? this.readOnly,
      enabled: enabled ?? this.enabled,
      obscureText: obscureText ?? this.obscureText,
      cursorColor: cursorColor ?? this.cursorColor,
      onEditingComplete: onEditingComplete ?? this.onEditingComplete,
      onFieldSubmitted: onFieldSubmitted ?? this.onFieldSubmitted,
      onChange: onChange ?? this.onChange,
      validator: validator ?? this.validator,
      autoValidateMode: autoValidateMode ?? this.autoValidateMode,
      onTap: onTap ?? this.onTap,
      focusNode: focusNode ?? this.focusNode,
      textCapitalization: textCapitalization ?? this.textCapitalization,
      hint: hint ?? this.hint,
      hintStyle: hintStyle ?? this.hintStyle,
      label: label ?? this.label,
      labelStyle: labelStyle ?? this.labelStyle,
      labelCustom: labelCustom ?? this.labelCustom,
      floatingLabelAlignment:
          floatingLabelAlignment ?? this.floatingLabelAlignment,
      floatingLabelBehavior:
          floatingLabelBehavior ?? this.floatingLabelBehavior,
      floatingLabelStyle: floatingLabelStyle ?? this.floatingLabelStyle,
      icon: icon ?? this.icon,
      iconColor: iconColor ?? this.iconColor,
      prefixIcon: prefixIcon ?? this.prefixIcon,
      prefixIconColor: prefixIconColor ?? this.prefixIconColor,
      prefixText: prefixText ?? this.prefixText,
      prefixTextStyle: prefixTextStyle ?? this.prefixTextStyle,
      prefix: prefix ?? this.prefix,
      suffixIcon: suffixIcon ?? this.suffixIcon,
      suffixIconEyeOpen: suffixIconEyeOpen ?? this.suffixIconEyeOpen,
      suffixIconEyeClose: suffixIconEyeClose ?? this.suffixIconEyeClose,
      suffixIconColor: suffixIconColor ?? this.suffixIconColor,
      suffixText: suffixText ?? this.suffixText,
      suffixTextStyle: suffixTextStyle ?? this.suffixTextStyle,
      suffix: suffix ?? this.suffix,
      border: border ?? this.border,
      counterText: counterText ?? this.counterText,
      counterStyle: counterStyle ?? this.counterStyle,
      helperText: helperText ?? this.helperText,
      helperStyle: helperStyle ?? this.helperStyle,
      errorText: errorText ?? this.errorText,
      errorStyle: errorStyle ?? this.errorStyle,
      fillColor: fillColor ?? this.fillColor,
      filled: filled ?? this.filled,
      padding: padding ?? this.padding,
      constraints: constraints ?? this.constraints,
    );
  }
}
