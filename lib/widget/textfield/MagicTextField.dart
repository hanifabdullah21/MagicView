// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:magic_view/factory.dart';
import 'package:magic_view/style/MagicTextFieldBorder.dart';
import 'package:magic_view/style/MagicTextStyle.dart';

enum MagicTextFieldType { DEFAULT, PASSWORD, BORDER, BORDER_PASSWORD }

class MagicTextField extends StatefulWidget {
  /// Tipe yang tersedia pada Widget MagicTextField
  MagicTextFieldType? type;

  /// Controller
  final TextEditingController controller;

  /// Mengatur tampilan keyboard
  final TextInputType? keyboardType;

  /// Mengatur bentuk aksi 'enter' di keyboard
  final TextInputAction? textInputAction;

  /// Mengatur gaya teks
  final MagicTextStyle? textStyle;

  /// Mengatur [MagicTextField] dapat diedit atau tidak.
  /// Secara default bernilai `false`
  final bool readOnly;

  /// Mengatur [MagicTextField] dapat diedit atau tidak.
  /// Berbeda dengan [readOnly], ketika [enabled] bernilai `true`
  /// maka [MagicTextField] akan memasuki mode disabled
  final bool? enabled;

  /// Mengatur tampilan teks, akan disembunyikan dan diganti `*` atau tidak
  /// Secara default bernilai `false`
  bool obscureText;

  /// Mengatur warna cursor
  final Color? cursorColor;

  /// Menangani aksi ketika sudah selesai mengedit
  final Function()? onEditingComplete;

  /// Menangani aksi ketika sudah selesai mengetik dan menekan `enter`
  final Function(String)? onFieldSubmitted;

  /// Menangani aksi setiap ada perubahan pengetikan
  final Function(String)? onChange;

  /// Menangani aksi validasi
  final String? Function(String?)? validator;

  /// Menangani aksi validasi akan dilakukan kapan
  final AutovalidateMode? autoValidateMode;

  /// Menangani aksi ketika [MagicTextField] di-Tap
  final Function()? onTap;

  ///
  final FocusNode? focusNode;

  ///
  final TextCapitalization textCapitalization;

  /// Memberikan hint
  final String? hint;

  /// Mengatur gaya dari [hint]
  final MagicTextStyle? hintStyle;

  /// Memberikan label. Jika [hint] dan [label] diisi, maka [hint] akan diabaikan
  /// dan [label] yang akan ditampilkan
  final String? label;

  /// Mengatur gaya dari [label]
  final MagicTextStyle? labelStyle;

  /// Mengatur Widget kustom untuk label. Jika [labelCustom] diisi maka [label],
  /// [labelStyle] dan [floatingLabelStyle] akan diabaikan
  final Widget? labelCustom;

  /// Mengatur perataan dari [label] yang mengambang
  final FloatingLabelAlignment? floatingLabelAlignment;

  /// Mengatur kemunculan [label] mengambang
  final FloatingLabelBehavior? floatingLabelBehavior;

  /// Mengatur gaya dari [label] mengambang
  final MagicTextStyle? floatingLabelStyle;

  /// Mengatur ikon
  final Widget? icon;

  /// Mengatur warna dari ikon
  final Color? iconColor;

  /// Mengatur ikon pada awalan [MagicTextField]
  final Widget? prefixIcon;

  /// Mengatur warna [prefixIcon]
  final Color? prefixIconColor;

  /// Mengatur teks pada awalan [MagicTextField]. Terletak antara [prefixIcon]
  /// dan tempat untuk mengetik. [prefixText] akan muncul jika [prefix] bernilai
  /// null dan [MagicTextField] dalam status fokus
  final String? prefixText;

  /// Mengatur gaya dari [prefixText]
  final MagicTextStyle? prefixTextStyle;

  /// Mengatur Widget pada awalan [MagicTextField]. Terletak antara [prefixIcon]
  /// dan tempat untuk mengetik. [prefix] akan muncul jika [prefixText] bernilai
  /// null dan [MagicTextField] dalam status fokus
  final Widget? prefix;

  /// Mengatur ikon pada akhiran [MagicTextField]
  /// Jika [type] = [MagicTextFieldType.PASSWORD] atau [MagicTextFieldType.BORDER_PASSWORD]
  /// maka [suffixIcon] akan diabaikan
  Widget? suffixIcon;

  /// Mengatur [suffixIcon] jika [type] = [MagicTextFieldType.PASSWORD] atau [MagicTextFieldType.BORDER_PASSWORD]
  /// dan [obscureText] = false.
  Widget? suffixIconEyeOpen;

