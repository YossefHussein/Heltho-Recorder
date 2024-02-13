import 'package:bmi_test/controller/cubit.dart';
import 'package:bmi_test/controller/states.dart';
import 'package:bmi_test/modules/1_gender_user.dart';
import 'package:bmi_test/modules/4_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // get and set data by these methods
    context.read<BmiMainCubit>().noUserCompletedTest();
    context.read<BmiMainCubit>().yseUserCompletedTest();
    return BlocConsumer<BmiMainCubit, BmiStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: // is complete test get the test if not that give result scree
              context.read<BmiMainCubit>().userNotCompleted == false
                  ? const GenderUser()
                  : ResultScreen(),
        );
      },
    );
  }
}
