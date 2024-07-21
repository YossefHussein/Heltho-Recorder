import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sqflite_state.dart';

class SqfliteCubit extends Cubit<SqfliteState> {
  SqfliteCubit() : super(SqfliteInitial());
}