  /// Mengatur [suffixIcon] jika [type] = [MagicTextFieldType.PASSWORD] atau [MagicTextFieldType.BORDER_PASSWORD]
  /// dan [obscureText] = true
  Widget? suffixIconEyeClose;

  /// Mengatur warna dari [suffixIcon]
  final Color? suffixIconColor;

  /// Mengatur teks pada akhiran [MagicTextField]. Terletak antara [suffixIcon]
  /// dan tempat untuk mengetik. [suffixText] akan muncul jika [suffix] bernilai
  /// null dan [MagicTextField] dalam status fokus
  final String? suffixText;

  /// Mengatur gaya dari [suffixText]
  final MagicTextStyle? suffixTextStyle;

  /// Mengatur Widget pada awalan [MagicTextField]. Terletak antara [suffixIcon]
  /// dan tempat untuk mengetik. [suffix] akan muncul jika [suffixText] bernilai
  /// null dan [MagicTextField] dalam status fokus
  final Widget? suffix;

  /// Mengatur garis batas / border pada [MagicTextField]
  MagicTextFieldBorder? border;

  /// Mengatur teks counter. Terletak pada kanan bawah [MagicTextField]
  final String? counterText;

  /// Mengatur gaya teks [counterText]
  final MagicTextStyle? counterStyle;

  /// mengatur teks helper. Terletak pada kiri bawah [MagicTextField]
  final String? helperText;

  /// Mengatur gaya teks [helperText]
  final MagicTextStyle? helperStyle;

  /// Mengatur teks error. Terletak pada kiri bawah [MagicTextField].
  /// Jika [helperText] tidak bernilai null akan terganti dengan [errorText]
  final String? errorText;

  /// Mengatur gaya teks [errorText]
  final MagicTextStyle? errorStyle;

  /// Mengatur warna dari [MagicTextField].
  /// Akan diabaikan jika [filled] bernilai null atau false
  final Color? fillColor;

  /// Mengatur [MagicTextField] berwarna atau tidak
  final bool? filled;

  /// Mengatur padding
  final EdgeInsetsGeometry? padding;

  /// Mengatur ukuran dari [MagicTextField]
  final BoxConstraints? constraints;

  /// Input Formatter
  final List<TextInputFormatter>? inputFormatter;

  MagicTextField(
    this.controller, {
    super.key,
    this.keyboardType,
    this.textInputAction,
    this.textStyle,
    this.readOnly = false,
    this.obscureText = false,
    this.cursorColor,
    this.onEditingComplete,
    this.onChange,
    this.onFieldSubmitted,
    this.onTap,
    this.validator,
    this.autoValidateMode,
    this.enabled,
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
    this.filled,
    this.fillColor,
    this.padding,
    this.constraints,
    this.inputFormatter,
  }) {
    type = MagicTextFieldType.DEFAULT;
  }

  MagicTextField.password(
    this.controller, {
    super.key,
    this.keyboardType,
    this.textInputAction,
    this.textStyle,
    this.readOnly = false,
    this.obscureText = true,
    this.cursorColor,
    this.onEditingComplete,
    this.onChange,
    this.onFieldSubmitted,
    this.onTap,
    this.validator,
    this.autoValidateMode,
    this.enabled,
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
    this.filled,
    this.fillColor,
    this.padding,
    this.constraints,
    this.inputFormatter,
  }) {
    type = MagicTextFieldType.PASSWORD;
  }

  MagicTextField.border(
    this.controller, {
    super.key,
    this.keyboardType,
    this.textInputAction,
    this.textStyle,
    this.readOnly = false,
    this.obscureText = false,
    this.cursorColor,
    this.onEditingComplete,
    this.onChange,
    this.onFieldSubmitted,
    this.onTap,
    this.validator,
    this.autoValidateMode,
    this.enabled,
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
    this.filled,
    this.fillColor,
    this.padding,
    this.constraints,
    this.inputFormatter,
  }) {
    type = MagicTextFieldType.DEFAULT;
    border = border ?? MagicFactory.border;
  }

  MagicTextField.borderPassword(
    this.controller, {
    super.key,
    this.keyboardType,
    this.textInputAction,
    this.textStyle,
    this.readOnly = false,
    this.obscureText = true,
    this.cursorColor,
    this.onEditingComplete,
    this.onChange,
    this.onFieldSubmitted,
    this.onTap,
    this.validator,
    this.autoValidateMode,
    this.enabled,
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
    this.filled,
    this.fillColor,
    this.padding,
    this.constraints,
    this.inputFormatter,
  }) {
    type = MagicTextFieldType.BORDER_PASSWORD;
    border = border ?? MagicFactory.border;
  }

  @override
  State<MagicTextField> createState() => _MagicTextFieldState();
}

