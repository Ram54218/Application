import 'package:employee_data/constant/style/cm_text_style.dart';
import 'package:employee_data/features/employee_add_edit/presentation/page/add_edit_employee_page.dart';
import 'package:employee_data/features/employee_list/presentation/employeeList_bloc/all_list_bloc.dart';
import 'package:employee_data/features/employee_list/presentation/employeeList_bloc/all_list_state.dart';
import 'package:employee_data/features/employee_list/presentation/page/employee_list_page/pervious_employee_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../employee_add_edit/presentation/bloc/add_employee_bloc/add_employee_bloc.dart';
import 'current_emp_list_view.dart';

class EmployeeListPage extends StatelessWidget {
  const EmployeeListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Employee List', style: TextStyle(color: Colors.white)),
        backgroundColor: CmTextStyle.themeColor,
      ),
      body: _bodyWidget(context),
    );
  }

  Widget _bodyWidget(BuildContext context) {
    context.read<AllListBloc>().checkListData();
    context.read<AllListBloc>();
    return BlocBuilder<AllListBloc, AllListState>(
      builder: (context, state) {
        if (state is AllListStateCheck) {
           if(state.length == 0){
             return Column(
               children: [
                 const Expanded(child: Image(image: AssetImage('assets/images/empty_list_img.png'))),
                 Padding(
                   padding: const EdgeInsets.only(
                       left: 12.0, right: 12.0, bottom: 12.0, top: 5.0),
                   child: Expanded(
                       flex: 1,
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           const Text(
                             'Swift left to delete',
                             style: TextStyle(color: Color(0xff949C9E)),
                           ),
                           FloatingActionButton(
                             onPressed: () {
                               context.read<AddEmployeeBloc>().addEmployee();
                               Navigator.push(
                                   context,
                                   MaterialPageRoute(
                                       builder: (context) =>
                                       const AddEditEmployeePage(
                                           isEdit: false)));
                             },
                             backgroundColor: CmTextStyle.themeColor,
                             child: const Icon(Icons.add, color: Colors.white),
                           )
                         ],
                       )),
                 )
               ],
             );
           }
        }
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: const Color(0xffF2F2F2),
          child: Column(
            children: [
              Expanded(
                  flex: 9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(17.0),
                        child: Expanded(
                            flex: 1,
                            child: Text('Current employees',
                                style:
                                    TextStyle(color: CmTextStyle.themeColor))),
                      ),
                      Expanded(
                          flex: 4,
                          child: Container(
                              color: Colors.white,
                              child: const CurrentEmployeeListView())),
                      const Padding(
                        padding: EdgeInsets.all(17.0),
                        child: Expanded(
                            flex: 1,
                            child: Text('Previous employees',
                                style:
                                    TextStyle(color: CmTextStyle.themeColor))),
                      ),
                      Expanded(
                          flex: 4,
                          child: Container(
                              color: Colors.white,
                              child: const PreviousEmployeeListPage())),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.only(
                    left: 12.0, right: 12.0, bottom: 12.0, top: 5.0),
                child: Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Swift left to delete',
                          style: TextStyle(color: Color(0xff949C9E)),
                        ),
                        FloatingActionButton(
                          onPressed: () {
                            context.read<AddEmployeeBloc>().addEmployee();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const AddEditEmployeePage(
                                            isEdit: false)));
                          },
                          backgroundColor: CmTextStyle.themeColor,
                          child: const Icon(Icons.add, color: Colors.white),
                        )
                      ],
                    )),
              )
            ],
          ),
        );
      },
    );
  }
}
