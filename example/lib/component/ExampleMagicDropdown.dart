import 'package:example/ExampleModel.dart';
import 'package:flutter/material.dart';
import 'package:magic_view/widget/button/MagicButton.dart';
import 'package:magic_view/widget/text/MagicTextIcon.dart';
import 'package:magic_view/widget/textfield/MagicDropDown.dart';

class ExampleMagicDropdown extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ExampleMagicDropdownPageState();
}

class ExampleMagicDropdownPageState extends State<ExampleMagicDropdown> {
  final key = GlobalKey<FormState>();
  List<ExampleModel> items = [
    ExampleModel(id: 1, name: "Nama No.1", icon: Icons.circle),
    ExampleModel(id: 2, name: "Nama No.2", icon: Icons.rectangle),
    ExampleModel(id: 3, name: "Nama No.3", icon: Icons.star),
  ];
  ExampleModel? selectedData;
  ExampleModel? selectedDataWithValue =
      ExampleModel(id: 1, name: "Nama No.1", role: "Superadmin");
  bool disableDropDown = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: key,
      child: Column(
        children: [
          MagicDropDown<ExampleModel>(
            value: selectedData,
            items: items,
            hint: "Default Dropdown",
            itemString: (data) {
              return data?.name ?? "";
            },
            onChange: (data) {
              setState(() {
                selectedData = data;
              });
            },
          ),
          Container(
            width: MediaQuery.of(context).size.width / 2,
            child: MagicDropDown<ExampleModel>(
              value: selectedDataWithValue,
              items: items,
              hint: "Complex Dropdown",
              itemString: (data) {
                return data?.name ?? "";
              },
              onChange: disableDropDown
                  ? null
                  : (data) {
                      setState(() {
                        selectedDataWithValue = data;
                      });
                    },
              validator: (text, data) {
                if (text == null || text.isEmpty)
                  return "Wajib memilih salah satu";
                return null;
              },
              autoValidateMode: AutovalidateMode.always,
              itemBuilder: (itemString, data) {
                return MagicTextIcon.icon(itemString,
                    icon: data.icon ?? Icons.cloud);
              },
            ),
          ),
          MagicButton(
            () {
              setState(() {
                disableDropDown = !disableDropDown;
              });
            },
            text: disableDropDown ? "Enable Dropdown" : "Disable Dropdown",
          )
        ],
      ),
    );
  }
}
