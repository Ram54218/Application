import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/bloc/counter_bloc.dart';
import 'package:flutter_cubit/cubit/counter_cubit/counter_cubit.dart';
import 'package:flutter_cubit/pages/bloc_page.dart';
import 'package:flutter_cubit/pages/cubit_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => CounterCubit()),
          BlocProvider(create: (_) => CounterBloc())
        ],
        child: const MaterialApp(
          // home: CubitPage()
          home: BlocPage(),//
        ));
  }
}
