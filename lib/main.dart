import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'modules/bmi_module/bmi_module.dart';
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
    return MaterialApp(
      // theme of app
      theme: ThemeData(
        // add main colors to app
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: sColor,
          primary: pColor,
        ),
        fontFamily: 'Pangolin',
        // main theme to text
        textTheme: TextTheme().apply(
          bodyColor: Color(0xFFFFFFFF),
          displayColor: Color(0xFFFFFFFF),
        ),
        // main theme appBar
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0.0,
        ),
      ),
      title: 'Bmi Test',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const BmiModule(),
    );
  }
}
