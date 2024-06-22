import 'package:bmi_test/controller/cubit.dart';
import 'package:bmi_test/controller/states.dart';
import 'package:bmi_test/shared/routes/main_routes.dart';
import 'package:bmi_test/shared/theme/theme.dart';
import 'package:bmi_test/shared/translations/locale_keys.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../shared/ads/ads_helper.dart';
import '../shared/shared_prefs/shared_prefs.dart';

class ResultScreen extends StatefulWidget {
  ResultScreen({
    super.key,
    // this.adSize = AdSize.banner,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  // for make banner
  BannerAd? _banner;

  // this method to adding setting
  void _createBannerAd() {
    _banner = BannerAd(
      size: AdSize.fullBanner,
      adUnitId: AdHelper.bannerAdUnitId!,
      listener: AdHelper.bannerListener,
      request: const AdRequest(),
    )..load();
  }

  @override
  void initState() {
    super.initState();
    _createBannerAd();
  }

  RewardedAd? _rewardedAd;
  int _rewardedScore = 0;

  void _createRewardedAd() {
    RewardedAd.load(
      adUnitId: AdHelper.rewardedAdUnitId!,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (ad) => setState(() => _rewardedAd = ad),
          onAdFailedToLoad: (error) => setState(() {
                _rewardedAd = null;
              })),
    );
  }

  void _showRewardedAd() {
    if (_rewardedAd != null) {
      _rewardedAd!.fullScreenContentCallback =
          FullScreenContentCallback(onAdDismissedFullScreenContent: (ad) {
        ad.dispose();
        _createRewardedAd();
      }, onAdFailedToShowFullScreenContent: (ad, error) {
        ad.dispose();
        _createRewardedAd();
      });
      _rewardedAd!.show(
        onUserEarnedReward: (AdWithoutView ad, RewardItem reward) =>
            _rewardedScore++,
      );
    }
    _rewardedAd = null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BmiMainCubit, BmiStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          // disable the code
          appBar: AppBar(
            title: Text('Result Score $_rewardedScore'),
            centerTitle: true,
            leading: IconButton(
              tooltip: "repeat the Test",
              icon: const FaIcon(FontAwesomeIcons.repeat),
              onPressed: () async {
                Shared.deleteLocalAuth(key: 'test');
                // context.read<SharedCubit>().changeLocalAuth();
                Navigator.pushReplacementNamed(
                  context,
                  heightScreenRoute,
                );
              },
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    genderUserScreenRoute,
                  );
                  Shared.deleteLocalAuth(key: 'test');
                },
                icon: const FaIcon(FontAwesomeIcons.deleteLeft),
              ),
            ],
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(pPadding),
                child: SafeArea(
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
                        onTap: () async {
                          final Uri _url = Uri.parse(
                            'https://ourworldindata.org/obesity#',
                          );
                          if (!await launchUrl(_url,
                              mode: LaunchMode.externalApplication)) {
                            throw Exception('Could not launch $_url');
                          }
                        },
                        child: Image.asset(
                          'assets/images/share-of-deaths-obesity.png',
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

                    ],
                  ),
                ),
              ),
            ),
          ),
          bottomNavigationBar: _banner == null
              ? Container()
              : Container(
            margin: const EdgeInsets.only(bottom: 12),
            height: 52,
            child: AdWidget(ad: _banner!),
          ),
        );
      },
    );
  }
}
