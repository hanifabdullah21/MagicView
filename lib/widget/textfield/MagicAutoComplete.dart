import 'dart:async';

import 'package:flutter/material.dart';
import 'package:magic_view/factory.dart';
import 'package:magic_view/style/AutoCompleteData.dart';
import 'package:magic_view/style/MagicTextStyle.dart';
import 'package:magic_view/widget/textfield/MagicTextField.dart';
import 'package:substring_highlight/substring_highlight.dart';

import '../../style/MagicTextFieldStyle.dart';

class MagicAutoComplete<T extends Object> extends StatelessWidget {
  /// [REQUIRED] Controller untuk fieldViewBuilder
  TextEditingController controller;

  /// [REQUIRED] Pilihan yang ditampilkan
  final List<AutoCompleteData<T>> list;

  /// [REQUIRED ] Aksi ketika pilihan tersebut dipilih
  final Function(AutoCompleteData<T>)? onSelected;

  /// Kustomisasi Options Builder. Secara default jika teks di `fieldViewBuilder` kosong
  /// maka akan menampilkan seluruh [list]. Jika ada isinya maka [list] akan difilter
  /// berdasarkan [AutoCompleteData.option] yang mengandung teks di `fieldViewBuilder`
  final FutureOr<Iterable<AutoCompleteData<T>>> Function(TextEditingValue)?
      optionsBuilder;

  /// Menampilkan String pilihan yang dipilih
  final String Function(AutoCompleteData<T>)? displayStringForOption;

  /// Mengatur gaya teks dari default `optionsViewBuilder`. Jika [optionTextStyle]
  /// berisi null maka gaya teks akan disesuaikan secara default
  final MagicTextStyle? optionTextStyle;

  /// Mengatur gaya teks dari highlight default `optionsViewBuilder`.
  /// Jika [optionHighlightTextStyle] berisi null maka gaya teks akan
  /// disesuaikan secara default
  final MagicTextStyle? optionHighlightTextStyle;

  /// Mengatur lebar maksimal dari tampilan pilihan (dikurangi 40)
  /// karena margin horizontal 20.
  /// Default MediaQuery.of(context).size.width
  final double? maxWidthOption;

  /// Mengatur tinggi maksimal dari tampilan pilihan
  final double? maxHeightOption;

  /// Mengatur kustomisasi tampilan pilihan. Jika [optionsViewBuilder] != null
  /// maka [maxWidthOption] dan [maxHeightOption] diabaikan
  final Widget Function(BuildContext, Function(AutoCompleteData<T>),
      Iterable<AutoCompleteData<T>>)? optionsViewBuilder;

  /// Mengatur gaya dari `fieldViewBuilder`. [MagicTextFieldStyle] berisi
  /// seluruh gaya yang dapat diterapkan pada [MagicTextField]
  final MagicTextFieldStyle? textFieldStyle;

  /// Mengatur kustomisasi dari `fieldViewBuilder`. JIka [fieldViewBuilder] != null
  /// maka [textFieldStyle] akan diabaikan.
  ///
  /// Perlu diperhatikan jika melakukan kustomisasi, harap parameter ini disesuaikan
  /// ke dalam kustom dari tampilan anda.
  final Widget Function(
          BuildContext, TextEditingController, FocusNode, VoidCallback)?
      fieldViewBuilder;

  String? initialValue;

