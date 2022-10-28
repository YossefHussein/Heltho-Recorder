import 'package:bmi_test/translations/locale_keys.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../shared/theme/theme.dart';

class ResultScreen extends StatelessWidget {
  /* this value to use in slider
  And I use this in selected height of user */

  /// this value to use in selected what is gender of user
  final bool? gender;
  // height of user
  final int height;
  // weight of user
  final int weight;
  // age of user
  final int age;
  // your BMI result
  final double result;

  const ResultScreen({
    Key? key,
    this.gender,
    required this.height,
    required this.weight,
    required this.age,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            // back to (BmiScreen)
            Navigator.pop(context);
          },
        ),
        title: const Text('BMI Result'),
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
                      '${LocaleKeys.yourGender.tr()} : ${gender == false ? LocaleKeys.man.tr() : LocaleKeys.woman.tr()}',
                      style: const TextStyle(fontSize: pMediumFontSize),
                    ),
                    Text(
                      '${LocaleKeys.yourHeight.tr()} : $height',
                      style: const TextStyle(fontSize: pMediumFontSize),
                    ),
                    Text(
                      '${LocaleKeys.yourWeight.tr()} : $weight',
                      style: const TextStyle(fontSize: pMediumFontSize),
                    ),
                    Text(
                      '${LocaleKeys.yourAge.tr()} : $age',
                      style: const TextStyle(fontSize: pMediumFontSize),
                    ),
                    Text(
                      '${LocaleKeys.bmiResult.tr()} : ${result.round()}',
                      style: const TextStyle(fontSize: pMediumFontSize),
                    ),
                  ],
                ),
                const SizedBox(
                  height: pBoxSize,
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
