import 'package:hive/hive.dart';
part 'employee_model.g.dart';



@HiveType(typeId: 1)
class EmployeeModel extends HiveObject {
  @HiveField(0)
   String name;
  @HiveField(1)
   String role;
  @HiveField(2)
   String startDate;
  @HiveField(3)
   String endDate;

  EmployeeModel(
      {required this.name,
      required this.role,
      required this.startDate,
      required this.endDate});
}
