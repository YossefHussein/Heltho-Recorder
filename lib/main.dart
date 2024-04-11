import 'package:bmi_test/controller/shared_cubit/shared_cubit.dart';
import 'package:bmi_test/controller/states.dart';
import 'package:bmi_test/layout/home_layout.dart';
import 'package:bmi_test/modules/1_gender_user.dart';
import 'package:bmi_test/modules/2_height.dart';
import 'package:bmi_test/modules/3_age_and_weight.dart';
import 'package:bmi_test/modules/4_result.dart';
import 'package:bmi_test/modules/confetti_screen.dart';

// import 'package:bmi_test/modules/old_app/result_module.dart';
// import 'package:bmi_test/test.dart';
// import 'package:device_info_plus/device_info_plus.dart';
import 'package:bmi_test/shared/routes/main_routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

// import 'package:battery_plus/battery_plus.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:uuid/uuid.dart';

import 'controller/cubit.dart';
import 'shared/theme/theme.dart';
import 'shared/translations/codegen_loader.g.dart';

// import 'package:network_info_plus/network_info_plus.dart';
// import 'package:location/location.dart';

Future<void> main() async {
  // you should use this with adding async to main
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  MobileAds.instance.initialize();

  BmiMainCubit.initDatabase();

  /// wifi information
  // final info = NetworkInfo();
  // // final wifiName = await info.getWifiName(); // "FooNetwork"
  // // print('Running (WIFI) on ${wifiName}');
  // // final wifiBSSID = await info.getWifiBSSID(); // 11:22:33:44:55:66
  // // print('Running (WIFI)  on ${wifiBSSID}');
  // // final wifiIP = await info.getWifiIP(); // 192.168.1.43
  // // print('Running (WIFI) on ${wifiIP}');
  // // final wifiIPv6 =
  // //     await info.getWifiIPv6(); // 2001:0db8:85a3:0000:0000:8a2e:0370:7334
  // // print('Running (WIFI) on ${wifiIPv6}');
  // // final wifiSubmask = await info.getWifiSubmask(); // 255.255.255.0
  // // print('Running (WIFI) on ${wifiName}');
  // // final wifiBroadcast = await info.getWifiBroadcast(); // 192.168.1.255
  // // print('Running (WIFI)  on ${wifiBroadcast}');
  // // final wifiGateway = await info.getWifiGatewayIP(); // 192.168.1.1
  // // print('Running (WIFI)  on ${wifiGateway}');

  // /// device info
  // // DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  // // AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  // // print('Running on ${androidInfo.model}'); // e.g. "Moto G (4)"

  // // IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
  // // print('Running on ${iosInfo.utsname.machine}'); // e.g. "iPod7,1"

  // // WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
  // // // e.g. "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:61.0) Gecko/20100101 Firefox/61.0"
  // // print('Running on ${webBrowserInfo.userAgent}');
  // // // to get all data
  // // var getDevice = await deviceInfo.deviceInfo;
  // // final allInfo = getDevice.data;
  // // print('all device info ${allInfo.toString()}');
  // // // In order to request location, you should always check Location
  // // // Service status and Permission status manually

  // Location location = new Location();

  // bool _serviceEnabled;
  // PermissionStatus _permissionGranted;
  // LocationData _locationData;

  // _serviceEnabled = await location.serviceEnabled();
  // if (!_serviceEnabled) {
  //   _serviceEnabled = await location.requestService();
  //   if (!_serviceEnabled) {
  //     return;
  //   }
  // }

  // _permissionGranted = await location.hasPermission();
  // if (_permissionGranted == PermissionStatus.denied) {
  //   _permissionGranted = await location.requestPermission();
  //   if (_permissionGranted != PermissionStatus.granted) {
  //     return;
  //   }
  // }

  // _locationData = await location.getLocation();
  // print("the divice location Is $_locationData");
  // // You can also get continuous callbacks when your position is changing:
  // location.onLocationChanged.listen((LocationData currentLocation) {
  //   print("data will be change to  ${_locationData}");
  // });
  // // To receive location when application is in background you have to enable it:
  // location.enableBackgroundMode(enable: true);

  // // Instantiate it
  // var battery = Battery();

  // // Access current battery level
  // print(await battery.batteryLevel);

  // // Be informed when the state (full, charging, discharging) changes
  // battery.onBatteryStateChanged.listen((BatteryState state) {
  //   // Do something with new state
  // });

  // // Check if device in battery save mode
  // // Currently available on Android, iOS and Windows platforms only
  // print(await battery.isInBatterySaveMode);

//   /// for get date of user
//   var dataUserUsedOfTimeStamp = DateTime.timestamp().toString();
//   var dataUserUsedOfHour = DateTime.now().hour.toString();
//   var dataUserUsedOfDay = DateTime.now().day.toString();
//   var dataUserUsedOfMonth = DateTime.now().month.toString();
//   var dataUserUsedOfYear = DateTime.now().year.toString();
//   var dataUserUsedOfWeekDay = DateTime.now().weekday.toString();
//   var dataUserUsedOfTimeZoneName = DateTime.now().timeZoneName.toString();
//   var dataUserUsedOfTimeZoneOffset = DateTime.now().timeZoneOffset.toString();
//   var dataUserUsingInfo = ["timestamp: $dataUserUsedOfTimeStamp" , "date: $dataUserUsedOfHour / $dataUserUsedOfDay / $dataUserUsedOfMonth / $dataUserUsedOfYear " , "WeekDay: $dataUserUsedOfWeekDay " " UserfTimeZoneName: $dataUserUsedOfTimeZoneName | $dataUserUsedOfTimeZoneName | $dataUserUsedOfTimeZoneOffset"];
//  print(dataUserUsingInfo);

  var uuid = Uuid();
  var userNameId = uuid.v4(); // -> '110ec58a-a0f2-4ac4-8393-c866d813b8d1'
  print(userNameId.toString);

  Shared.inti();
  Shared.getData(key: 'test');

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
    return MultiBlocProvider(
      providers: [
        BlocProvider<BmiMainCubit>(create: (context) => BmiMainCubit()),
        // BlocProvider<SharedCubit>(create: (context) => SharedCubit()),
      ],
      child: BlocConsumer<BmiMainCubit, BmiStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            // theme of app
            theme: ThemeData(
              appBarTheme: AppBarTheme(color: pColor),
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
            title: 'Health Recorder',
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            // default screen
            initialRoute:  Shared.userCompletedTest == true
              ? resultScreenRoute
              : homeLayoutRoute,
            routes: {
              homeLayoutRoute: (context) => const HomeLayout(),
              genderUserScreenRoute: (context) => const GenderUser(),
              heightScreenRoute: (context) => const HeightScreen(),
              ageAndWeightScreenRoute: (context) => AgeAndWeightScreen(),
              confettiScreenRoute: (context) => ConfettiScreen(),
              resultScreenRoute: (context) => ResultScreen(),
              // testingScreenRoute: (context) => const TestingScreen()
            },
          );
        },
      ),
    );
  }
}
