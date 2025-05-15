import 'package:flutter/material.dart';
import 'package:magic_view/factory.dart';
import 'package:magic_view/widget/text/MagicTextIcon.dart';

class ExampleMagicTextWithIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MagicTextIcon.icon(
          "MagicTextIcon with Icon",
          icon: Icons.apple,
          side: MagicTextIconSide.left,
          spaces: 8,
          size: 16,
          textStyle: MagicFactory.magicTextStyle,
          horizontalAlignment: MainAxisAlignment.start,
          verticalAlignment: CrossAxisAlignment.start,
        ),
        MagicTextIcon.network(
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
        MagicTextIcon.asset(
          "MagicTextIcon with Asset",
          asset: "assets/asset-example.png",
          side: MagicTextIconSide.left,
          spaces: 8,
          width: 16,
          height: 16,
          textStyle: MagicFactory.magicTextStyle,
          horizontalAlignment: MainAxisAlignment.start,
          verticalAlignment: CrossAxisAlignment.start,
        ),
      ],
    );
  }
}
