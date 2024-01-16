import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/cubit/todo_cubit/todo_cubit.dart';


class ToDoAddPage extends StatelessWidget {
  ToDoAddPage({super.key});

  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final todoCubit = BlocProvider.of<TodoCubit>(context);
    return Scaffold(
      body: homeWidget(context, todoCubit),
    );
  }

  homeWidget(BuildContext context, TodoCubit todoCubit) {
    return Center(
      child: Column(
        children: [
          TextField(
            controller: name,
          ),
          TextButton(onPressed: () {
            todoCubit.addData(name.text);
            name.text = "";
            Navigator.of(context).pop();
          }, child: const Text("Add Data"))
        ],
      ),
    );
  }
}
