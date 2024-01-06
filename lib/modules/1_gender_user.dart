import 'package:audioplayers/audioplayers.dart';
import 'package:bmi_test/controller/cubit.dart';
import 'package:bmi_test/controller/states.dart';
import 'package:bmi_test/modules/2_height.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
// import 'package:just_audio/just_audio.dart';

import '../shared/theme/theme.dart';
import '../shared/translations/locale_keys.dart';

class GenderUser extends StatefulWidget {
  const GenderUser({super.key});

  @override
  State<GenderUser> createState() => _GenderUserState();
}

class _GenderUserState extends State<GenderUser> with TickerProviderStateMixin {
  // this value to use in selected what is gender of user
  // bool isMale = false;


  String pathAudio = "assets/audio/piano_click.mp3";

  // void playAudio() async {
  //   await player.setAsset(pathAudio);
  //   player.play();
  // }

  late AnimationController _controllerFemale;
  late AnimationController _controllerMale;

  final player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _controllerFemale = AnimationController(vsync: this);
    _controllerMale = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controllerFemale.dispose();
    _controllerMale.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BmiMainCubit, BmiStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(),
                BmiMainCubit.get(context).isMale == null
                    ? Lottie.asset('assets/animations/pushups.json')
                    : BmiMainCubit.get(context).isMale == false
                        ? Lottie.asset(
                            'assets/animations/avatar_female.json',
                            controller: _controllerFemale,
                            onLoaded: (composition) {
                              //  Configure the AnimationController with the duration of the
                              // Lottie file and start the animation.
                              _controllerFemale
                                ..duration = composition.duration
                                ..forward();
                            },
                          )
                        : Lottie.asset(
                            'assets/animations/avatar_man.json',
                            controller: _controllerMale,
                            onLoaded: (composition) {
                              //  Configure the AnimationController with the duration of the
                              // Lottie file and start the animation.
                              _controllerMale
                                ..duration = composition.duration
                                ..forward();
                            },
                          ),
                Text(
                  'what is you gender \n (${BmiMainCubit.get(context).isMale == null ? "I dont know? please preesd to selected \n your gender" : "${BmiMainCubit.get(context).isMale == false ? "female" : "male"}"})',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),

                /// selected gender of user male or female
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            await AudioPlayer().play(
                                AssetSource('assets/audio/piano_click.mp3'));
                            BmiMainCubit.get(context).selctedUserGender(false);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: BmiMainCubit.get(context).isMale == false
                                  ? pColorSelectedFemale
                                  : sColor,
                              borderRadius: BorderRadius.circular(pBorderSize),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.female,
                                  size: pIconSize,
                                ),
                                const SizedBox(height: pSizeBox),
                                Text(
                                  LocaleKeys.woman.tr().toUpperCase(),
                                  style: const TextStyle(color: Colors.white),
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
                          onTap: () async {
                            // setState(() {
                            //   isMale = false;
                            // });
                            // // playAudio();
                            BmiMainCubit.get(context).selctedUserGender(true);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: BmiMainCubit.get(context).isMale == true
                                  ? pColorSelectedMale
                                  : sColor,
                              borderRadius: BorderRadius.circular(pBorderSize),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.male,
                                  size: pIconSize,
                                ),
                                const SizedBox(height: pSizeBox),
                                Text(
                                  LocaleKeys.man.tr().toUpperCase(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                    onPressed: () async {
                      await player.play(AssetSource(pathAudio));
                    },
                    child: Text(
                      "hello",
                      style: TextStyle(color: Colors.black),
                    )),
                Spacer(),
                // to give my (BMI)
                Container(
                  width: double.infinity,
                  height: 50,
                  color: pColorResultButton,
                  child: TextButton(
                    child: Center(
                      child: Text(
                        LocaleKeys.calculate.tr().toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HeightScreen()));
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
