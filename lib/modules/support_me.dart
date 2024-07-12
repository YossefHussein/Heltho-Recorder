import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:icons_plus/icons_plus.dart';

import 'package:url_launcher/url_launcher.dart';

import '../controller/cubit.dart';
import '../controller/states.dart';
import '../shared/components/widgets.dart';

class SupportMeScreen extends StatelessWidget {
  const SupportMeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BmiMainCubit, BmiStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  'This is not should to do If You want support me \n You can do it from these app',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              pSizeBoxHeight20(),
              /**
               * bay me a coffee section
               **/
              GestureDetector(
                onTap: () =>
                    _openWebsite('https://buymeacoffee.com/victorsteelman'),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Image.asset(
                      'assets/images/bmc_logo_no_background.png',
                      height: 35,
                    ),
                    pSizeBoxWidth10(),
                    const Text(
                        'Support me with BuyMeACoffee \n User name: @victorsteelman')
                  ],
                ),
              ),
              pSizeBoxHeight20(),
              /**
               * twitter section
               */
              GestureDetector(
                onTap: () => _openWebsite('https://x.com/VictorSteelman'),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Brand(Brands.twitterx),
                    pSizeBoxWidth10(),
                    const Text(
                        'My Twitter account \n User name: @VictorSteelman')
                  ],
                ),
              ),
              pSizeBoxHeight20(),
              GestureDetector(
                onTap: () => _openWebsite('https://www.youtube.com/@VictorSteelman'),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Brand(Brands.youtube),
                    pSizeBoxWidth10(),
                    const Text(
                        'My projects on YouTube \n User name: @VictorSteelman')
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  _openWebsite(websiteUrlOpen) async {
    final Uri url = Uri.parse(websiteUrlOpen);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
