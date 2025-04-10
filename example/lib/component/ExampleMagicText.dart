import 'package:flutter/material.dart';
import 'package:magic_view/property/font/font.dart';
import 'package:magic_view/style/MagicTextStyle.dart';
import 'package:magic_view/widget/text/MagicText.dart';

class ExampleMagicText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MagicText(
          "MagicText dengan mengatur property style [MagicTextStyle]",
          style: MagicTextStyle(
              maxLines: 1,
              fontWeight: FontWeight.normal,
              fontFamily: FontFamily.lato,
              color: Colors.black,
              fontSize: 14,
              fontStyle: FontStyle.normal,
              textOverflow: null,
              textAlign: null),
        ),
        MagicText("MagicText dengan mengatur properti tanpa style",
            maxLines: 1,
            fontWeight: FontWeight.normal,
            fontFamily: FontFamily.lato,
            color: Colors.black,
            fontSize: 14,
            fontStyle: FontStyle.normal,
            textOverflow: null,
            textAlign: null),
        MagicText.head("MagicText dengan tipe Head"),
        MagicText.subhead("MagicText dengan tipe Subhead"),
        MagicText.hint("MagicText dengan tipe hint"),
      ],
    );
  }
}
