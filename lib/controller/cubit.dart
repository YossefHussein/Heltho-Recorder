import 'dart:math';

import 'package:bmi_test/controller/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

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

  changeSlider(value) {
    heightValue = value.toInt();
    emit(ChangeSilderValue());
  }

  // value of age
  int ageValue = 20;
  // adding to age
  void addingToAge() {
    ageValue++;
    emit(AddingToAge());
  }

  // less to age
  void lessToAge() {
    ageValue--;
    emit(LessToAge());
  }

  // value of weight
  int weightValue = 70;
  // adding to weight
  void addingToWeight() {
    weightValue.round();
    weightValue++;
    emit(AddingToWeight());
  }

  // less to weight
  void lessToWeight() {
    weightValue.round();
    weightValue--;
    emit(LessToWeight());
  }

  double resultPrint({double? height, double? weight}) {
    // height = this.heightValue;
    // weight = this.weightValue;
    return weightValue / pow(heightValue / 100, 2);
  }

  // Obtain shared preferences.
  late final SharedPreferences prefs;

  // this variable to check on user if completed 
  // test or not for if user completed see the result
  bool userNotCompleted = true;

  /// this to save if user complete test
  /// and this function is set key
  void noUserCompletedTest() async {
    prefs = await SharedPreferences.getInstance();
    // Save an boolean value to 'repeat' key.
    await prefs.setBool('userNotCompleted', userNotCompleted);
    emit(NoUserCompletedTest());
  }

  // this to get the user data
  void yseUserCompletedTest() async {
    prefs = await SharedPreferences.getInstance();
    // Save an boolean value to 'repeat' key.
    await prefs.getBool('userNotCompleted');
    emit(YseUserCompletedTest());
  }

  // this if user exits mean used and he wanted to do the test agin change the
  void changeLocalAuth() {
    userNotCompleted = !userNotCompleted;
    emit(ChangeLocalAuth());
  }

  void deleteLocalAuth() async {
    userNotCompleted = !userNotCompleted;
    await prefs.remove('userNotCompleted');
    noUserCompletedTest();
    emit(DeleteLocalAuth());
  }

  /// local database of application

  static Database? _database;
  static const String tableName = 'user_data';

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  static Future<Database> initDatabase() async {
    String path = join(
      await getDatabasesPath(),
      'user_database.db',
    );
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          '''
          CREATE TABLE $tableName(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            gender bool,
            height REAL,
            weight REAL,
            age INTEGER,
            bmi REAL
          )
        ''',
        );
      },
    );
  }

  Future<void> insertUserData(Map<String, dynamic> userData) async {
    userData['bmi'] = resultPrint(
      height: userData['height'],
      weight: userData['weight'],
    );
    Database db = await database;
    await db.insert(tableName, userData);
  }

  Future<List<Map<String, dynamic>>> getUserData() async {
    Database db = await database;
    return await db.query(tableName);
  }
}
