import 'package:flutter/material.dart';
import 'package:magic_view/factory.dart';
import 'package:magic_view/property/font/font.dart';
import 'package:magic_view/style/AutoCompleteData.dart';
import 'package:magic_view/style/MagicTextStyle.dart';
import 'package:magic_view/widget/button/MagicButton.dart';
import 'package:magic_view/widget/text/MagicText.dart';
import 'package:magic_view/widget/text/MagicTextIcon.dart';
import 'package:magic_view/widget/textfield/MagicAutoComplete.dart';
import 'package:magic_view/widget/textfield/MagicTextField.dart';

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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: MagicAutoComplete<String>(
                    controller: TextEditingController(),
                    list: [
                      AutoCompleteData<String>("Hanif3", "data"),
                      AutoCompleteData<String>("Hanif3", "data"),
                      AutoCompleteData<String>("Hanif3", "data"),
                    ],
                    onSelected: (selectedData){

                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: MagicAutoComplete<String>(
                    controller: TextEditingController(),
                    list: [
                      AutoCompleteData<String>("Hanif3", "data"),
                      AutoCompleteData<String>("Hanif3", "data"),
                      AutoCompleteData<String>("Hanif3", "data"),
                    ],
                    onSelected: (selectedData){

                    },
                  ),
                ),
              ],
            ),
            Divider(),
            textColumn(),
            Divider(),
            textIconColumn(),
            Divider(),
            buttonColumn(),
            Divider(),
            textFieldColumn(),
            Divider(),
          ],
        ),
      ),
    );
  }

  Widget textColumn() {
    return Column(
      children: [
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
      ],
    );
  }

  Widget textIconColumn() {
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

  Widget buttonColumn() {
    return Column(
      children: [
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
        ),
      ],
    );
  }

  Widget textFieldColumn() {
    TextEditingController controller = TextEditingController();

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
