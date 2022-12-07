import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../shared/theme/theme.dart';
import '../../shared/widget/appbar/appBar.dart';
import '../../translations/locale_keys.dart';
import '../result_module/result_module.dart';

class BmiModule extends StatefulWidget {
  const BmiModule({Key? key}) : super(key: key);

  @override
  State<BmiModule> createState() => _BmiModuleState();
}

class _BmiModuleState extends State<BmiModule> {
  // this value to use in selected what is gender of user
  bool isMale = false;

  // value of height
  int heightValue = 175;

  // value of weight
  int weightValue = 70;

  // value of age
  int ageValue = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        title: 'BMI',
        isLeading: false,
      ),
      body: SafeArea(
        child: Column(
          children: [
            /// selected gender of user male or female
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(pPadding),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isMale = false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: isMale == false ? sColor : pColorButton,
                            borderRadius: BorderRadius.circular(pBorderSize),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.female,
                                size: pIconSize,
                              ),
                              const SizedBox(height: pSizeBox),
                              Text(LocaleKeys.woman.tr()),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: pPadding,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isMale = true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: isMale == true ? pColor : pColorButton,
                            borderRadius: BorderRadius.circular(pBorderSize),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.female,
                                size: pIconSize,
                              ),
                              const SizedBox(height: pSizeBox),
                              Text(LocaleKeys.man.tr()),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // selected height of user
            Expanded(
              child: Padding(
                // note here I not use (EdgeInsets.all) because when use
                // (EdgeInsets.all) will adding padding of Selected gender part
                // to select Selected your height part
                // when do this padding will be 40 not 20
                padding: const EdgeInsets.symmetric(
                  horizontal: pPadding,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: sColor,
                    borderRadius: BorderRadius.circular(pBorderSize),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FittedBox(
                        child: Text(
                          LocaleKeys.height.tr(),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            '$heightValue',
                            style: const TextStyle(
                              fontSize: pBorderSize,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const Text('cm'),
                        ],
                      ),
                      Slider(
                        value: heightValue.toDouble(),
                        max: 350,
                        inactiveColor: pColor,
                        activeColor: pColorSliderInactive,
                        label: heightValue.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            heightValue = value.toInt();
                          });
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: pPadding,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: pPadding),
                child: Row(
                  children: [
                    /// selected age of user
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: sColor,
                          borderRadius: BorderRadius.circular(pBorderSize),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              LocaleKeys.age.tr(),
                              style: const TextStyle(fontSize: pMediumFontSize),
                            ),
                            Text(
                              '$ageValue',
                              style: const TextStyle(fontSize: pLargeFontSize),
                            ),
                            const SizedBox(height: pSizeBox),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      ageValue--;
                                    });
                                  },
                                  heroTag: 'ageValue--',
                                  mini: true,
                                  backgroundColor: pColor,
                                  child: const Icon(Icons.remove),
                                ),
                                const SizedBox(width: pSizeBox),
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      ageValue++;
                                    });
                                  },
                                  heroTag: 'ageValue++',
                                  mini: true,
                                  backgroundColor: pColor,
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
                          borderRadius: BorderRadius.circular(pBorderSize),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FittedBox(
                              child: Text(
                                LocaleKeys.weight.tr(),
                                style:
                                    const TextStyle(fontSize: pMediumFontSize),
                              ),
                            ),
                            Text(
                              '$weightValue',
                              style: const TextStyle(fontSize: pLargeFontSize),
                            ),
                            const SizedBox(height: pSizeBox),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      weightValue--;
                                    });
                                  },
                                  heroTag: 'weightValue--',
                                  mini: true,
                                  backgroundColor: pColor,
                                  child: const Icon(Icons.remove),
                                ),
                                const SizedBox(width: pSizeBox),
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      weightValue++;
                                    });
                                  },
                                  heroTag: 'weightValue++',
                                  mini: true,
                                  backgroundColor: pColor,
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
            const SizedBox(
              height: pSizeBox,
            ),
            // to give my BMI
            Container(
              width: double.infinity,
              height: 50,
              color: pColorResultButton,
              child: TextButton(
                child: Center(
                  child: Text(
                    LocaleKeys.calculate.tr(),
                    style: TextStyle(
                      color: pColorText,
                    ),
                  ),
                ),
                onPressed: () {
                  double result = weightValue / pow(heightValue / 100, 2);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ResultModule(
                        heightValue: heightValue,
                        weightValue: weightValue,
                        yourGender: isMale,
                        ageValue: ageValue,
                        result: result,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
