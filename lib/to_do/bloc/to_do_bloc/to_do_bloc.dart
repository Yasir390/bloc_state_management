import 'dart:async';

import 'package:bloc_state_management/to_do/bloc/to_do_event/to_do_event.dart';
import 'package:bloc_state_management/to_do/bloc/to_do_state/to_do_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {
  final List<String> todoList = [];
  ToDoBloc() : super(ToDoState()) {
    on<AddToDoEvent>(_addToDoEvent);
    on<RemoveToDoEvent>(_removeToDoEvent);
  }
  @override
  List<Object?> get props => [todoList];

  FutureOr<void> _addToDoEvent(AddToDoEvent event, Emitter<ToDoState> emit) {
    todoList.add(event.task);
    emit(state.copyWith(todoList: List.from(todoList)));
  }

  FutureOr<void> _removeToDoEvent(RemoveToDoEvent event, Emitter<ToDoState> emit) {
    todoList.remove(event.task);
    emit(state.copyWith(todoList: List.from(todoList)));
  }
}
