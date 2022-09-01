import 'package:bmi_test/theme.dart';
import 'package:flutter/material.dart';
import 'screen/bmi_screen.dart';

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeText = Theme.of(context).textTheme.apply(
          bodyColor: pColorText,
          displayColor: pColorText,
        );
    return MaterialApp(
      theme: ThemeData(
        primaryColor: pColor,
        backgroundColor: pColor,
        textTheme: themeText,
      ),
      home: const BmiScreen(),
    );
  }
}
