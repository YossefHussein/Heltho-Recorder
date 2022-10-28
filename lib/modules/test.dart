import 'package:bmi_test/shared/widget/gender_widget/gender_widget.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  bool? isMale;
  Test({Key? key, this.isMale}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GenderWidget(
          isMale: false,
          iconGender: Icons.female,
          functionGender: () => setState(() {
            widget.isMale = true;
          }),
        ),
      ),
    );
  }
}
