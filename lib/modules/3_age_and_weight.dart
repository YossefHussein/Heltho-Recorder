import 'package:bmi_test/controller/cubit.dart';
import 'package:bmi_test/controller/states.dart';
import 'package:bmi_test/modules/confetti_screen.dart';
import 'package:bmi_test/shared/routes/main_routes.dart';
import 'package:bmi_test/shared/theme/theme.dart';
import 'package:bmi_test/shared/translations/locale_keys.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AgeAndWeightScreen extends StatelessWidget {
  const AgeAndWeightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BmiMainCubit, BmiStates>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Column(
              children: [
                const Spacer(),
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
                                  style: TextStyle(
                                    color: pColor,
                                    fontSize: pMediumFontSize,
                                  ),
                                ),
                                Text(
                                  '${context.read<BmiMainCubit>().ageValue}',
                                  style: TextStyle(
                                    color: pColor,
                                    fontSize: pLargeFontSize,
                                  ),
                                ),
                                const SizedBox(height: pSizeBox),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FloatingActionButton(
                                      onPressed: () {
                                        context
                                            .read<BmiMainCubit>()
                                            .lessToAge();
                                      },
                                      heroTag: 'ageValue less',
                                      mini: true,
                                      backgroundColor: sColor,
                                      child: const Icon(Icons.remove),
                                    ),
                                    const SizedBox(width: pSizeBox),
                                    FloatingActionButton(
                                      onPressed: () {
                                        context
                                            .read<BmiMainCubit>()
                                            .addingToAge();
                                        // setState(() {
                                        //   ageValue++;
                                        // });
                                      },
                                      heroTag: 'ageValue add',
                                      mini: true,
                                      backgroundColor: sColor,
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
                                    style: TextStyle(
                                      color: pColor,
                                      fontSize: pMediumFontSize,
                                    ),
                                  ),
                                ),
                                Text(
                                  '${context.read<BmiMainCubit>().weightValue}',
                                  style: TextStyle(
                                    color: pColor,
                                    fontSize: pLargeFontSize,
                                  ),
                                ),
                                const SizedBox(height: pSizeBox),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FloatingActionButton(
                                      onPressed: () {
                                        context
                                            .read<BmiMainCubit>()
                                            .lessToWeight();
                                      },
                                      heroTag: 'weightValue less',
                                      mini: true,
                                      backgroundColor: sColor,
                                      child: const Icon(Icons.remove),
                                    ),
                                    const SizedBox(width: pSizeBox),
                                    FloatingActionButton(
                                      onPressed: () {
                                        context
                                            .read<BmiMainCubit>()
                                            .addingToWeight();
                                      },
                                      heroTag: 'weightValue add',
                                      mini: true,
                                      backgroundColor: sColor,
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
                const Spacer(),
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
                      // context.read<BmiMainCubit>().changeLocalAuth();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ConfettiScreen(
                            targetScreen: resultScreenRoute,
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
