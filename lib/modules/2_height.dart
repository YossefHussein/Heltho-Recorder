import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../controller/cubit.dart';
import '../controller/states.dart';
import '../shared/ads/ads_helper.dart';
import '../shared/routes/main_routes.dart';
import '../shared/theme/theme.dart';
import '../shared/translations/locale_keys.dart';
import 'confetti_screen.dart';

class HeightScreen extends StatefulWidget {
  const HeightScreen({super.key});

  @override
  State<HeightScreen> createState() => _HeightScreenState();
}

class _HeightScreenState extends State<HeightScreen> {
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
    return BlocConsumer<BmiMainCubit, BmiStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverFillRemaining(
                hasScrollBody: true,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Spacer(),
                      Expanded(
                        child: Padding(
                          // note here I not use (EdgeInsets.all) because when use
                          // (EdgeInsets.all) will adding padding of Selected gender part
                          // to select Selected your height part
                          // when do this padding will be 40 not 20
                          padding: const EdgeInsets.symmetric(
                            horizontal: pPadding / 2,
                            vertical: pPadding / 3,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: sColor,
                              borderRadius: BorderRadius.circular(pBorderSize),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  LocaleKeys.height.tr().toUpperCase(),
                                  style: TextStyle(
                                    color: pColor,
                                    fontSize: pMediumFontSize,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    // the height of user
                                    Text(
                                      '${BmiMainCubit.get(context).heightValue}',
                                      style: TextStyle(
                                        color: pColor,
                                        fontSize: pLargeFontSize,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    Text(
                                      'cm',
                                      style: TextStyle(
                                        color: pColor,
                                        fontSize: pLargeFontSize,
                                        fontWeight: FontWeight.w100,
                                      ),
                                    ),
                                  ],
                                ),
                                Slider(
                                  value: BmiMainCubit.get(context)
                                      .heightValue
                                      .toDouble(),
                                  max: 220,
                                  min: 34,
                                  inactiveColor: pColor,
                                  activeColor: pColor,
                                  label: context
                                      .read<BmiMainCubit>()
                                      .heightValue
                                      .toInt()
                                      .toString(),
                                  onChanged: (double value) {
                                    BmiMainCubit.get(context)
                                        .changeSlider(value);
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ],
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
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ConfettiScreen(
                          // this line to move to difference screen when call this screen
                          targetScreen: ageAndWeightScreenRoute,
                        ),
                      ),
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
