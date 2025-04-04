import 'package:employee_data/features/employee_add_edit/data/model/employee_model.dart';

abstract class EmployeeListState{}

final class EmployeeListStateInit extends EmployeeListState{}
final class CurrentEmployeeList extends EmployeeListState{
  List<EmployeeModel> currentList;
  CurrentEmployeeList(this.currentList);
}