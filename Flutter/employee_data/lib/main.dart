import 'package:employee_data/features/employee_add_edit/presentation/bloc/add_employee_bloc/add_employee_bloc.dart';
import 'package:employee_data/features/employee_add_edit/presentation/bloc/employee_role_bloc/employee_role_bloc.dart';
import 'package:employee_data/features/employee_list/presentation/employeeList_bloc/employee_list_bloc.dart';
import 'package:employee_data/features/employee_list/presentation/page/employee_list_page/employee_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'features/employee_add_edit/data/model/employee_model.dart';
import 'features/employee_add_edit/presentation/bloc/calender_bloc/calender_sel_bloc.dart';
import 'features/employee_list/presentation/employeeList_bloc/all_list_bloc.dart';
import 'features/employee_list/presentation/employeeList_bloc/previous_emp_list_bloc.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(EmployeeModelAdapter());
  await Hive.openBox<EmployeeModel>("employeeModel");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => EmployeeRoleBloc()..getAllEmployeeRoles()),
        BlocProvider(create: (context) => CalenderSelBloc()),
        BlocProvider(create: (context) => AddEmployeeBloc()),
        BlocProvider(create: (context) => EmployeeListBloc()),
        BlocProvider(create: (context) => PreviousEmpListBloc()),
        BlocProvider(create: (context) => AllListBloc()),
      ],
      child: const MaterialApp(
        home: EmployeeListPage(),
      ),
    );
  }
}
