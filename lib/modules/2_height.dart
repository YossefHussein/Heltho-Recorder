import 'package:bmi_test/controller/cubit.dart';
import 'package:bmi_test/controller/states.dart';
import 'package:bmi_test/modules/3_age_and_weight.dart';
import 'package:bmi_test/modules/confetti_screen.dart';
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
                const Spacer(),
                Expanded(
                  child: Padding(
                    // note here I not use (EdgeInsets.all) because when use
                    // (EdgeInsets.all) will adding padding of Selected gender part
                    // to select Selected your height part
                    // when do this padding will be 40 not 20
                    padding: const EdgeInsets.symmetric(
                      horizontal: pPadding / 2,
                      vertical: pPadding / 3,
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
                                '${BmiMainCubit.get(context).heightValue}',
                                style: const TextStyle(
                                  fontSize: pLargeFontSize,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              const Text('cm'),
                            ],
                          ),
                          Slider(
                            value: BmiMainCubit.get(context)
                                .heightValue
                                .toDouble(),
                            max: 215,
                            min: 130,
                            inactiveColor: pColor,
                            activeColor: pColor,
                            label: BmiMainCubit.get(context)
                                .heightValue
                                .round()
                                .toString(),
                            onChanged: (double value) {
                              BmiMainCubit.get(context).changeSilder(value);
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                // to give my (BMI)
                Container(
                  width: double.infinity,
                  height: 50,
                  color: pColorResultButton,
                  child: TextButton(
                    child: Center(
                      child: Text(
                        LocaleKeys.calculate.tr().toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ConfettiScreen(
                            targetScreen: const AgeAndWeightScreen(),
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
