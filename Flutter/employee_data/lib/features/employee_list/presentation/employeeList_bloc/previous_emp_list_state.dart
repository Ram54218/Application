import 'package:employee_data/features/employee_add_edit/data/model/employee_model.dart';

abstract class PreviousEmpListState{}

final class EmployeeListStateInit extends PreviousEmpListState{}

final class PreviousEmployeeList extends PreviousEmpListState{
  List<EmployeeModel> previousList;
  PreviousEmployeeList(this.previousList);
}