class _MagicTextFieldState extends State<MagicTextField> {
  final Widget _defaultSuffixIconEyeOpen = Image.asset(
    "packages/magic_view/assets/eye.png",
    color: MagicFactory.colorBrand,
  );
  final Widget _defaultSuffixIconEyeClose = Image.asset(
    "packages/magic_view/assets/eye_off.png",
    color: MagicFactory.colorBrand,
  );

  void _togglePasswordView() {
    setState(() {
      widget.obscureText = !widget.obscureText;
      settingSuffixIcon();
    });
  }

  @override
  Widget build(BuildContext context) {
    settingSuffixIcon();
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: widget.hintStyle?.toGoogleTextStyle(),
        hintMaxLines: widget.hintStyle?.maxLines,
        labelText: widget.label,
        labelStyle: widget.labelStyle?.toGoogleTextStyle(),
        label: widget.labelCustom,
        floatingLabelAlignment: widget.floatingLabelAlignment,
        floatingLabelBehavior: widget.floatingLabelBehavior,
        floatingLabelStyle: widget.floatingLabelStyle?.toGoogleTextStyle(),
        icon: widget.icon,
        iconColor: widget.iconColor,
        prefixIcon: widget.prefixIcon,
        prefixIconColor: widget.prefixIconColor,
        prefix: widget.prefix,
        prefixText: widget.prefixText,
        prefixStyle: widget.prefixTextStyle?.toGoogleTextStyle(),
        suffixIcon: widget.type == MagicTextFieldType.DEFAULT
            ? widget.suffixIcon
            : InkWell(
                onTap: _togglePasswordView,
                child: widget.suffixIcon,
              ),
        suffixIconColor: widget.suffixIconColor,
        suffix: widget.suffix,
        suffixText: widget.suffixText,
        suffixStyle: widget.suffixTextStyle?.toGoogleTextStyle(),
        counterText: widget.counterText,
        counterStyle: widget.counterStyle?.toGoogleTextStyle(),
        helperText: widget.helperText,
        helperStyle: widget.helperStyle?.toGoogleTextStyle(),
        errorText: widget.errorText,
        errorStyle: widget.errorStyle?.toGoogleTextStyle(),
        fillColor: widget.fillColor,
        filled: widget.filled,
        border: widget.border?.border?.toBorder() ?? InputBorder.none,
        enabledBorder:
            widget.border?.enableBorder?.toBorder() ?? InputBorder.none,
        errorBorder: widget.border?.errorBorder?.toBorder() ?? InputBorder.none,
        focusedErrorBorder:
            widget.border?.focusedErrorBorder?.toBorder() ?? InputBorder.none,
        focusedBorder:
            widget.border?.focusedBorder?.toBorder() ?? InputBorder.none,
        disabledBorder:
            widget.border?.disableBorder?.toBorder() ?? InputBorder.none,
        contentPadding: widget.padding,
        constraints: widget.constraints,
        focusColor: Colors.transparent,
        errorMaxLines: widget.errorStyle?.maxLines,
      ),
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      style: widget.textStyle?.toGoogleTextStyle() ??
          MagicFactory.magicTextStyle.toGoogleTextStyle(),
      textAlign: widget.textStyle?.textAlign ?? TextAlign.start,
      readOnly: widget.readOnly,
      obscureText: widget.obscureText,
      maxLines: widget.type == MagicTextFieldType.PASSWORD ||
              widget.type == MagicTextFieldType.BORDER_PASSWORD
          ? 1
          : widget.textStyle?.maxLines,
      minLines:
          widget.textStyle?.minLines ?? MagicFactory.magicTextStyle.minLines,
      cursorColor: widget.cursorColor ?? MagicFactory.colorBrand,
      onEditingComplete: widget.onEditingComplete,
      onFieldSubmitted: widget.onFieldSubmitted,
      validator: widget.validator,
      autovalidateMode: widget.autoValidateMode,
      enabled: widget.enabled,
      focusNode: widget.focusNode,
      onTap: widget.onTap,
      onChanged: widget.onChange,
      textCapitalization: widget.textCapitalization,
      inputFormatters: widget.inputFormatter ?? [],
    );
  }

  settingSuffixIcon() {
    if (widget.type == MagicTextFieldType.PASSWORD ||
        widget.type == MagicTextFieldType.BORDER_PASSWORD) {
      if (widget.obscureText == true) {
        widget.suffixIcon =
            (widget.suffixIconEyeClose ?? _defaultSuffixIconEyeClose);
      } else {
        widget.suffixIcon =
            (widget.suffixIconEyeOpen ?? _defaultSuffixIconEyeOpen);
      }
    }
  }
}
