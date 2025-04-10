import 'package:flutter/material.dart';
import 'package:magic_view/factory.dart';
import 'package:magic_view/widget/button/MagicButton.dart';
import 'package:magic_view/widget/text/MagicTextIcon.dart';

class ExampleMagicButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MagicButton(
              () {
            // Do Something here
          },
          text: "Tekan Disini (Default)",
        ),
        MagicButton(
              () {
            // Do Something here
          },
          widthInfinity: true,
          text: "Tekan Disini (Full Width)",
        ),
        MagicButton(
              () {},
          text: "Teks",
          child: MagicTextIcon.network(
            "MagicTextIcon with Network",
            url: "https://cdn-icons-png.flaticon.com/128/415/415733.png",
            side: MagicTextIconSide.left,
            spaces: 8,
            width: 16,
            height: 16,
            textStyle: MagicFactory.magicTextStyle,
            horizontalAlignment: MainAxisAlignment.start,
            verticalAlignment: CrossAxisAlignment.start,
          ),
        ),
      ],
    );
  }

}