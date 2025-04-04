import 'package:employee_data/features/employee_add_edit/presentation/bloc/calender_bloc/calender_sel_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CalenderSelBloc extends Cubit<CalenderSelState> {
  CalenderSelBloc() : super(CalenderInitState());

  // check StartDateView or EndDateView of Calender
  void sendToTextField(bool view, DateTime selDate){
    String date = DateFormat('d MMM y').format(selDate);
    emit(SetControllerValue(view, date));
  }

  void selInitState(String initDate) {
    if (initDate != "") {
      DateTime date = DateFormat('d MMM y').parse(initDate);
      emit(CalenderSelectedState(date));
    } else {
      emit(CalenderSelectedState(DateTime.now()));
    }
  }

  void selectedDate(DateTime selDate) {
    emit(CalenderSelectedState(selDate));
  }

  void selTodayDate() {
    emit(CalenderSelectedState(DateTime.now()));
  }

  void selNextDay(String day) {
    DateTime result;
    for (int i = 1; i < 8; i++) {
      DateTime temp = DateTime.now().add(Duration(days: i));
      if (DateFormat('E').format(temp) == day) {
        result = temp;
        emit(CalenderSelectedState(result));
      }
    }
  }

  void selNextWeek() {
    DateTime result = DateTime.now().add(const Duration(days: 7));
    emit(CalenderSelectedState(result));
  }
}
