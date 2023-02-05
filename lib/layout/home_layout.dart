import 'package:bmi_test/modules/bmi_module/bmi_module.dart';
import 'package:flutter/material.dart';
import '../shared/widget/appbar/appBar.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        title: 'BMI',
        isLeading: false,
      ),
      body: const BmiModule(),
    );
  }
}
