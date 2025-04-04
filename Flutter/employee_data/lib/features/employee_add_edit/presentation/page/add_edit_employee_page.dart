import 'package:employee_data/constant/style/cm_text_style.dart';
import 'package:employee_data/features/employee_add_edit/data/model/employee_model.dart';
import 'package:employee_data/features/employee_add_edit/presentation/bloc/add_employee_bloc/add_employee_bloc.dart';
import 'package:employee_data/features/employee_add_edit/presentation/bloc/employee_role_bloc/employee_role_bloc.dart';
import 'package:employee_data/features/employee_add_edit/presentation/bloc/employee_role_bloc/employee_role_state.dart';
import 'package:employee_data/features/employee_add_edit/presentation/widget/calender_widget.dart';
import 'package:employee_data/features/employee_add_edit/presentation/widget/employee_role_listview.dart';
import 'package:employee_data/features/employee_list/presentation/page/employee_list_page/employee_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/add_employee_bloc/add_employee_state.dart';
import '../bloc/calender_bloc/calender_sel_bloc.dart';
import '../bloc/calender_bloc/calender_sel_state.dart';

class AddEditEmployeePage extends StatefulWidget {
  final bool isEdit;

  const AddEditEmployeePage({super.key, required this.isEdit});

  @override
  State<AddEditEmployeePage> createState() => _AddEditEmployeePageState();
}

