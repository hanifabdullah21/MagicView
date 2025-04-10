import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:magic_view/factory.dart';

showMagicDatePicker(BuildContext context,
    {required Function(DateTime? resultReal, String? resultFormat) onResult,
    String formatResult = "dd-MM-yyyy",
    String? timeSelected,
    DateTime? firstDate}) async {
  DateTime initialDate = DateTime.now();
  if (timeSelected != null && timeSelected != "") {
    initialDate = DateFormat(formatResult, "id").parse(timeSelected);
  }

  await showDatePicker(
    context: context,
    initialDate: initialDate,
    firstDate: firstDate ?? DateTime.now(),
    lastDate: DateTime(2050),
    builder: (context, child) {
      return Theme(
        data: ThemeData.light().copyWith(
          primaryColor: MagicFactory.colorBrand,
          colorScheme: ColorScheme.light(primary: MagicFactory.colorBrand),
          buttonTheme:
              const ButtonThemeData(textTheme: ButtonTextTheme.primary),
        ),
        child: child!,
      );
    },
  ).then((value) => onResult(value,
      value != null ? DateFormat(formatResult, "id").format(value) : null));
}
