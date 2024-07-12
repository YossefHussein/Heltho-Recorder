import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controller/cubit.dart';
import '../controller/states.dart';
import '../shared/components/widgets.dart';
import '../shared/network/local/cache_helper.dart';
import '../shared/routes/main_routes.dart';
import '../shared/theme/theme.dart';
import '../shared/translations/locale_keys.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({
    super.key,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
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
            leading: IconButton(
              tooltip: "repeat the Test",
              icon: const FaIcon(CupertinoIcons.repeat),
              onPressed: () async {
                Navigator.pushReplacementNamed(
                  context,
                  heightScreenRoute,
                );
              },
            ),
            actions: [
              IconButton(
                onPressed: () {
                  // remove data
                  CacheHelper.removeData(key: 'isUserCompleteTest').then((value) {
                    Navigator.pushReplacementNamed(
                      context,
                      genderUserScreenRoute,
                    );
                  });
                },
                icon: const Icon(CupertinoIcons.delete),
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
                      // data of user
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
                      pSizeBoxWidth15(),
                      // image BMI
                      GestureDetector(
                        onTap: () async {
                          final Uri url = Uri.parse(
                            'https://ourworldindata.org/obesity#',
                          );
                          if (!await launchUrl(url,
                              mode: LaunchMode.externalApplication)) {
                            throw Exception('Could not launch $url');
                          }
                        },
                        child: Image.asset(
                          'assets/images/Body_Mass_Index.jpg',
                        ),
                      ),
                      // go to website of bmi test
                      pSizeBoxWidth15(),
                      GestureDetector(
                        onTap: () async {
                          final Uri url = Uri.parse(
                            'https://ourworldindata.org/obesity#',
                          );
                          if (!await launchUrl(url,
                              mode: LaunchMode.externalApplication)) {
                            throw Exception('Could not launch $url');
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
        );
      },
    );
  }
}
