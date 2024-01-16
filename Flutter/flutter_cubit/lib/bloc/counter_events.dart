part of 'counter_bloc.dart';

sealed class CounterEvents{}

final class inc extends CounterEvents{}

final class dec extends CounterEvents{}