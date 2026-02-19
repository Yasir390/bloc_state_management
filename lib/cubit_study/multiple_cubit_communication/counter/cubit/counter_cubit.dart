import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_state_management/cubit_study/multiple_cubit_communication/color/cubit/color_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'counter_state.dart';

class CounterCubitMultiListen extends Cubit<CounterState> {
  int incremenetSize = 1;
  final ColorCubit colorCubit;
  late final StreamSubscription colorSubscription;
  CounterCubitMultiListen({required this.colorCubit})
    : super(CounterState.initial()) {
    colorSubscription = colorCubit.stream.listen((ColorState colorState) {
      if (colorState.color == Colors.red) {
        incremenetSize = 1;
        emit(state.copyWith(counter: state.counter + incremenetSize));
      } else if (colorState.color == Colors.green) {
        incremenetSize = 10;
        emit(state.copyWith(counter: state.counter + incremenetSize));
      } else if (colorState.color == Colors.blue) {
        incremenetSize = 100;
        emit(state.copyWith(counter: state.counter + incremenetSize));
      } else if (colorState.color == Colors.black) {
        incremenetSize = -100;
        emit(state.copyWith(counter: state.counter - 100));
      }
    });
  }

  //  void changeCounter(){
  //   emit(state.copyWith(counter: state.counter+incremenetSize));
  //  }
  @override
  Future<void> close() {
    colorSubscription.cancel();
    return super.close();
  }

  void increment() {
    emit(state.copyWith(counter: state.counter + 1));
  }
}
