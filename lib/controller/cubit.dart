import 'dart:math';

import 'package:bmi_test/controller/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmiMainCubit extends Cubit<BmiStates> {
  BmiMainCubit() : super(BmiMainInits());

  // give me the methods and the variale and etc
  static BmiMainCubit get(BuildContext context) => BlocProvider.of(context);

  // this value to use in selected what is gender of user
  bool? isMale;

  selctedUserGender(bool? genderUser) {
    if (genderUser == false) {
      isMale = false;
    } else {
      isMale = true;
    }
    emit(SelectedUserGender());
  }

  // value of height
  int heightValue = 175;

  changeSilder(double value) {
    heightValue = value.toInt();
    emit(ChangeSilderValue());
  }

  // value of age
  int ageValue = 20;

  void addingToAge() {
    ageValue++;
    emit(AddingToAge());
  }

  void lessToAge() {
    ageValue--;
    emit(LessToAge());
  }

  // value of weight
  int weightValue = 70;
  void addingToWeight() {
    weightValue++;
    emit(AddingToWeight());
  }

  void lessToWeight() {
    weightValue--;
    emit(LessToWeight());
  }

  double reusltPrint() {
    return weightValue / pow(heightValue / 100, 2);
  }
}
