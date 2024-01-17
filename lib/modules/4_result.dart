import 'package:bmi_test/controller/cubit.dart';
import 'package:bmi_test/controller/states.dart';
import 'package:bmi_test/shared/components/widgets.dart';
import 'package:bmi_test/shared/routes/main_routes.dart';
import 'package:bmi_test/shared/theme/theme.dart';
import 'package:bmi_test/shared/translations/locale_keys.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BmiMainCubit, BmiStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          // disable the code
          appBar: appBarWidget(
            isLeading: true,
            title: 'BMI Result',
            leadingFunction: () {
              Navigator.pushNamed(context, heightScreenRoute);
            },
            leadingIconData: Icons.arrow_back_ios_new_rounded,
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(pPadding),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          '${LocaleKeys.yourGender.tr()} : ${context.read<BmiMainCubit>().isMale == true ? LocaleKeys.man.tr() : LocaleKeys.woman.tr()}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${LocaleKeys.yourHeight.tr()} : ${context.read<BmiMainCubit>().heightValue}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${LocaleKeys.yourWeight.tr()} : ${context.read<BmiMainCubit>().weightValue}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${LocaleKeys.yourAge.tr()} : ${context.read<BmiMainCubit>().ageValue}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${LocaleKeys.bmiResult.tr()} : ${context.read<BmiMainCubit>().reusltPrint().round()}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: pSizeBox,
                    ),
                    GestureDetector(
                      onDoubleTap: () async {
                        Future<void> _launchUrl() async {
                          final Uri _url =
                              Uri.parse('https://ourworldindata.org/obesity#');
                          if (!await launchUrl(_url)) {
                            throw Exception('Could not launch $_url');
                          }
                        }
                      },
                      child: SvgPicture.asset(
                        'assets/images/BMI_en_wiki.svg',
                        // height: 200,
                        width: double.infinity,
                      ),
                    ),
                    Text("to see artical click on photo")
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
