import 'package:bmi_test/controller/cubit.dart';
import 'package:bmi_test/controller/states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../shared/ads/ads_helper.dart';
import '../shared/theme/theme.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  // for make banner
  BannerAd? _banner;

  // this method to adding setting
  void _createBannerAd() {
    _banner = BannerAd(
      size: AdSize.fullBanner,
      adUnitId: AdHelper.bannerAdUnitId!,
      listener: AdHelper.bannerListener,
      request: const AdRequest(),
    )
      ..load();
  }

  @override
  void initState() {
    super.initState();
    _createBannerAd();
  }

  @override
  Widget build(BuildContext context) {
    // get and set data by these methods
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            body: context
                .read<AppCubit>()
                .screenApp[context
                .read<AppCubit>()
                .currentScreen],
            bottomNavigationBar: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ConditionalBuilder(
                  condition: _banner == null,
                  builder: (context) => Container(),
                  fallback: (context) =>
                      Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        height: 52,
                        child: AdWidget(ad: _banner!),
                      ),
                ),
                // BottomNavigationBar(
                //   backgroundColor: Colors.white,
                //   elevation: 1,
                //   selectedItemColor: sColor,
                //   unselectedItemColor: Colors.black,
                //   items: context.read<AppCubit>().bottomItem,
                //   onTap: (int indexScreen) {
                //     context
                //         .read<AppCubit>()
                //         .changeBottomNavBarScreen(indexScreen);
                //   },
                //   currentIndex: context.read<AppCubit>().currentScreen,
                // ),
                GNav(
                  style: GnavStyle.google,
                  activeColor: sColor,
                  haptic: true,
                  tabBorderRadius: 15,
                  tabActiveBorder: Border.all(color: Colors.black, width: 1),
                  selectedIndex: context
                      .read<AppCubit>()
                      .currentScreen,
                  tabs: context
                      .read<AppCubit>()
                      .bottomItem,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  onTabChange: (screenIndex) {
                    context
                        .read<AppCubit>()
                        .changeBottomNavBarScreen(screenIndex);
                  },
                )
              ],
            ),
        );
      },
    );
  }
}
