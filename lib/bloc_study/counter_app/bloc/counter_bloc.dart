import 'package:bloc_state_management/bloc_study/counter_app/bloc/counter_event.dart';
import 'package:bloc_state_management/bloc_study/counter_app/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState.initial()) {
    on<IncrementCounterEvent>(_increment);
    on<DecrementCounterEvent>(_decrement);
  }

  void _increment(IncrementCounterEvent event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: state.counter + 1));
  }

  void _decrement(DecrementCounterEvent event, Emitter<CounterState> emit) {
    if (state.counter > 0) {
      emit(state.copyWith(counter: state.counter - 1));
    }
  }
}
