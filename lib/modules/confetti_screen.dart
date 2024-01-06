import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ConfettiScreen extends StatelessWidget {
  List<String> testList = ['assets/animations/confetti.json'];

  Future<void> moveToThisScreen() async {
    Future.delayed(
      const Duration(seconds: 3),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Lottie.asset('assets/animations/confetti.json')),
    );
  }
}
