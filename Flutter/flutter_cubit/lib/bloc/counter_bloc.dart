import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_events.dart';

class CounterBloc extends Bloc<CounterEvents, dynamic> {
  CounterBloc() : super(0) {
    on<inc>((event, emit) {
      emit(state + 1);
    });

    on<dec>((event, emit) {
      emit(state - 1);
    });
  }
}
