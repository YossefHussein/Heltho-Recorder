// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bmi_test/modules/1_gender_user.dart';
import 'package:bmi_test/shared/routes/main_routes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../shared/components/widgets.dart';
import '../shared/theme/theme.dart';

// this model to help me to adding the image and title
// and body for onboarding [onBoardingItem] method
class BoardingModel {
  // this title of on boarding
  final String title;
  // this image of on boarding
  final String lottieImage;
  // this body of on boarding
  final String body;

  BoardingModel({
    required this.title,
    required this.lottieImage,
    required this.body,
  });
}

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => Controlling();
}

class Controlling extends State<OnBoarding> {
  // this page controller to Controlling on page view
  var boardController = PageController();

  // when user move to last
  bool isLast = false;

  List<BoardingModel> boarding = [
    BoardingModel(
      title: 'Feature 1',
      lottieImage: 'assets/animations/onboarding/wired-flat-139-basket.json',
      body: 'More goods to buy',
    ),
    BoardingModel(
      title: 'Feature 2',
      lottieImage: 'assets/animations/onboarding/wired-flat-146-trolley.json',
      body: 'Goods move to you In any time',
    ),
    // BoardingModel(
    //   title: 'Feature 3',
    //   lottieImage: 'assets/animations/onboarding/wired-flat-290-coin.json',
    //   body: 'Good customer help to user',
    // ),
    // BoardingModel(
    //   title: 'Feature 4',
    //   lottieImage:
    //       'assets/animations/onboarding/wired-flat-950-help-customers.json',
    //   body: 'Good deal\'s for customer',
    // ),
    // BoardingModel(
    //   title: 'Feature 5',
    //   lottieImage: 'assets/animations/onboarding/wired-flat-1339-sale.json',
    //   body: 'Good goods with good sale\s',
    // ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            style: ButtonStyle(
              textStyle: MaterialStateProperty.all(
                TextStyle(color: Colors.black),
              ),
            ),
            onPressed: () {
              // go and replacement
              navigateAndFinish(
                context,
                GenderUser(),
              );
            },
            child: Text(
              'SKIP',
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          PageView.builder(
            controller: boardController,
            itemBuilder: (context, index) => onBoardingItem(
              model: boarding[index],
            ),
            // this method when change doing this
            // onPageChanged: (index) {
            //   if (index == boarding.length - 1) {
            //     // if true go to [ShopLoginScreen]
            //     // because when to be true and user click of [FloatingActionButton] Widget active code inside [FloatingActionButton]
            //     // and going to ShopLoginScreen
            //     setState(() {
            //       isLast = true;
            //     });
            //   } else {
            //     // if false mean go to next page
            //     setState(() {
            //       isLast = false;
            //     });
            //   }
            // },
            // adding the length of the [boarding] list
            itemCount: boarding.length,
          ),
          Row(
            children: [
              // this to adding style to indicator of onboarding screen
              SmoothPageIndicator(
                controller: boardController,
                count: boarding.length,
                // [ExpandingDotsEffect] is styling for [smooth page indicator]
                effect: ExpandingDotsEffect(
                  dotColor: Colors.grey,
                  activeDotColor: sColor,
                  dotHeight: 10,
                  expansionFactor: 4,
                  dotWidth: 8,
                  spacing: 5,
                ),
              ),
              // Spacer(),
              FloatingActionButton(
                onPressed: () {
                  if (isLast) {
                    // if true go to [ShopLoginScreen]
                    // navigateAndFinish(context, GenderUser());
                  } else {
                    // [boardController] next page this method to move next page inside page view
                    // boardController.nextPage(
                    //   // duration is 850 milliseconds
                    //   duration: Duration(milliseconds: 850),
                    //   // [fastLinearToSlowEaseIn] is style of movement
                    //   curve: Curves.fastLinearToSlowEaseIn,
                    // );
                  }
                },
                child: Icon(Icons.arrow_forward_ios_outlined),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget onBoardingItem({
    // this to passing when calling this method
    required BoardingModel model,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // this to passing for lottie
        Lottie.asset(model.lottieImage),
        // Spacer(
        //   flex: 1,
        // ),
        Text(
          // this to passing for title
          model.title,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          // this to passing for body
          model.body,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        // Spacer(
        //   flex: 2,
        // ),
      ],
    );
  }
}
