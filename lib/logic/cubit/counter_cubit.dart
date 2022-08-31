import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(count: 0));

  void increment(BuildContext context) {
    emit(CounterState(count: state.count + 1,wasIncremented: true));
    
  }

  void decrement(BuildContext context) {
    emit(CounterState(count: state.count - 1,wasIncremented:false));
  }
}
