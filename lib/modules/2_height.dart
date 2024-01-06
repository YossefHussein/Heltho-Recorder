import 'package:bmi_test/controller/cubit.dart';
import 'package:bmi_test/controller/states.dart';
import 'package:bmi_test/shared/theme/theme.dart';
import 'package:bmi_test/shared/translations/locale_keys.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeightScreen extends StatefulWidget {
  const HeightScreen({super.key});

  @override
  State<HeightScreen> createState() => _HeightScreenState();
}

class _HeightScreenState extends State<HeightScreen> {

  // value of height
  int heightValue = 175;

  // value of weight
  int weightValue = 70;



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BmiMainCubit, BmiStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'what is you gender (${BmiMainCubit.get(context).isMale == null ? "I dont know" : "${BmiMainCubit.get(context).isMale == false ? "female" : "male"}"})',
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),

                /// selected gender of user male or female
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            // setState(() {
                            //   isMale = false;
                            // });
                            // // playAudio();
                            BmiMainCubit.get(context).selctedUserGender(false);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: BmiMainCubit.get(context).isMale == false
                                  ? pColorSelectedFemale
                                  : sColor,
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
                                Text(
                                  LocaleKeys.woman.tr().toUpperCase(),
                                  style: const TextStyle(color: Colors.white),
                                ),
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
                          onTap: () async {
                            // setState(() {
                            //   isMale = false;
                            // });
                            // // playAudio();
                            BmiMainCubit.get(context).selctedUserGender(true);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: BmiMainCubit.get(context).isMale == true
                                  ? pColorSelectedMale
                                  : sColor,
                              borderRadius: BorderRadius.circular(pBorderSize),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.male,
                                  size: pIconSize,
                                ),
                                const SizedBox(height: pSizeBox),
                                Text(
                                  LocaleKeys.man.tr().toUpperCase(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
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
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onPressed: () {},
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


/**
 * Expanded(
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
 */