  MagicAutoComplete(
      {super.key,
      required this.controller,
      required this.list,
      required this.onSelected,
      this.optionsBuilder,
      this.displayStringForOption,
      this.maxWidthOption,
      this.maxHeightOption,
      this.optionsViewBuilder,
      this.textFieldStyle,
      this.fieldViewBuilder,
      this.initialValue,
      this.optionTextStyle,
      this.optionHighlightTextStyle}) {
    initialValue ??= controller.text;
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey key = GlobalKey();
    return Builder(builder: (context) {
      return Autocomplete<AutoCompleteData<T>>(
        key: key,
        // targetAnchor: Alignment.bottomLeft,
        initialValue: TextEditingValue(text: initialValue ?? ""),
        optionsBuilder: optionsBuilder ??
            (text) {
              if (text.text.isEmpty) {
                return list;
              } else {
                return (list).where((element) {
                  String value = element.option ?? "";
                  return value.toLowerCase().contains(text.text.toLowerCase());
                });
              }
            },
        displayStringForOption: displayStringForOption ??
            (value) {
              return value.option ?? "";
            },
        optionsMaxHeight: maxHeightOption ?? 200.0,
        onSelected: onSelected,
        optionsViewBuilder: optionsViewBuilder ??
            (context, onSelected, options) {
              return Align(
                alignment: Alignment.topLeft,
                child: Material(
                  elevation: 4.0,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        maxWidth: (maxWidthOption ??
                            (MediaQuery.of(context).size.width - 40)),
                        maxHeight: maxHeightOption ?? 200),
                    child: ListView.separated(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final data = options.elementAt(index);
                          String value = data.option ?? "";
                          return ListTile(
                            title: SubstringHighlight(
                              text: value,
                              term: controller.text,
                              textStyle: optionTextStyle == null
                                  ? MagicFactory.magicTextStyle
                                      .copyWith(
                                          color: data.enable
                                              ? MagicFactory.colorText
                                              : MagicFactory.colorDisable)
                                      .toGoogleTextStyle()
                                  : optionTextStyle.toGoogleTextStyle(),
                              textStyleHighlight:
                                  optionHighlightTextStyle == null
                                      ? MagicFactory.magicTextStyle
                                          .copyWith(fontWeight: FontWeight.bold)
                                          .toGoogleTextStyle()
                                      : optionHighlightTextStyle
                                          .toGoogleTextStyle(),
                            ),
                            enabled: data.enable,
                            hoverColor:
                                data.enable ? Colors.grey : Colors.transparent,
                            onTap: () {
                              onSelected(data);
                            },
                          );
                        },
                        separatorBuilder: (context, index) => const Divider(
                              height: 1,
                            ),
                        itemCount: options.length),
                  ),
                ),
              );
            },
        fieldViewBuilder: fieldViewBuilder ??
            (context, controller, focusNode, onEditingComplete) {
              this.controller = controller;
              controller.text = initialValue ?? "";
              return MagicTextField(
                controller,
                textStyle: textFieldStyle?.textStyle,
                focusNode: focusNode,
                onEditingComplete: onEditingComplete,
                onTap: textFieldStyle?.onTap,
                onChange: textFieldStyle?.onChange,
                onFieldSubmitted: textFieldStyle?.onFieldSubmitted,
                hint: textFieldStyle?.hint,
                hintStyle: textFieldStyle?.hintStyle,
                counterText: textFieldStyle?.counterText,
                counterStyle: textFieldStyle?.counterStyle,
                label: textFieldStyle?.label,
                labelStyle: textFieldStyle?.labelStyle,
                labelCustom: textFieldStyle?.labelCustom,
                floatingLabelAlignment: textFieldStyle?.floatingLabelAlignment,
                floatingLabelBehavior: textFieldStyle?.floatingLabelBehavior,
                floatingLabelStyle: textFieldStyle?.floatingLabelStyle,
                helperText: textFieldStyle?.helperText,
                helperStyle: textFieldStyle?.helperStyle,
                prefixText: textFieldStyle?.prefixText,
                prefixTextStyle: textFieldStyle?.prefixTextStyle,
                prefixIcon: textFieldStyle?.prefixIcon,
                prefixIconColor: textFieldStyle?.prefixIconColor,
                prefix: textFieldStyle?.prefix,
                suffixText: textFieldStyle?.suffixText,
                suffixTextStyle: textFieldStyle?.suffixTextStyle,
                suffixIcon: textFieldStyle?.suffixIcon,
                suffixIconColor: textFieldStyle?.suffixIconColor,
                suffix: textFieldStyle?.suffix,
                iconColor: textFieldStyle?.iconColor,
                icon: textFieldStyle?.icon,
                textCapitalization: textFieldStyle?.textCapitalization ??
                    TextCapitalization.none,
                readOnly: textFieldStyle?.readOnly ?? false,
                enabled: textFieldStyle?.enabled,
                errorText: textFieldStyle?.errorText,
                errorStyle: textFieldStyle?.errorStyle,
                validator: textFieldStyle?.validator,
                autoValidateMode: textFieldStyle?.autoValidateMode,
                textInputAction: textFieldStyle?.textInputAction,
                keyboardType: textFieldStyle?.keyboardType,
                obscureText: textFieldStyle?.obscureText ?? false,
                padding: textFieldStyle?.padding,
                border: textFieldStyle?.border ?? MagicFactory.border,
                cursorColor: textFieldStyle?.cursorColor,
                fillColor: textFieldStyle?.fillColor,
                filled: textFieldStyle?.filled,
                constraints: textFieldStyle?.constraints,
              );
            },
      );
    });
  }
}
