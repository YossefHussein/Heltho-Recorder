import 'package:bmi_test/layout/home_layout.dart';
import 'package:bmi_test/modules/bmi_module/bmi_module.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'shared/theme/theme.dart';
import 'translations/codegen_loader.g.dart';

Future<void> main() async {
  // you should yous this function with adding async to main
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      path: 'assets/translations',
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
        Locale('es'),
        Locale('fr'),
      ],
      fallbackLocale: const Locale('ar'),
      assetLoader: const CodegenLoader(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      // theme of app
      theme: ThemeData(
        scaffoldBackgroundColor: pColor,
        // add main colors to app
        colorScheme: ColorScheme.fromSwatch().copyWith(),
        // main theme to text
        textTheme: GoogleFonts.pangolinTextTheme(textTheme).apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
        // main theme to buttons
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.white,
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        useMaterial3: true,
      ),

      title: 'Bmi Test',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: BmiModule(),
    );
  }
}
