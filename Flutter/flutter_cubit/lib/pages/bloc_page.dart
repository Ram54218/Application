import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/bloc/counter_bloc.dart';

class BlocPage extends StatelessWidget {
  const BlocPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      body: homeWidget(context,counterBloc),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(onPressed: (){
            counterBloc.add(inc());
          }, child: const Icon(Icons.add)),
          const SizedBox(height: 10.0),
          FloatingActionButton(onPressed: (){
            counterBloc.add(dec());
          }, child: const Icon(Icons.minimize))
        ],
      ),
    );
  }

  homeWidget(BuildContext context, CounterBloc counterBloc) {
    return Center(
      child: BlocBuilder<CounterBloc, dynamic>(
          builder: (context, counter){
            return Text(counter.toString());
          }),
    );
  }
}
