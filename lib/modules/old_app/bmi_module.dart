

// !! this is screed is was chagned to be new screen
















import 'dart:math';
import 'package:bmi_test/controller/cubit.dart';
import 'package:bmi_test/controller/states.dart';
import 'package:bmi_test/modules/old_app/result_module.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/theme/theme.dart';
import '../../shared/translations/locale_keys.dart';

class BmiModule extends StatefulWidget {
  const BmiModule({super.key});

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
    return BlocConsumer<BmiMainCubit, BmiStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
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
                                color: isMale == false ? pColorButton : sColor,
                                borderRadius:
                                    BorderRadius.circular(pBorderSize),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.female,
                                    size: pIconSize,
                                  ),
                                  const SizedBox(height: pSizeBox),
                                  Text(LocaleKeys.woman.tr().toUpperCase()),
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
                                color: isMale == true ? pColorButton : sColor,
                                borderRadius:
                                    BorderRadius.circular(pBorderSize),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.male,
                                    size: pIconSize,
                                  ),
                                  const SizedBox(height: pSizeBox),
                                  Text(LocaleKeys.man.tr().toUpperCase()),
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
                          Text(
                            LocaleKeys.height.tr().toUpperCase(),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                '$heightValue',
                                style: const TextStyle(
                                  fontSize: pLargeFontSize,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              const Text('cm'),
                            ],
                          ),
                          Slider(
                            value: heightValue.toDouble(),
                            max: 215,
                            min: 130,
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
                                  LocaleKeys.age.tr().toUpperCase(),
                                  style: const TextStyle(
                                      fontSize: pMediumFontSize),
                                ),
                                Text(
                                  '$ageValue',
                                  style:
                                      const TextStyle(fontSize: pLargeFontSize),
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
                                      heroTag: 'ageValue less',
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
                                      heroTag: 'ageValue add',
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
                                    LocaleKeys.weight.tr().toUpperCase(),
                                    style: const TextStyle(
                                        fontSize: pMediumFontSize),
                                  ),
                                ),
                                Text(
                                  '$weightValue',
                                  style:
                                      const TextStyle(fontSize: pLargeFontSize),
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
                                      heroTag: 'weightValue less',
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
                                      heroTag: 'weightValue add',
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
                // to give my (BMI)
                Container(
                  width: double.infinity,
                  height: 50,
                  color: pColorResultButton,
                  child: TextButton(
                    child: Center(
                      child: Text(
                        LocaleKeys.calculate.tr().toUpperCase(),
                        style: TextStyle(
                          color: pColorText,
                        ),
                      ),
                    ),
                    onPressed: () {
                      double result = weightValue / pow(heightValue / 100, 2);
                      // go to next screen (ResultModule)
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          //  passing this data (ResultModule)
                          builder: (context) => ResultModule(
                            ageValue: ageValue,
                            heightValue: heightValue,
                            yourGender: isMale,
                            weightValue: weightValue,
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
      },
    );
  }
}
