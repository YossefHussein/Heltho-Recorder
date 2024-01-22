import 'dart:math';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';

class ConfettiScreen extends StatefulWidget {
  String? targetScreen;
  ConfettiScreen({super.key, this.targetScreen});

  @override
  State<ConfettiScreen> createState() => _ConfettiScreenState();
}

// 'TickerProviderStateMixin' this for adding the this keyword to AnimationController object
class _ConfettiScreenState extends State<ConfettiScreen>
    with TickerProviderStateMixin {
  // this for the
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

  // for adding random choice
  final _random = Random();

  late AnimationController _confetti;
  late final _player = AudioPlayer(); // Create a player

  @override
  void initState() {
    super.initState();
    _confetti = AnimationController(vsync: this);
    _player;
  }

  @override
  void dispose() {
    _confetti.dispose();
    super.dispose();
    _player;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset(
          animationList[_random.nextInt(animationList.length)],
          controller: _confetti,
          onLoaded: (composition) async {
            _confetti
              ..duration = composition.duration
              ..forward().whenComplete(
                () async {
                  // final duration = await _player.setUrl(
                  //   // Load a URL
                  //   'https://foo.com/bar.mp3',
                  // ); // Schemes: (https: | file: | asset: )
                  // _player.play();
                  Navigator.pushReplacementNamed(context, widget.targetScreen!);
                },
              );
          },
        ),
      ),
    );
  }
}
