import 'package:bmi_test/controller/states.dart';
import 'package:bmi_test/layout/home_layout.dart';
import 'package:bmi_test/modules/1_gender_user.dart';
import 'package:bmi_test/modules/2_height.dart';
import 'package:bmi_test/modules/3_age_and_weight.dart';
import 'package:bmi_test/modules/4_result.dart';
import 'package:bmi_test/modules/confetti_screen.dart';
import 'package:bmi_test/modules/old_app/result_module.dart';
import 'package:bmi_test/shared/routes/main_routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'controller/cubit.dart';
import 'shared/theme/theme.dart';
import 'shared/translations/codegen_loader.g.dart';

Future<void> main() async {
  // you should use this with adding async to main
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  // MobileAds.instance.initialize();
  runApp(
    EasyLocalization(
      path: 'assets/translations',
      supportedLocales: const [
        Locale('en'),
        Locale('es'),
        Locale('fr'),
        Locale('ar'),
      ],
      // ignore: prefer_const_constructors
      fallbackLocale: Locale('en'),
      // ignore: prefer_const_constructors
      assetLoader: CodegenLoader(),
      // ignore: prefer_const_constructors
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BmiMainCubit(),
      child: BlocConsumer<BmiMainCubit, BmiStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            // theme of app
            theme: ThemeData(
              scaffoldBackgroundColor: pColor,
              // add main colors to app
              colorScheme: ColorScheme.fromSwatch().copyWith(
                primary: pColor,
                secondary: sColor,
              ),
              // main theme to text
              textTheme: GoogleFonts.cairoTextTheme().apply(
                bodyColor: pColorText,
                displayColor: pColorText,
              ),
              iconTheme: IconThemeData(
                color: pColorIcon,
              ),
              useMaterial3: true,
            ),
            title: 'Bmi Test',
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            // default screen 
            initialRoute: homeLayoutRoute,
            routes: {
              homeLayoutRoute: (context) => const HomeLayout(),
              genderUserScreenRoute: (context) => const GenderUser(),
              heightScreenRoute: (context) => const HeightScreen(),
              ageAndWeightScreenRoute: (context) => const AgeAndWeightScreen(),
              resultScreenRoute: (context) => const ResultScreen(),
            },
          );
        },
      ),
    );
  }
}
