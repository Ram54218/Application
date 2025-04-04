
abstract class EmployeeRoleState {}

final class EmployeeRolesLoading extends EmployeeRoleState {}

final class EmployeeRolesLoaded extends EmployeeRoleState {
  List<String> employeeRoles;

  EmployeeRolesLoaded({required this.employeeRoles});
}

final class SelEmployeeRole extends EmployeeRoleState {
  String selEmployeeRole;
  SelEmployeeRole({required this.selEmployeeRole});
}
