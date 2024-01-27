import 'dart:io';

import 'package:bmi_test/controller/cubit.dart';
import 'package:bmi_test/controller/states.dart';
import 'package:bmi_test/shared/routes/main_routes.dart';
import 'package:bmi_test/shared/theme/theme.dart';
import 'package:bmi_test/shared/translations/locale_keys.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:url_launcher/url_launcher.dart';

class ResultScreen extends StatefulWidget {
  /// The requested size of the banner. Defaults to [AdSize.banner].
  // final AdSize? adSize;

  /// The AdMob ad unit to show.
  ///
  /// TODO: replace this test ad unit with your own ad unit
  final String adUnitId = Platform.isAndroid
      // Use this ad unit on Android...
      ? 'ca-app-pub-3940256099942544/6300978111'
      // ... or this one on iOS.
      : 'ca-app-pub-3940256099942544/2934735716';
  ResultScreen({
    super.key,
    // this.adSize = AdSize.banner,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late BannerAd _bannerAd;
  var _isBannerAdReady = false;

  /// Loads a banner ad.
  // void _loadAd() {
  //   _bannerAd = BannerAd(
  //     adUnitId: widget.adUnitId,
  //     request: AdRequest(),
  //     // there default value in google mobile ad
  //     size: ,
  //     listener: BannerAdListener(
  //       // Called when an ad is successfully received.
  //       onAdLoaded: (_) {
  //         setState(() {
  //           _isBannerAdReady = true;
  //         });
  //       },
  //       onAdFailedToLoad: (ad, err) {
  //         _isBannerAdReady = false;
  //         ad.dispose();
  //       },
  //     ),
  //   );

  //   // Start loading.
  //   _bannerAd.load();
  // }

//   InterstitialAd? _interstitialAd;

//   void _createInterstitialAd() {
//     InterstitialAd.load(
//         adUnitId: AdHelper.interstitialAdUnitId,
//         request: request,
//         adLoadCallback: InterstitialAdLoadCallback(
//           onAdLoaded: (InterstitialAd ad) {
//             print('$ad loaded');
//             _interstitialAd = ad;
//             _numInterstitialLoadAttempts = 0;
//             _interstitialAd!.setImmersiveMode(true);
//           },
//           onAdFailedToLoad: (LoadAdError error) {
//             print('InterstitialAd failed to load: $error.');
//             _numInterstitialLoadAttempts += 1;
//             _interstitialAd = null;
//             if (_numInterstitialLoadAttempts < maxFailedLoadAttempts) {
//               _createInterstitialAd();
//             }
//           },
//         ));
//   }

//   void _showInterstitialAd() {
//   if (_interstitialAd == null) {
//     print('Warning: attempt to show interstitial before loaded.');
//     return;
//   }
//   _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
//     onAdShowedFullScreenContent: (InterstitialAd ad) =>
//         print('ad onAdShowedFullScreenContent.'),
//     onAdDismissedFullScreenContent: (InterstitialAd ad) {
//       print('$ad onAdDismissedFullScreenContent.');
//       ad.dispose();
//       _createInterstitialAd();
//     },
//     onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
//       print('$ad onAdFailedToShowFullScreenContent: $error');
//       ad.dispose();
//       _createInterstitialAd();
//     },
//   );
//   _interstitialAd!.show();
//   _interstitialAd = null;
// }

  @override
  void initState() {
    super.initState();
    // _loadAd();
  }

  @override
  void dispose() {
    _bannerAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BmiMainCubit, BmiStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          // disable the code
          appBar: AppBar(
            title: const Text('Result'),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    genderUserScreenRoute,
                  );
                  context.read<BmiMainCubit>().deleteLocalAuth();
                },
                icon: const FaIcon(FontAwesomeIcons.deleteLeft),
              )
            ],
            leading: IconButton(
              tooltip: "repeat the Test",
              icon: const FaIcon(FontAwesomeIcons.repeat),
              onPressed: () {
                // _showInterstitialAd();
                context.read<BmiMainCubit>().deleteLocalAuth();
                context.read<BmiMainCubit>().changeLocalAuth();
                // Navigator.pushReplacementNamed(context, heightScreenRoute);
                Navigator.pushReplacementNamed(
                  context,
                  heightScreenRoute,
                );
              },
            ),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(pPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        // gender user
                        Text(
                          '${LocaleKeys.yourGender.tr()} : ${context.read<BmiMainCubit>().isMale == true ? LocaleKeys.man.tr() : LocaleKeys.woman.tr()}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // user height
                        Text(
                          '${LocaleKeys.yourHeight.tr()} : ${context.read<BmiMainCubit>().heightValue}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // user weight
                        Text(
                          '${LocaleKeys.yourWeight.tr()} : ${context.read<BmiMainCubit>().weightValue}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // age user
                        Text(
                          '${LocaleKeys.yourAge.tr()} : ${context.read<BmiMainCubit>().ageValue}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // bmi result of user
                        Text(
                          '${LocaleKeys.bmiResult.tr()} : ${context.read<BmiMainCubit>().resultPrint().round()}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        //
                      ],
                    ),
                    const SizedBox(
                      height: pSizeBox,
                    ),
                    // image BMI
                    GestureDetector(
                      onDoubleTap: () async {},
                      child: Image.asset(
                        'assets/images/BMI_chart.png',
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        final Uri _url = Uri.parse(
                          'https://ourworldindata.org/obesity#',
                        );
                        if (!await launchUrl(_url,
                            mode: LaunchMode.externalApplication)) {
                          throw Exception('Could not launch $_url');
                        }
                      },
                      child: Text(
                        LocaleKeys.clickArticleOnPhotoToSeeArtical.tr(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    // if (_isBannerAdReady)
                    //   Align(
                    //     alignment: Alignment.bottomCenter,
                    //     child: Container(
                    //       width: _bannerAd.size.width.toDouble(),
                    //       height: _bannerAd.size.height.toDouble(),
                    //       child: _bannerAd == null
                    //           // Nothing to render yet.
                    //           ? SizedBox()
                    //           // The actual ad.
                    //           : AdWidget(ad: _bannerAd),
                    //     ),
                    //   )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
