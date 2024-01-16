import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/cubit/counter_cubit/counter_cubit.dart';

class CubitPage extends StatelessWidget {
  const CubitPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterCubit = BlocProvider.of<CounterCubit>(context);
    return Scaffold(
      body: homeWidget(context, counterCubit),
      floatingActionButton: Column(
        children: [
          FloatingActionButton(onPressed: () {
            counterCubit.inc();
          }, child: const Icon(Icons.add),),
          FloatingActionButton(
            onPressed: () {
              counterCubit.dec();
            }, child: const Icon(Icons.minimize),)
        ],
      ),
    );
  }

  homeWidget(BuildContext context, CounterCubit counterCubit) {
    return Center(
        child: BlocBuilder<CounterCubit, dynamic>(
          builder: (context, counter) {
            return Text(counter.toString());
          },
        ),
    );
  }
}
