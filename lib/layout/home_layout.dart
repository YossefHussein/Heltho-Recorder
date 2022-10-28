import 'package:flutter/material.dart';
import '../modules/bmi_module/bmi_module.dart';
import '../modules/test.dart';
import '../shared/widget/appbar_method/appBar.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMethod(),
      body: Test(
        isMale: false,
      ),
    );
  }
}
