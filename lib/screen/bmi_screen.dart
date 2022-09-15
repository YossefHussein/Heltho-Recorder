import 'dart:math';
import 'package:flutter/material.dart';

import '../theme.dart';
import 'result_screen.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreen();
}

class _BmiScreen extends State<BmiScreen> {
  /* this value to use in slider
  And I use this in selected height of user */
  // This value to use in selected what is gender of user
  bool isMale = false;
  // Value of height
  var heightValue = 150;
  // Value of weight
  int weightValue = 70;
  // Value of age
  int ageValue = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pColor,
      appBar: AppBar(
        title: const Text('BMI'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            /// Selected gender of user male or female
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(pPadding),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() {
                          isMale = true;
                        }),
                        child: Container(
                          decoration: BoxDecoration(
                            color: isMale ? gColor : sColor,
                            borderRadius: BorderRadius.circular(pBorderSize),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Icon(
                                Icons.female,
                                size: pIconSize,
                                color: pColorIcon,
                              ),
                              const SizedBox(height: pBoxSize),
                              const Text(
                                'Woman',
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
                        onTap: () => setState(() {
                          isMale = false;
                        }),
                        child: Container(
                          decoration: BoxDecoration(
                            color: !isMale ? gColor : sColor,
                            borderRadius: BorderRadius.circular(pBorderSize),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Icon(
                                Icons.male,
                                size: pIconSize,
                                color: pColorIcon,
                              ),
                              const SizedBox(height: pBoxSize),
                              const Text(
                                'Man',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// Selected height of user
            Expanded(
              child: Padding(
                // note here I not use (EdgeInsets.all) because when use
                // (EdgeInsets.all) will adding padding of Selected gender part
                // to select Selected your height part
                // when do this padding will be 40 not 20
                padding: const EdgeInsets.symmetric(horizontal: pPadding),
                child: Container(
                  decoration: BoxDecoration(
                    color: sColor,
                    borderRadius: BorderRadius.circular(pBorderSize),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Height',
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
                            ),
                          ),
                          const Text('cm'),
                        ],
                      ),
                      Slider(
                        max: 300,
                        min: 30,
                        activeColor: gColor,
                        inactiveColor: gSliderInactiveColor,
                        label: heightValue.round().toString(),
                        value: heightValue.toDouble(),
                        onChanged: (double value) {
                          setState(() {
                            heightValue = value.toInt();
                          });
                        },
                      ),
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
                    /// Selected age of user
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: sColor,
                          borderRadius: BorderRadius.circular(pBorderSize),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Age',
                              style: TextStyle(fontSize: pMediumFontSize),
                            ),
                            Text(
                              '$ageValue',
                              style: const TextStyle(fontSize: pLargeFontSize),
                            ),
                            const SizedBox(height: pBoxSize),
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
                                  backgroundColor: gColor,
                                  child: const Icon(Icons.remove),
                                ),
                                const SizedBox(width: pBoxSize),
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      ageValue++;
                                    });
                                  },
                                  heroTag: 'ageValue++',
                                  mini: true,
                                  backgroundColor: gColor,
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

                    /// Selected weight of user
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: sColor,
                          borderRadius: BorderRadius.circular(pBorderSize),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Weight',
                              style: TextStyle(fontSize: pMediumFontSize),
                            ),
                            Text(
                              '$weightValue',
                              style: const TextStyle(fontSize: pLargeFontSize),
                            ),
                            const SizedBox(height: pBoxSize),
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
                                  backgroundColor: gColor,
                                  child: const Icon(Icons.remove),
                                ),
                                const SizedBox(width: pBoxSize),
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      weightValue++;
                                    });
                                  },
                                  heroTag: 'weightValue++',
                                  mini: true,
                                  backgroundColor: gColor,
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

            /// To give my BMI
            Container(
              width: double.infinity,
              height: 50,
              child: MaterialButton(
                color: Colors.red,
                child: const Center(
                  child: Text(
                    'Calculate',
                    style: TextStyle(color: pColorText),
                  ),
                ),
                onPressed: () {
                  double result = weightValue / pow(heightValue / 100, 2);
                  // Go to next screen (ResultScreen)
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      // Passing this data (ResultScreen)
                      builder: (context) => ResultScreen(
                        age: ageValue,
                        height: heightValue,
                        gender: isMale,
                        weight: weightValue,
                        result: result,
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
