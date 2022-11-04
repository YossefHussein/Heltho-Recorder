import 'package:bmi_test/shared/theme/theme.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  bool isMale = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bmi'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(pPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  // GenderWidget(
                  //   isMale: true,
                  //   genderIcon: Icons.female,
                  //   function: () => isMale = false,
                  // ),
                  // SizedBox(
                  //   width: pBoxSize,
                  // ),
                  // GenderWidget(
                  //   isMale: false,
                  //   genderIcon: Icons.male,
                  //   function: () => isMale = true,
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
