import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/cubit/todo_cubit/todo_cubit.dart';
import 'package:flutter_cubit/pages/cubit_todo_add_page.dart';

class ToDoHomePage extends StatelessWidget {
  const ToDoHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final todoCubit = BlocProvider.of<TodoCubit>(context);
    return Scaffold(
      body: homeWidget(context, todoCubit),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ToDoAddPage()));
        },
      ),
    );
  }

  homeWidget(BuildContext context, TodoCubit todoCubit) {
    return BlocBuilder<TodoCubit, List<String>>(builder: (context, dataList) {
      return dataList.isEmpty ? const Text("No Records"): ListView.builder(
          itemCount: dataList.length,
          itemBuilder: (context, index) {
            return Text(dataList[index]);
          });
    });
  }
}
