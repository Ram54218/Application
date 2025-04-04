import 'package:employee_data/boxes/employee_boxes/employee_boxes.dart';
import 'package:employee_data/features/employee_list/presentation/employeeList_bloc/all_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllListBloc extends Cubit<AllListState> {
  AllListBloc() : super(AllListStateCheck(0));

  void checkListData() {
    final employeeBox = EmployeeBoxes.getEmployeeDetails();
    emit(AllListStateCheck(employeeBox.values.length));
  }
}
