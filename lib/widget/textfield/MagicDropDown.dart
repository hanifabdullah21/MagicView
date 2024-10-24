// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:magic_view/factory.dart';
import 'package:magic_view/style/MagicTextFieldBorder.dart';
import 'package:magic_view/style/MagicTextStyle.dart';

import '../text/MagicText.dart';

class MagicDropDown<T> extends StatelessWidget {
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
  final MagicTextFieldBorder? border;

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

  /// [REQUIRED] Menagtur isi dropdown
  final List<T> items;

  /// [REQUIRED] Mengatur teks yang ditampilkan di menu
  final String Function(T?) itemString;

  /// [REQUIRED] Fungsi untuk mengatur nilai setelah dipilih dari menu
  final Function(T)? onChange;

  /// Mengatur nilai
  final T? value;

  /// Mengatur tampilan dari daftar menu
  Widget Function(String itemString, T data)? itemBuilder;

  /// Mengatur validasi dropdown
  String? Function(String? text, T? data)? validator;

  /// Menagtur jenis validasi
  AutovalidateMode? autoValidateMode;

  /// Mengatur hint saat [MagicDropDown] disable
  final String? disableHint;

  /// Mengatur hint style saat [MagicDropDown] disable
  final MagicTextStyle? disableHintStyle;

  /// Menagtur warna dari item
  final Color? itemColor;

  /// Mengatur tinggi setiap item
  final double? itemHeight;

  /// Mengatur tinggi maksimal menu
  final double? maxMenuHeight;

  /// Mengatur ikon dropdown
  final Widget? iconDropdown;

  /// Mengatur ukuran ikon dropdown
  final double? iconDropdownSize;

  /// Mengatur warna ikon dropdon saat enable
  final Color? iconDropdownColorEnable;

  /// Mengatur warna ikon dropdon saat disable
  final Color? iconDropdownColorDisable;

  MagicDropDown(
      {super.key,
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
      required this.items,
      required this.itemString,
      required this.onChange,
      this.value,
      this.itemBuilder,
      this.validator,
      this.autoValidateMode,
      this.disableHint,
      this.disableHintStyle,
      this.itemColor,
      this.itemHeight,
      this.maxMenuHeight,
      this.iconDropdown,
      this.iconDropdownSize,
      this.iconDropdownColorDisable,
      this.iconDropdownColorEnable});

  @override
  Widget build(BuildContext context) {
    // Ensure that items generate unique "key" values
    List<Map<String, dynamic>> list = items
        .map((e) => <String, dynamic>{"key": itemString(e), "value": e})
        .toList();

    // Ensure the 'value' matches one of the 'key' values in the list
    String? selectedValue;
    if (value != null) {
      selectedValue = list.any((item) => item["key"] == itemString(value))
          ? itemString(value)
          : null; // Set to null if no match found
    }

    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: hintStyle?.toGoogleTextStyle() ??
            MagicFactory.magicTextStyle.toGoogleTextStyle(),
        hintMaxLines: hintStyle?.maxLines,
        labelText: label,
        labelStyle: labelStyle?.toGoogleTextStyle(),
        label: labelCustom,
        floatingLabelAlignment: floatingLabelAlignment,
        floatingLabelBehavior: floatingLabelBehavior,
        floatingLabelStyle: floatingLabelStyle?.toGoogleTextStyle(),
        icon: icon,
        iconColor: iconColor,
        prefixIcon: prefixIcon,
        prefixIconColor: prefixIconColor,
        prefix: prefix,
        prefixText: prefixText,
        prefixStyle: prefixTextStyle?.toGoogleTextStyle(),
        suffixIcon: suffixIcon,
        suffixIconColor: suffixIconColor,
        suffix: suffix,
        suffixText: suffixText,
        suffixStyle: suffixTextStyle?.toGoogleTextStyle(),
        counterText: counterText,
        counterStyle: counterStyle?.toGoogleTextStyle(),
        helperText: helperText,
        helperStyle: helperStyle?.toGoogleTextStyle(),
        errorText: errorText,
        errorStyle: errorStyle?.toGoogleTextStyle(),
        fillColor: fillColor,
        filled: filled,
        contentPadding: padding,
        constraints: constraints,
        focusColor: Colors.transparent,
        border: border?.border?.toBorder() ??
            MagicFactory.border.border?.toBorder(),
        enabledBorder: border?.enableBorder?.toBorder() ??
            MagicFactory.border.enableBorder?.toBorder(),
        errorBorder: border?.errorBorder?.toBorder() ??
            MagicFactory.border.errorBorder?.toBorder(),
        focusedErrorBorder: border?.focusedErrorBorder?.toBorder() ??
            MagicFactory.border.focusedErrorBorder?.toBorder(),
        focusedBorder: border?.focusedBorder?.toBorder() ??
            MagicFactory.border.focusedBorder?.toBorder(),
        disabledBorder: border?.disableBorder?.toBorder() ??
            MagicFactory.border.disableBorder?.toBorder(),
      ),
      items: list
          .map((e) => DropdownMenuItem<String>(
                value: e["key"],
                child: itemBuilder != null
                    ? itemBuilder!(e["key"], e["value"])
                    : MagicText(e["key"]),
              ))
          .toList(),
      style: MagicFactory.magicTextStyle.toGoogleTextStyle(),

      // Ensure 'selectedValue' is used instead of 'itemString(value)'
      value: selectedValue,

      onChanged: onChange != null
          ? (String? value) {
              Map<String, dynamic> result =
                  list.singleWhere((element) => element["key"] == value);
              onChange!(result["value"] as T);
            }
          : null,
      isExpanded: true,
      validator: validator != null
          ? (value) {
              T? result;
              try {
                result = list
                    .where((element) => element["key"] == value)
                    .first["value"];
              } catch (e) {
                result = null;
              }
              return validator!(value, result);
            }
          : null,
      autovalidateMode: autoValidateMode,
      borderRadius: border?.border?.radiusAll != null
          ? BorderRadius.circular(border?.border?.radiusAll ?? 0.0)
          : null,
      hint: MagicText.hint(
        "$hint",
        style: hintStyle,
      ),
      disabledHint: MagicText(
        "$disableHint",
        style: disableHintStyle,
      ),
      dropdownColor: itemColor,
      menuMaxHeight: maxMenuHeight,
      itemHeight: itemHeight,
      icon: iconDropdown,
      iconSize: iconDropdownSize ?? 24.0,
      iconDisabledColor: iconDropdownColorDisable,
      iconEnabledColor: iconDropdownColorEnable,
    );
  }
}
