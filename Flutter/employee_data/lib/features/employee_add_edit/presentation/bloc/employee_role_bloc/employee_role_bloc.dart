import 'package:flutter_bloc/flutter_bloc.dart';
import 'employee_role_state.dart';

class EmployeeRoleBloc extends Cubit<EmployeeRoleState> {
  final List<String> employeeRole = [
    'Product Designer',
    'Flutter Developer',
    'QA Tester',
    'Product Owner'
  ];

  EmployeeRoleBloc() : super(EmployeeRolesLoading());

  void getAllEmployeeRoles() {
    emit(EmployeeRolesLoaded(employeeRoles: employeeRole));
  }

  void selEmployeeRole(String selEmployeeRole){
    emit(SelEmployeeRole(selEmployeeRole: selEmployeeRole));
  }
}
