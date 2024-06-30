import 'package:bmi_test/controller/cubit.dart';
import 'package:bmi_test/controller/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:icons_plus/icons_plus.dart';

import 'package:url_launcher/url_launcher.dart';

import '../shared/components/widgets.dart';

class SupportMeScreen extends StatelessWidget {
  SupportMeScreen({Key? key}) : super(key: key);

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
              Center(
                child: const Text(
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
               * support in paypal section
               **/
              GestureDetector(
                onTap: () => openWebsite(
                    'https://www.paypal.com/paypalme/my/settings/?flow=cmV0dXJuVXJsPS9teWFjY291bnQvcHJvZmlsZSZjYW5jZWxVcmw9L215YWNjb3VudC9wcm9maWxl'),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Brand(Brands.paypal),
                    pSizeBoxWidth10(),
                    const Text(
                        'Support me with paypal \n User name: yousefhussein222')
                  ],
                ),
              ),
              pSizeBoxHeight20(),
              /**
               * bay me a coffee section
               **/
              GestureDetector(
                onTap: () =>
                    openWebsite('https://buymeacoffee.com/victorsteelman'),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/bmc_logo_no_background.png',
                      height: 35,
                    ),
                    pSizeBoxWidth10(),
                    const Text(
                        'Support me with buyMeACoffe \n User name: victorsteelman')
                  ],
                ),
              ),
              pSizeBoxHeight20(),
              /**
               * twitter section
               */
              GestureDetector(
                onTap: () => openWebsite('https://x.com/VictorSteelman'),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const FaIcon(
                      FontAwesomeIcons.xTwitter,
                      color: Colors.black,
                    ),
                    pSizeBoxWidth10(),
                    const Text(
                        'My twitter account \n User name: VictorSteelman')
                  ],
                ),
              ),
              pSizeBoxHeight20(),
              GestureDetector(
                onTap: () => openWebsite('https://github.com/YossefHussein'),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const FaIcon(FontAwesomeIcons.github, color: Colors.black),
                    pSizeBoxWidth10(),
                    const Text(
                        'My projects on github \n User name: YossefHussein')
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  openWebsite(websiteUrlOpen) async {
    final Uri url = Uri.parse(websiteUrlOpen);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
