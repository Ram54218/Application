import 'package:employee_data/features/employee_add_edit/presentation/bloc/employee_role_bloc/employee_role_bloc.dart';
import 'package:employee_data/features/employee_add_edit/presentation/bloc/employee_role_bloc/employee_role_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeeRoleListView extends StatelessWidget {
  const EmployeeRoleListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.35,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: BlocBuilder<EmployeeRoleBloc, EmployeeRoleState>(
          builder: (context, state) {
            if (state is EmployeeRolesLoading) {
              return const CircularProgressIndicator();
            }
            if (state is EmployeeRolesLoaded) {
              return ListView.builder(
                  itemCount: state.employeeRoles.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                         context.read<EmployeeRoleBloc>().selEmployeeRole(state.employeeRoles[index]);
                         Navigator.pop(context);
                      },
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              state.employeeRoles[index],
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                          const Divider(thickness: 1.4),
                        ],
                      ),
                    );
                  });
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
