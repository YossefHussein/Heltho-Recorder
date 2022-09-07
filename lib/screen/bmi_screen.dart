import 'package:flutter/material.dart';

import '../theme.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  var valueSlider = 150;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pColor,
      appBar: AppBar(
        title: const Text('BMI'),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: pColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            /// Selected your gender male or female
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(pPadding),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: sColor,
                          borderRadius: BorderRadius.circular(pBorderSize),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Icon(
                              Icons.female,
                              size: pIconSize,
                              color: Colors.white,
                            ),
                            const SizedBox(height: pBoxSize),
                            const Text(
                              'Woman',
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: pPadding,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: sColor,
                          borderRadius: BorderRadius.circular(pBorderSize),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Icon(
                              Icons.male,
                              size: pIconSize,
                              color: Colors.white,
                            ),
                            const SizedBox(height: pBoxSize),
                            const Text(
                              'Man',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// Selected your height
            Expanded(
              child: Padding(
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
                            '$valueSlider',
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
                        inactiveColor: gSliderColor,
                        label: valueSlider.round().toString(),
                        value: valueSlider.toDouble(),
                        onChanged: (double value) {
                          setState(() {
                            valueSlider = value.toInt();
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
                            const Text(
                              '188',
                              style: TextStyle(fontSize: pLargeFontSize),
                            ),
                            const SizedBox(height: pBoxSize),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  onPressed: () {},
                                  mini: true,
                                  backgroundColor: gColor,
                                  child: const Icon(Icons.remove),
                                ),
                                const SizedBox(width: pBoxSize),
                                FloatingActionButton(
                                  onPressed: () {},
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
                              'AGE',
                              style: TextStyle(fontSize: pMediumFontSize),
                            ),
                            const Text(
                              '188',
                              style: TextStyle(fontSize: pLargeFontSize),
                            ),
                            const SizedBox(height: pBoxSize),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  onPressed: () {},
                                  mini: true,
                                  backgroundColor: gColor,
                                  child: const Icon(Icons.remove),
                                ),
                                const SizedBox(width: pBoxSize),
                                FloatingActionButton(
                                  onPressed: () {},
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
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
