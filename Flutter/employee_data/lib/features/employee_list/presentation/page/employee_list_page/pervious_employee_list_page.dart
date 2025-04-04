import 'package:employee_data/features/employee_add_edit/presentation/bloc/add_employee_bloc/add_employee_bloc.dart';
import 'package:employee_data/features/employee_add_edit/presentation/page/add_edit_employee_page.dart';
import 'package:employee_data/features/employee_list/presentation/employeeList_bloc/previous_emp_list_bloc.dart';
import 'package:employee_data/features/employee_list/presentation/employeeList_bloc/previous_emp_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PreviousEmployeeListPage extends StatelessWidget {
  const PreviousEmployeeListPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<PreviousEmpListBloc>().getPreviousEmployeeList();
    return BlocBuilder<PreviousEmpListBloc, PreviousEmpListState>(
      builder: (context, state) {
        if (state is PreviousEmployeeList) {
          return ListView.separated(
            itemCount: state.previousList.length,
            itemBuilder: (context, index) {
              final data = state.previousList[index];
              return GestureDetector(
                onTap: () {
                  context.read<AddEmployeeBloc>().editEmployee(false, index, data);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddEditEmployeePage(
                                isEdit: true,
                              )));
                },
                child: Dismissible(
                  //key: Key(details[index].toString()),
                  key: Key(UniqueKey().toString()),
                  background: Container(
                    color: const Color(0xffF34642),
                  ),
                  secondaryBackground: Container(
                    color: const Color(0xffF34642),
                    child: const Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: ImageIcon(
                              color: Colors.white,
                              AssetImage('assets/images/delete.png')),
                        )),
                  ),
                  onDismissed: (direction) {
                    if (direction == DismissDirection.endToStart) {
                      data.delete();
                      //context.read<AddEmployeeBloc>().editEmployee('delete', data);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Employee Data has been deleted')));
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 12.0, left: 12.0, right: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data.name,
                            style: const TextStyle(
                                fontSize: 16, color: Color(0xff323238))),
                        const SizedBox(height: 5.0),
                        Text(data.role,
                            style: const TextStyle(
                                fontSize: 14, color: Color(0xff949C9E))),
                        const SizedBox(height: 5.0),
                        Row(
                          children: [
                            const Text(
                              'From ',
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xff949C9E)),
                            ),
                            Text(data.startDate,
                                style: const TextStyle(
                                    fontSize: 12, color: Color(0xff949C9E))),
                          ],
                        ),
                        const SizedBox(height: 5.0),
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(color: Color(0xffE5E5E5), thickness: 1.2);
            },
          );
        }
        return const Center(child: Text('No Records found'));
      },
    );
  }
}
