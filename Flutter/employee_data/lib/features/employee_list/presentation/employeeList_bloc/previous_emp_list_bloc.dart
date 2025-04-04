import 'package:employee_data/boxes/employee_boxes/employee_boxes.dart';
import 'package:employee_data/features/employee_add_edit/data/model/employee_model.dart';
import 'package:employee_data/features/employee_list/presentation/employeeList_bloc/previous_emp_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class PreviousEmpListBloc extends Cubit<PreviousEmpListState>{
  PreviousEmpListBloc() : super(EmployeeListStateInit());

  void getPreviousEmployeeList() {
    final employeeBox = EmployeeBoxes.getEmployeeDetails();
    List<EmployeeModel> allList = employeeBox.values
        .toList()
        .where((data) =>
        DateFormat('d MMM y').parse(data.endDate).isBefore(DateTime.now()))
        .toList();
    emit(PreviousEmployeeList(allList));
  }

}