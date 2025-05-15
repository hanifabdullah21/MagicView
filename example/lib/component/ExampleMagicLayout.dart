import 'package:flutter/material.dart';
import 'package:magic_view/factory.dart';
import 'package:magic_view/widget/button/MagicButton.dart';
import 'package:magic_view/widget/layout/MagicLayout.dart';
import 'package:magic_view/widget/text/MagicText.dart';
import 'package:magic_view/widget/text/MagicTextIcon.dart';

class ExampleMagicLayout extends StatelessWidget {
  List<Widget> widgets = [
    Container(color: Colors.blue, child: MagicText("Satu")),
    Container(color: Colors.green, child: MagicText("Dua")),
    Container(color: Colors.red, child: MagicText("Tiga")),
    Container(color: Colors.pink, child: MagicText("Empat")),
    Container(color: Colors.grey, child: MagicText("Lima")),
    Container(color: Colors.amber, child: MagicText("Enam")),
    Container(color: Colors.amberAccent, child: MagicText("Tujuh")),
  ];

  @override
  Widget build(BuildContext context) {
    return MagicLayout(
      largeScreen: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5, childAspectRatio: 5.0),
        itemBuilder: (context, index) {
          return widgets[index];
        },
        shrinkWrap: true,
        itemCount: widgets.length,
      ),
      mediumScreen: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, childAspectRatio: 5.0),
        itemBuilder: (context, index) {
          return widgets[index];
        },
        shrinkWrap: true,
        itemCount: widgets.length,
      ),
      smallScreen: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, childAspectRatio: 5.0),
        itemBuilder: (context, index) {
          return widgets[index];
        },
        shrinkWrap: true,
        itemCount: widgets.length,
      ),
    );
  }
}
