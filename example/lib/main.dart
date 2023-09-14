import 'package:example/component/ExampleMagicAutoComplete.dart';
import 'package:example/component/ExampleMagicDropdown.dart';
import 'package:example/component/ExampleMagicLayout.dart';
import 'package:example/component/ExampleMagicText.dart';
import 'package:example/component/ExampleMagicTextField.dart';
import 'package:example/component/ExampleMagicTextWithIcon.dart';
import 'package:flutter/material.dart';
import 'package:magic_view/factory.dart';
import 'package:magic_view/magic_view.dart';
import 'package:magic_view/widget/button/MagicButton.dart';
import 'package:magic_view/widget/layout/MagicLayout.dart';
import 'package:magic_view/widget/text/MagicText.dart';

import 'component/ExampleMagicButton.dart';

void main() {
  /// Jika anda ingin mengganti nilai-nilai default pada library,
  /// definisikan disini .
  ///
  /// contoh jika anda ingin mengganti Font Family :
  /// MagicFactory.fontFamily = FontFamily.openSans;
  MagicFactory.initMagicFactory(
    colorBrand: Colors.green,
    colorBrand2: Colors.pink,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ExampleMagicText(),
              const Divider(),
              ExampleMagicAutoComplete(),
              const Divider(),
              ExampleMagicTextWithIcon(),
              const Divider(),
              ExampleMagicButton(),
              const Divider(),
              ExampleMagicTextField(),
              const Divider(),
              ExampleMagicDropdown(),
              const Divider(),
              Row(
                children: [
                  MagicButton(() {
                    showMagicDialog(context,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.add,
                              size: 400,
                            ),
                            MagicText("Halo"),
                          ],
                        ));
                  }),
                  MagicButton(() {
                    showMagicAlertDialog(
                      context,
                      title: "Perhatian",
                      content: "Terjadi Kesalahan.",
                      iconType: EnumDialogIconType.failed,
                      barrierDismissable: true,
                      textPrimary: "Ulangi",
                      onPrimary: (){

                      },
                      background: Colors.blue,
                    );
                  }),
                ],
              ),
              const Divider(),
              ExampleMagicLayout(),
              // autoComplete()
            ],
          ),
        ),
      ),
    );
  }
}