class _AddEditEmployeePageState extends State<AddEditEmployeePage> {
  TextEditingController employeeName = TextEditingController();
  TextEditingController employeeRole = TextEditingController();
  TextEditingController employeeStartDate = TextEditingController();
  TextEditingController employeeEndDate = TextEditingController();
  int selIndex = 0;
  bool isCurrentList = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.isEdit
            ? const Text('Edit Employee Details',
                style: TextStyle(color: Colors.white))
            : const Text('Add Employee Details',
                style: TextStyle(color: Colors.white)),
        automaticallyImplyLeading: false,
        backgroundColor: CmTextStyle.themeColor,
      ),
      body: _bodyWidget(context),
    );
  }

  Widget _bodyWidget(BuildContext context) {
    return BlocBuilder<AddEmployeeBloc, AddEmployeeState>(
      builder: (context, state) {
        if (state is AddEmployeeSuccess) {
          clearController();
        }

        if (state is EditEmployeeDetail) {
          selIndex = state.index;
          isCurrentList = state.isCurrentList;
          employeeName.text = state.employeeModel.name.toString();
          employeeRole.text = state.employeeModel.role.toString();
          employeeStartDate.text = state.employeeModel.startDate.toString();
          employeeEndDate.text = state.employeeModel.endDate.toString();
        }
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(
                  flex: 9,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        TextField(
                          controller: employeeName,
                          decoration: InputDecoration(
                            border: CmTextStyle.textFieldBorderStyle,
                            focusedBorder: CmTextStyle.textFieldBorder,
                            enabledBorder: CmTextStyle.textFieldBorder,
                            hintStyle:
                                const TextStyle(color: Color(0xff949C9E)),
                            hintText: 'Employee Name',
                            prefixIcon: const ImageIcon(
                                color: CmTextStyle.themeColor,
                                AssetImage('assets/images/profile.png')),
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        BlocBuilder<EmployeeRoleBloc, EmployeeRoleState>(
                          builder: (context, state) {
                            if (state is SelEmployeeRole) {
                              employeeRole.text = state.selEmployeeRole;
                            }
                            return TextField(
                              controller: employeeRole,
                              showCursor: false,
                              readOnly: true,
                              enableInteractiveSelection: false,
                              decoration: InputDecoration(
                                border: CmTextStyle.textFieldBorderStyle,
                                focusedBorder: CmTextStyle.textFieldBorder,
                                enabledBorder: CmTextStyle.textFieldBorder,
                                hintStyle:
                                    const TextStyle(color: Color(0xff949C9E)),
                                hintText: 'Select role',
                                prefixIcon: const ImageIcon(
                                    color: CmTextStyle.themeColor,
                                    AssetImage('assets/images/role.png')),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    context
                                        .read<EmployeeRoleBloc>()
                                        .getAllEmployeeRoles();
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          return const EmployeeRoleListView();
                                        });
                                  },
                                  child: const ImageIcon(
                                      color: CmTextStyle.themeColor,
                                      AssetImage('assets/images/dropdown.png')),
                                ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 15.0),
                        BlocBuilder<CalenderSelBloc, CalenderSelState>(
                          builder: (context, state) {
                            if (state is SetControllerValue) {
                              state.controllerType
                                  ? employeeEndDate.text = state.setDate
                                  : employeeStartDate.text = state.setDate;
                            }
                            return Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: employeeStartDate,
                                    showCursor: false,
                                    readOnly: true,
                                    enableInteractiveSelection: false,
                                    style: const TextStyle(
                                        color: Color(0xff323238)),
                                    decoration: InputDecoration(
                                      border: CmTextStyle.textFieldBorderStyle,
                                      focusedBorder:
                                          CmTextStyle.textFieldBorder,
                                      enabledBorder:
                                          CmTextStyle.textFieldBorder,
                                      hintStyle: const TextStyle(
                                          color: Color(0xff949C9E)),
                                      hintText: 'Today',
                                      prefixIcon: GestureDetector(
                                        onTap: () {
                                          context
                                              .read<CalenderSelBloc>()
                                              .selInitState(
                                                  employeeStartDate.text);
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return const AlertDialog(
                                                  contentPadding:
                                                      EdgeInsets.zero,
                                                  content: CalenderWidget(
                                                      isEndDateCalenderView:
                                                          false),
                                                );
                                              });
                                        },
                                        child: const ImageIcon(
                                            color: CmTextStyle.themeColor,
                                            AssetImage(
                                                'assets/images/calender.png')),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 15.0),
                                const ImageIcon(
                                    color: CmTextStyle.themeColor,
                                    AssetImage('assets/images/arrow.png')),
                                const SizedBox(width: 15.0),
                                Expanded(
                                  child: TextField(
                                    controller: employeeEndDate,
                                    showCursor: false,
                                    readOnly: true,
                                    enableInteractiveSelection: false,
                                    decoration: InputDecoration(
                                      border: CmTextStyle.textFieldBorderStyle,
                                      focusedBorder:
                                          CmTextStyle.textFieldBorder,
                                      enabledBorder:
                                          CmTextStyle.textFieldBorder,
                                      hintStyle: const TextStyle(
                                          color: Color(0xff949C9E)),
                                      hintText: 'No Date',
                                      prefixIcon: GestureDetector(
                                        onTap: () {
                                          context
                                              .read<CalenderSelBloc>()
                                              .selInitState(
                                                  employeeEndDate.text);
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return const AlertDialog(
                                                  contentPadding:
                                                      EdgeInsets.zero,
                                                  content: CalenderWidget(
                                                      isEndDateCalenderView:
                                                          true),
                                                );
                                              });
                                        },
                                        child: const ImageIcon(
                                            color: CmTextStyle.themeColor,
                                            AssetImage(
                                                'assets/images/calender.png')),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  )),
              const Divider(thickness: 1.4, color: Color(0xffF2F2F2)),
              Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 10.0, left: 10.0, right: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                            style: CmTextStyle.cancelButtonStyle,
                            onPressed: () {
                              clearController();
                              Navigator.pop(context);
                            },
                            child: const Text('Cancel',
                                style:
                                    TextStyle(color: CmTextStyle.themeColor))),
                        const SizedBox(width: 12.0),
                        ElevatedButton(
                            style: CmTextStyle.saveButtonStyle,
                            onPressed: () {
                              context.read<AddEmployeeBloc>().addEditEmployee(
                                  isCurrentList,
                                  widget.isEdit,
                                  selIndex,
                                  EmployeeModel(
                                      name: employeeName.text,
                                      role: employeeRole.text,
                                      startDate: employeeStartDate.text,
                                      endDate: employeeEndDate.text));

                              clearController();

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const EmployeeListPage()));
                            },
                            child: const Text('Save',
                                style: TextStyle(color: Colors.white)))
                      ],
                    ),
                  )),
            ],
          ),
        );
      },
    );
  }

  void clearController() {
    employeeName.text = "";
    employeeRole.text = "";
    employeeStartDate.text = "";
    employeeEndDate.text = "";
  }
}
