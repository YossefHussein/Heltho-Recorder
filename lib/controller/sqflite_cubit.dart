import 'package:bloc/bloc.dart';
import 'package:sqflite/sqflite.dart';

import 'sqflite_state.dart';

class SqfliteCubit extends Cubit<SqfliteState> {
  SqfliteCubit() : super(SqfliteInitial());

  late Database database;

  List<Map> userData = [];

  void createDatabase() {
    openDatabase('userData.db', version: 1, onCreate: (database, version) {
      database
          .execute(
        'CREATE TABLE userDate (id INTEGER PRIMARY KEY,isMale TEXT , height INTEGER , weight INTEGER , result INTEGER )',
      )
          .then(
        (value) {
          print('database created');
        },
      ).catchError(
        (error) {
          print('error is ${error.toString()}');
        },
      );
    }, onOpen: (database) {
      getDataFromDatabase(database);
      print('database opened');
    }).then((value) {
      database = value;
      emit(AppCreateDatabaseState());
    });
  }

  Future<void> insertToDatabase({
    required String isMale,
    required double weight,
    required double height,
    required double result,
  }) async {
    await database.transaction((txn) async {
      txn
          .rawInsert(
        'INSERT INTO userData(isMale,weight,height,result) VALUES("$isMale" , "${weight.toInt()}","${height.toInt()}","${result.toInt()}")',
      )
          .then((value) {
        print(
            'the id is ($value)\n \'now you insert new record (mean insert information to userData table) have those values\' \n isMale userData: $isMale \n weight userData: $weight \n height userData: $height \n insert userData is complete');
        emit(AppInsertDatabaseState());
        getDataFromDatabase(database);
      }).catchError((error) {
        print('error is ${error.toString()}');
      });
      return null;
    });
  }

  Future<void> getDataFromDatabase(Database database) async {
    userData = [];
    database.rawQuery("SELECT * FROM userData").then((value) {
      value.forEach((element) {
        if (element['status'] == 'new');
      });
      print('ALL DARA {$userData}');
      emit(AppGetDatabaseState());
    });
  }

  Future<void> updateDatabase({
    required String status,
    required int id,
  }) async {
    database.rawUpdate('UPDATE userData SET status = ? WHERE id = ?', [
      '$status',
      id,
    ]).then(
      (value) {
        getDataFromDatabase(database);
        emit(AppUpdateDatabaseState());
      },
    );
  }

  Future<void> deleteData({
    required int id,
  }) async {
    await database.rawDelete('DELETE FROM userData WHERE id = ?', [
      id,
    ]).then(
      (value) {
        getDataFromDatabase(database);
        emit(AppDeleteDatabaseState());
      },
    );
  }
}
