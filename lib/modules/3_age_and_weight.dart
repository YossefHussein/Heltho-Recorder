import 'package:bmi_test/controller/cubit.dart';
import 'package:bmi_test/controller/states.dart';
import 'package:bmi_test/modules/confetti_screen.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../shared/ads/ads_helper.dart';
import '../shared/network/local/cache_helper.dart';
import '../shared/routes/main_routes.dart';
import '../shared/theme/theme.dart';
import '../shared/translations/locale_keys.dart';

class AgeAndWeightScreen extends StatefulWidget {
  const AgeAndWeightScreen({super.key});

  @override
  State<AgeAndWeightScreen> createState() => _AgeAndWeightScreenState();
}

class _AgeAndWeightScreenState extends State<AgeAndWeightScreen> {
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
    _createBannerAd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      const Spacer(),
                      Expanded(
                        child: Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: pPadding),
                          child: Row(
                            children: [
                              /// selected age of user
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: sColor,
                                    borderRadius:
                                        BorderRadius.circular(pBorderSize),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        LocaleKeys.age.tr().toUpperCase(),
                                        style: TextStyle(
                                          color: pColor,
                                          fontSize: pMediumFontSize,
                                        ),
                                      ),
                                      Text(
                                        '${context.read<AppCubit>().ageValue}',
                                        style: TextStyle(
                                          color: pColor,
                                          fontSize: pLargeFontSize,
                                        ),
                                      ),
                                      const SizedBox(height: pSizeBox),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          FloatingActionButton(
                                            onPressed: () {
                                              context
                                                  .read<AppCubit>()
                                                  .lessToAge();
                                            },
                                            heroTag: 'ageValue less',
                                            mini: true,
                                            backgroundColor: sColor,
                                            child: const Icon(Icons.remove),
                                          ),
                                          const SizedBox(width: pSizeBox),
                                          FloatingActionButton(
                                            onPressed: () {
                                              context
                                                  .read<AppCubit>()
                                                  .addingToAge();
                                              // setState(() {
                                              //   ageValue++;
                                              // });
                                            },
                                            heroTag: 'ageValue add',
                                            mini: true,
                                            backgroundColor: sColor,
                                            child: const Icon(Icons.add),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: pPadding,
                              ),
                              // selected weight of user
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: sColor,
                                    borderRadius:
                                        BorderRadius.circular(pBorderSize),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FittedBox(
                                        child: Text(
                                          LocaleKeys.weight.tr().toUpperCase(),
                                          style: TextStyle(
                                            color: pColor,
                                            fontSize: pMediumFontSize,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        '${context.read<AppCubit>().weightValue}',
                                        style: TextStyle(
                                          color: pColor,
                                          fontSize: pLargeFontSize,
                                        ),
                                      ),
                                      const SizedBox(height: pSizeBox),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          FloatingActionButton(
                                            onPressed: () {
                                              context
                                                  .read<AppCubit>()
                                                  .lessToWeight();
                                            },
                                            heroTag: 'weightValue less',
                                            mini: true,
                                            backgroundColor: sColor,
                                            child: const Icon(Icons.remove),
                                          ),
                                          const SizedBox(width: pSizeBox),
                                          FloatingActionButton(
                                            onPressed: () {
                                              context
                                                  .read<AppCubit>()
                                                  .addingToWeight();
                                            },
                                            heroTag: 'weightValue add',
                                            mini: true,
                                            backgroundColor: sColor,
                                            child: const Icon(Icons.add),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                )
              ],
            ),
          ),
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ConditionalBuilder(
                condition: _banner == null,
                builder: (context) => Container(),
                fallback: (context) => Container(
                  // margin: const EdgeInsets.only(bottom: 12),
                  height: 52,
                  child: AdWidget(ad: _banner!),
                ),
              ),
              Container(
                width: double.infinity,
                height: 50,
                color: pColorResultButton,
                child: TextButton(
                  child: Center(
                    child: Text(
                      LocaleKeys.whatAfterThat.tr().toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  onPressed: () {
                    CacheHelper.saveData(key: 'isUserCompleteTest', value: true)
                        .then(
                      (value) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ConfettiScreen(
                              // this line to move to difference screen when call this screen
                              targetScreen: homeLayoutScreenRoute,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
