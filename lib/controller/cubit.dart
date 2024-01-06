import 'package:bloc/bloc.dart';
import 'package:bmi_test/controller/states.dart';
import 'package:bmi_test/modules/1_gender_user.dart';
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
}

