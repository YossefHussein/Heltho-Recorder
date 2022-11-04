import 'package:bmi_test/layout/home_layout.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'shared/theme/theme.dart';
import 'translations/codegen_loader.g.dart';

Future<void> main() async {
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
      child: const MyApp(),
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
        scaffoldBackgroundColor: sColor,
        // add main colors to app
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: sColor,
          primary: pColor,
        ),
        // main theme to text
        textTheme: GoogleFonts.pangolinTextTheme(textTheme).apply(
          bodyColor: pColorText,
          displayColor: pColorText,
        ),
        // main theme appBar
        appBarTheme: AppBarTheme(
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.red,
        ),
      ),
      title: 'Bmi Test',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: HomeLayout(),
    );
  }
}
