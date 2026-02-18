import 'dart:async';

import 'package:bloc_state_management/bloc_study/switch_example/bloc/switch_event.dart';
import 'package:bloc_state_management/bloc_study/switch_example/bloc/switch_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(SwitchState()) {
    on<EnableOrDisableNotificationEvent>(_enableOrDisableNotification);
    on<SliderEvent>(_slider);
  }

  FutureOr<void> _enableOrDisableNotification(
    EnableOrDisableNotificationEvent event,
    Emitter<SwitchState> emit,
  ) {
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }

  FutureOr<void> _slider(SliderEvent event, Emitter<SwitchState> emit) {
    emit(state.copyWith(slider: event.slider));
  }
}
