import 'package:flutter_bloc/flutter_bloc.dart';

class TodoCubit extends Cubit<List<String>> {
  TodoCubit() : super([]);

  void addData(String data) {
    state.add(data);
    emit([...state]);
  }
}
