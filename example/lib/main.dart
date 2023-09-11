import 'package:example/component/ExampleMagicDropdown.dart';
import 'package:example/component/ExampleMagicText.dart';
import 'package:example/component/ExampleMagicTextField.dart';
import 'package:example/component/ExampleMagicTextWithIcon.dart';
import 'package:flutter/material.dart';
import 'package:magic_view/factory.dart';
import 'package:magic_view/magic_view.dart';

import 'component/ExampleMagicButton.dart';

void main() {
  /// Jika anda ingin mengganti nilai-nilai default pada library,
  /// definisikan disini .
  ///
  /// contoh jika anda ingin mengganti Font Family :
  /// MagicFactory.fontFamily = FontFamily.openSans;
  MagicFactory.initMagicFactory(
    colorBrand: Colors.blue,
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
              ExampleMagicTextWithIcon(),
              const Divider(),
              ExampleMagicButton(),
              const Divider(),
              ExampleMagicTextField(),
              const Divider(),
              ExampleMagicDropdown()
              // autoComplete()
            ],
          ),
        ),
      ),
    );
  }
}
