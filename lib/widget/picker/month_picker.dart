import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../factory.dart';
import '../button/MagicButton.dart';
import '../dialog/MagicDialogFunction.dart';
import '../text/MagicText.dart';

showMagicMonthPicker(BuildContext context,
    {DateTime? initialDate,
    String? formatMonth,
    required Function(DateTime, String, String) onSelected}) {
  showMagicDialog(context,
      child: _MonthPicker(
        initialDate: initialDate ?? DateTime.now(),
        formatMonth: formatMonth = "MMM",
        onSelected: onSelected,
      ));
}

class _MonthPicker extends StatefulWidget {
  DateTime initialDate = DateTime.now();
  String formatMonth;
  Function(DateTime, String, String) onSelected;

  List<int> months = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
  late int monthFocused;
  late PageController monthController;

  List<int> year = [];
  late int yearFocused;
  late PageController yearController;

  _MonthPicker({
    super.key,
    required this.initialDate,
    required this.onSelected,
    this.formatMonth = "MMM",
  }) {
    monthController = PageController(
      viewportFraction: 0.35,
      initialPage: months.indexOf(initialDate.month),
    );
    monthFocused = monthController.initialPage;

    for (int i = DateTime.now().year - 100;
        i <= DateTime.now().year + 50;
        i++) {
      year.add(i);
    }
    yearController = PageController(
      viewportFraction: 0.35,
      initialPage: year.indexOf(initialDate.year),
    );
    yearFocused = yearController.initialPage;
  }

  @override
  State<StatefulWidget> createState() {
    return _MonthPickerState();
  }
}

class _MonthPickerState extends State<_MonthPicker> {
  _MonthPickerState();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 150,
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: PageView.builder(
                      itemCount: 12,
                      onPageChanged: (page) {
                        setState(() {
                          widget.monthFocused = page;
                        });
                      },
                      itemBuilder: (context, index) {
                        if (widget.monthFocused == index) {
                          return item(
                              DateFormat(widget.formatMonth, "id")
                                  .format(DateTime(2023, widget.months[index])),
                              true);
                        } else {
                          return item(
                              DateFormat(widget.formatMonth, "id")
                                  .format(DateTime(2023, widget.months[index])),
                              false);
                        }
                      },
                      scrollDirection: Axis.vertical,
                      allowImplicitScrolling: true,
                      controller: widget.monthController)),
              Expanded(
                  flex: 1,
                  child: PageView.builder(
                      itemCount: widget.year.length,
                      onPageChanged: (page) {
                        setState(() {
                          widget.yearFocused = page;
                        });
                      },
                      itemBuilder: (context, index) {
                        if (widget.yearFocused == index) {
                          return item("${widget.year[index]}", true);
                        } else {
                          return item("${widget.year[index]}", false);
                        }
                      },
                      scrollDirection: Axis.vertical,
                      allowImplicitScrolling: true,
                      controller: widget.yearController)),
            ],
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            MagicButton(
              () {
                Navigator.pop(context);
              },
              text: "Batal",
              textColor: MagicFactory.colorBrand,
              strokeWidth: 1,
              strokeColor: MagicFactory.colorBrand,
              background: Colors.white,
            ),
            const SizedBox(
              width: 8,
            ),
            MagicButton(
              () {
                Navigator.pop(context);

                DateTime newDateTime = DateTime(widget.year[widget.yearFocused],
                    widget.months[widget.monthFocused]);
                String monthString =
                    DateFormat(widget.formatMonth, "id").format(newDateTime);
                String yearString =
                    DateFormat("yyyy", "id").format(newDateTime);
                widget.onSelected(newDateTime, monthString, yearString);
              },
              text: "Pilih",
              textColor: Colors.white,
            ),
          ],
        )
      ],
    );
  }

  item(String data, bool isFocus) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border(
        top: isFocus ? const BorderSide(color: Colors.black) : BorderSide.none,
        bottom:
            isFocus ? const BorderSide(color: Colors.black) : BorderSide.none,
      )),
      child: MagicText(
        data,
        color: isFocus ? MagicFactory.colorText : Color(0xffb0b0b0),
        fontSize: 18,
      ),
    );
  }
}
