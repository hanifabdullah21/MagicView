import 'package:flutter/material.dart';
import 'package:magic_view/widget/textfield/MagicTextField.dart';

class ExampleMagicTextField extends StatelessWidget{
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MagicTextField(
          controller,
          hint: "Masukkan nama",
        ),
        MagicTextField.password(
          controller,
          hint: "Masukkan nama",
        ),
        MagicTextField.border(
          controller,
          hint: "Masukkan nama",
        ),
        MagicTextField.borderPassword(
          controller,
          hint: "Masukkan nama",
        ),
      ],
    );
  }

}