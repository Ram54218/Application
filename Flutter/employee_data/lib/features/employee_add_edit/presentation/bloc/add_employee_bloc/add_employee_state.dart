import 'package:employee_data/features/employee_add_edit/data/model/employee_model.dart';

abstract class AddEmployeeState{}

final class AddEmployeeInitState extends AddEmployeeState{}
final class AddEmployeeSuccess extends AddEmployeeState{}
final class EditEmployeeDetail extends AddEmployeeState{
  bool isCurrentList;
  EmployeeModel employeeModel;
  int index;
  EditEmployeeDetail(this.isCurrentList, this. index, this.employeeModel);
}