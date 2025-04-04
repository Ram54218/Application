import 'package:employee_data/boxes/employee_boxes/employee_boxes.dart';
import 'package:employee_data/features/employee_add_edit/data/model/employee_model.dart';
import 'package:employee_data/features/employee_add_edit/presentation/bloc/add_employee_bloc/add_employee_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddEmployeeBloc extends Cubit<AddEmployeeState> {
  AddEmployeeBloc() : super(AddEmployeeInitState());

  void addEditEmployee(bool isCurrentList, bool isEdit, int index,
      EmployeeModel employeeModel) async {
    final employeeBox = EmployeeBoxes.getEmployeeDetails();
    if (isEdit) {
      await employeeBox.putAt(index, employeeModel);
    } else {
      await employeeBox.add(employeeModel);
    }
  }

  void addEmployee() {
    emit(AddEmployeeSuccess());
  }

  void editEmployee(
      bool isCurrentList, int index, EmployeeModel employeeModel) {
    emit(EditEmployeeDetail(isCurrentList, index, employeeModel));
  }
}
