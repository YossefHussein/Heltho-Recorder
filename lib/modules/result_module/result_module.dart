import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../shared/theme/theme.dart';
import '../../shared/widget/appbar/appBar.dart';
import '../../translations/locale_keys.dart';

class ResultModule extends StatelessWidget {
  bool yourGender = true;
  int heightValue;
  int weightValue;
  int ageValue;
  double result;

  ResultModule({
    Key? key,
    required this.yourGender,
    required this.weightValue,
    required this.heightValue,
    required this.ageValue,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        isLeading: true,
        title: 'BMI Result',
        leadingFunction: () {
          Navigator.pop(context);
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
                  children: [
                    Text(
                      '${LocaleKeys.yourGender.tr()} : ${yourGender ? LocaleKeys.man.tr() : LocaleKeys.woman.tr()}',
                    ),
                    Text(
                      '${LocaleKeys.yourHeight.tr()} : $heightValue',
                    ),
                    Text(
                      '${LocaleKeys.yourWeight.tr()} : $weightValue',
                    ),
                    Text(
                      '${LocaleKeys.yourAge.tr()} : $ageValue',
                    ),
                    Text(
                      '${LocaleKeys.bmiResult.tr()} : ${result.round()}',
                    ),
                  ],
                ),
                const SizedBox(
                  height: pSizeBox,
                ),
                Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/6/6d/Body_Mass_Index.jpg?20210712122410')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
