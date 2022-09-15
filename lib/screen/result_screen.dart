import 'package:flutter/material.dart';
import '../theme.dart';

class ResultScreen extends StatelessWidget {
  /* this value to use in slider
  And I use this in selected height of user */
  /// This value to use in selected what is gender of user
  final bool gender;
  // height of user
  final int height;
  // weight of user
  final int weight;
  // age of user
  final int age;
  // Your BMI
  final double result;

  const ResultScreen(
      {Key? key,
      required this.age,
      required this.height,
      required this.gender,
      required this.weight,
      required this.result})
      : super(key: key);

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
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(pPadding),
            child: Center(
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Gender : ${gender == false ? 'man' : 'woman'}',
                        style: const TextStyle(fontSize: pMediumFontSize),
                      ),
                      Text(
                        'Height : $height',
                        style: const TextStyle(fontSize: pMediumFontSize),
                      ),
                      Text(
                        'Weight : $weight',
                        style: const TextStyle(fontSize: pMediumFontSize),
                      ),
                      Text(
                        'Age : $age',
                        style: const TextStyle(fontSize: pMediumFontSize),
                      ),
                      Text(
                        '(BMI) Your result : ${result.round()}',
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
      ),
    );
  }
}
