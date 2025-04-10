import 'package:flutter/material.dart';
import 'package:magic_view/style/AutoCompleteData.dart';
import 'package:magic_view/widget/textfield/MagicAutoComplete.dart';

import '../ExampleModel.dart';

class ExampleMagicAutoComplete extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ExampleMagicAutoCompleteState();
}

class ExampleMagicAutoCompleteState extends State<ExampleMagicAutoComplete> {
  TextEditingController controller = TextEditingController();
  List<ExampleModel> items = [
    ExampleModel(id: 1, name: "Nama No.1", icon: Icons.circle),
    ExampleModel(id: 2, name: "Nama No.2", icon: Icons.rectangle),
    ExampleModel(id: 3, name: "Nama No.3", icon: Icons.star),
  ];
  AutoCompleteData<ExampleModel>? selectedData;

  @override
  Widget build(BuildContext context) {
    return MagicAutoComplete<ExampleModel>(
        controller: controller,
        // initialValue: selectedData?.option,
        list: items.map((e) => AutoCompleteData(e.name, e)).toList(),
        onSelected: (value) {
          debugPrint("${value.option}");
          setState(() {
            selectedData = value;
            controller.text = selectedData?.option ?? "";
          });
        });
  }
}
