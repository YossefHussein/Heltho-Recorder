import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ConfettiScreen extends StatefulWidget {

  Widget targetScreen;
  ConfettiScreen({super.key, required this.targetScreen});

  @override
  State<ConfettiScreen> createState() => _ConfettiScreenState();
}

class _ConfettiScreenState extends State<ConfettiScreen>
    with TickerProviderStateMixin {
  List<String> animationList = [
    'assets/animations/confetti/confetti_1.json',
    'assets/animations/confetti/confetti_2.json',
    'assets/animations/confetti/confetti_3.json',
    'assets/animations/confetti/confetti_4.json',
    'assets/animations/confetti/confetti_5.json',
    'assets/animations/confetti/confetti_6.json',
    'assets/animations/confetti/confetti_7.json',
    'assets/animations/confetti/confetti_8.json',
    'assets/animations/confetti/confetti_8.json',
  ];

  final _random = Random();

  late AnimationController _confetti;

  @override
  void initState() {
    super.initState();
    _confetti = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _confetti.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          animationList[_random.nextInt(animationList.length)],
          controller: _confetti,
          onLoaded: (composition) {
            _confetti
              ..duration = composition.duration
              ..forward().whenComplete(
                () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return widget.targetScreen;
                      },
                    ),
                  );
                },
              );
          },
        ),
      ),
    );
  }
}
