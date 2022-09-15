import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'screen/bmi_screen.dart';
import 'package:bmi_test/theme.dart';

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextTheme themeText = Theme.of(context).textTheme.apply(
          bodyColor: pColorText,
          displayColor: pColorText,
        );
    return MaterialApp(
      /// Theme of app
      theme: ThemeData(
        // Add main colors to app
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: sColor,
          primary: pColor,
        ),
        // Main theme to text
        textTheme: themeText,
        // main theme appBar
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0.0,
        ),
      ),
      home: const BmiScreen(),
    );
  }
}
