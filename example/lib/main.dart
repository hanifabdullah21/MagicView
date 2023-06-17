import 'package:flutter/material.dart';
import 'package:magic_view/factory.dart';
import 'package:magic_view/property/font/font.dart';
import 'package:magic_view/style/MagicTextStyle.dart';
import 'package:magic_view/widget/button/MagicButton.dart';
import 'package:magic_view/widget/text/MagicText.dart';
import 'package:magic_view/widget/text/MagicTextIcon.dart';

void main() {
  /// Jika anda ingin mengganti nilai-nilai default pada library,
  /// definisikan disini .
  ///
  /// contoh jika anda ingin mengganti Font Family :
  /// MagicFactory.fontFamily = FontFamily.openSans;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MagicText(
              "MagicText dengan mengatur property style",
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
            MagicText("MagicText dengan mengatur properti satuan",
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
            Divider(),
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
            Divider(),
            MagicButton(
              () {
                // Do Something here
              },
              text: "Tekan Disini",
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
            )
          ],
        ),
      ),
    );
  }
}
