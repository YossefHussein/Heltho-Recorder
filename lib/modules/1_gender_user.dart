import 'package:bmi_test/controller/cubit.dart';
import 'package:bmi_test/controller/states.dart';
import 'package:bmi_test/modules/confetti_screen.dart';
import 'package:bmi_test/shared/routes/main_routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../shared/theme/theme.dart';
import '../shared/translations/locale_keys.dart';
import '../shared/ads/ads_helper.dart';

class GenderUser extends StatefulWidget {
  const GenderUser({super.key});

  @override
  State<GenderUser> createState() => _GenderUserState();
}

class _GenderUserState extends State<GenderUser> with TickerProviderStateMixin {
  // this to controller on animation
  late AnimationController _controllerFemale;
  late AnimationController _controllerMale;

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
    _controllerFemale = AnimationController(vsync: this);
    _controllerMale = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controllerFemale.dispose();
    _controllerMale.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BmiMainCubit, BmiStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: true,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Spacer(),
                      BmiMainCubit.get(context).isMale == null
                          ? Lottie.asset('assets/animations/pushups.json')
                          // see female icon if user is female
                          : BmiMainCubit.get(context).isMale == false
                              ? Lottie.asset(
                                  'assets/animations/avatar_female.json',
                                  controller: _controllerFemale,
                                  onLoaded: (composition) {
                                    //  Configure the AnimationController with the duration of the
                                    // Lottie file and start the animation.
                                    _controllerFemale
                                      ..duration = composition.duration
                                      ..forward();
                                  },
                                )
                              //  see man icon is the
                              : Lottie.asset(
                                  'assets/animations/avatar_man.json',
                                  controller: _controllerMale,
                                  onLoaded: (composition) {
                                    //  Configure the AnimationController with the duration of the
                                    // Lottie file and start the animation.
                                    _controllerMale
                                      ..duration = composition.duration
                                      ..forward();
                                  },
                                ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${LocaleKeys.whatIsYourGender.tr()} \n (${BmiMainCubit.get(context).isMale == null ? "${LocaleKeys.msgToUser.tr()}" : "${BmiMainCubit.get(context).isMale == false ? "${LocaleKeys.woman.tr()}" : " ${LocaleKeys.man.tr()}"}"})',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),

                      /// selected gender of user male or female
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  BmiMainCubit.get(context)
                                      .selectedUserGender(false);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: BmiMainCubit.get(context).isMale ==
                                            false
                                        ? pColorSelectedFemale
                                        : sColor,
                                    borderRadius:
                                        BorderRadius.circular(pBorderSize),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const FaIcon(
                                          FontAwesomeIcons.female,
                                          size: pIconSize,
                                        ),
                                        const SizedBox(height: pSizeBox),
                                        Text(
                                          LocaleKeys.woman.tr().toUpperCase(),
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: pPadding,
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () async {
                                  BmiMainCubit.get(context)
                                      .selectedUserGender(true);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:
                                        BmiMainCubit.get(context).isMale == true
                                            ? pColorSelectedMale
                                            : sColor,
                                    borderRadius:
                                        BorderRadius.circular(pBorderSize),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const FaIcon(
                                          FontAwesomeIcons.person,
                                          size: pIconSize,
                                        ),
                                        const SizedBox(height: pSizeBox),
                                        Text(
                                          LocaleKeys.man.tr().toUpperCase(),
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      // to give my (BMI)
                      Container(
                        width: double.infinity,
                        height: 50,
                        color: pColorResultButton,
                        child: TextButton(
                          child: Center(
                            child: Text(
                              "${LocaleKeys.whatAfterThat.tr().toUpperCase()}",
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          onPressed: () {
                            if (context.read<BmiMainCubit>().isMale == true) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ConfettiScreen(
                                    // this line to move to difference screen when call this screen
                                    targetScreen: heightScreenRoute,
                                  ),
                                ),
                              );
                            } else if (context.read<BmiMainCubit>().isMale ==
                                false) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ConfettiScreen(
                                    // this line to move to difference screen when call this screen
                                    targetScreen: heightScreenRoute,
                                  ),
                                ),
                              );
                            } else if (context.read<BmiMainCubit>().isMale ==
                                null) {
                              Fluttertoast.showToast(
                                msg: "Selected gender",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 3,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          bottomNavigationBar: _banner == null
              ? Container()
              : Container(
            height: 52,
            child: AdWidget(ad: _banner!),
          ),
        );
      },
    );
  }
}
