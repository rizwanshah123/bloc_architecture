import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'counter_state.dart';

class CounterCubit extends HydratedCubit<CounterState>  {
  CounterCubit() : super(CounterState(count: 0)) {
   // hydrate();
  }

  void increment() {
    emit(CounterState(count: state.count + 1, wasIncremented: true));
  }

  void decrement() {
    emit(CounterState(count: state.count - 1, wasIncremented: false));
  }

  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    return CounterState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(CounterState state) {
    return state.toMap();
  }
}
