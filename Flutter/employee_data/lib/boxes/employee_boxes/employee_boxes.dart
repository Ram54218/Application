import 'package:hive/hive.dart';

import '../../features/employee_add_edit/data/model/employee_model.dart';

class EmployeeBoxes{
  static Box<EmployeeModel> getEmployeeDetails() => Hive.box<EmployeeModel>('employeeModel');
}