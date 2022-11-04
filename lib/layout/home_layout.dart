import 'package:bmi_test/bloc/states.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cubit/cubit.dart';
import '../shared/theme/theme.dart';
import '../shared/widget/appbar_method/appBar.dart';
import '../translations/locale_keys.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => BmiCubit(),
      child: BlocConsumer<BmiCubit, BmiStates>(
        listener: (context, state) {
          if (state is BmiSliderState) print('not work');
        },
        builder: (context, state) => Scaffold(
          appBar: appBarMethod(),
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
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(pBorderSize),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.female,
                                    size: pIconSize,
                                    color: BmiCubit.get(context).pColorIcon,
                                  ),
                                  const SizedBox(height: pBoxSize),
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
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                // color: isMale == false
                                //     ?
                                //     : sColor,
                                borderRadius: BorderRadius.circular(
                                  pBorderSize,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.male,
                                    size: pIconSize,
                                    color: Colors.red,
                                  ),
                                  const SizedBox(height: pBoxSize),
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

                /// selected height of user
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
                        borderRadius: BorderRadius.circular(pBorderSize),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            LocaleKeys.height.tr(),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                '${BmiCubit.get(context).heightValue}',
                                style: const TextStyle(
                                  fontSize: pLargeFontSize,
                                ),
                              ),
                              const Text('cm'),
                            ],
                          ),
                          Slider(
                            max: 250,
                            min: 30,
                            activeColor: pColor,
                            inactiveColor:
                                gSliderInactiveColor,
                            label: BmiCubit.get(context)
                                .heightValue
                                .round()
                                .toString(),
                            value: BmiCubit.get(context).heightValue.toDouble(),
                            onChanged: (value){},
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
                                  style: const TextStyle(
                                      fontSize: pMediumFontSize),
                                ),
                                Text(
                                  '${BmiCubit.get(context).ageValue}',
                                  style:
                                      const TextStyle(fontSize: pLargeFontSize),
                                ),
                                const SizedBox(height: pBoxSize),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FloatingActionButton(
                                      onPressed: () {
                                        BmiCubit.get(context)
                                            .changeAgeValue(true);
                                      },
                                      heroTag: 'ageValue--',
                                      mini: true,
                                      backgroundColor: pColor,
                                      child: const Icon(Icons.remove),
                                    ),
                                    const SizedBox(width: pBoxSize),
                                    FloatingActionButton(
                                      onPressed: () {
                                        BmiCubit.get(context)
                                            .changeAgeValue(false);
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
                        /// selected weight of user
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: pColor,
                              borderRadius: BorderRadius.circular(pBorderSize),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FittedBox(
                                  child: Text(
                                    LocaleKeys.weight.tr(),
                                    style: const TextStyle(
                                        fontSize: pMediumFontSize),
                                  ),
                                ),
                                Text(
                                  '${BmiCubit.get(context).weightValue}',
                                  style:
                                      const TextStyle(fontSize: pLargeFontSize),
                                ),
                                const SizedBox(height: pBoxSize),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FloatingActionButton(
                                      onPressed: () {
                                        BmiCubit.get(context)
                                            .changeWeightValue(false);
                                      },
                                      heroTag: 'weightValue--',
                                      mini: true,
                                      backgroundColor: pColor,
                                      child: const Icon(Icons.remove),
                                    ),
                                    const SizedBox(width: pBoxSize),
                                    FloatingActionButton(
                                      onPressed: () {
                                        BmiCubit.get(context)
                                            .changeWeightValue(true);
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
                  height: pPadding,
                ),
                // to give my BMI
                // Container(
                //   width: double.infinity,
                //   height: 50,
                //   child: MaterialButton(
                //     color: gColorButton,
                //     child: Center(
                //       child: Text(
                //         LocaleKeys.calculate.tr(),
                //         style: TextStyle(color: Text),
                //       ),
                //     ),
                //     onPressed: () {
                //       double result = weightValue / pow(heightValue / 100, 2);
                //       // go to next screen (ResultScreen)
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //           // passing this data (ResultScreen)
                //           builder: (context) => ResultScreen(
                //             age: ageValue,
                //             height: heightValue,
                //             gender: isMale,
                //             weight: weightValue,
                //             result: result,
                //           ),
                //         ),
                //       );
                //     },
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
