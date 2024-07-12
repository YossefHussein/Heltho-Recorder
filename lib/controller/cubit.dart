import 'dart:math';

import 'package:bmi_test/controller/states.dart';
import 'package:bmi_test/modules/4_result.dart';
import 'package:bmi_test/modules/support_me.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class BmiMainCubit extends Cubit<BmiStates> {
  BmiMainCubit() : super(BmiMainInits());

  // give me the methods and the variale and etc
  static BmiMainCubit get(BuildContext context) => BlocProvider.of(context);

  var currentScreen = 0;

  List<Widget> screenApp = [
    const ResultScreen(),
    const SupportMeScreen(),
  ];

  List<BottomNavigationBarItem> bottomItem = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_filled),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Bootstrap.heart_fill,
      ),
      label: 'Support',
    ),
  ];

  void changeBottomNavBarScreen(int value) {
    currentScreen = value;
    emit(ChangeBottomNavBarScreen());
  }

  // this value to use in selected what is gender of user
  bool? isMale;

  selectedUserGender(bool? genderUser) {
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

  TextEditingController ageController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  seeAgeValue() {
    int ageValue = this.ageValue;
    ageValue = int.tryParse(ageController.text) ?? 0;
    return ageValue;
  }
}
