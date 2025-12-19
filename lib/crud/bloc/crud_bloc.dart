import 'dart:async';
import 'package:bloc_state_management/crud/bloc/crud_event.dart';
import 'package:bloc_state_management/crud/bloc/crud_state.dart';
import 'package:bloc_state_management/crud/model/crud_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CrudBloc extends Bloc<CrudEvent, CrudState> {
  CrudBloc() : super(const CrudState()) {
    on<AddCrudEvent>(_addCrud);
    on<ToggleCrudEvent>(_toggleCrud);
    on<DeleteCrudEvent>(_deleteCrud);
  }

  FutureOr<void> _addCrud(AddCrudEvent event, Emitter<CrudState> emit) {
    final updated = List<CrudModel>.from(state.crudList)..add(event.crudModel);
    emit(CrudState(crudList: updated));
  }

  FutureOr<void> _toggleCrud(ToggleCrudEvent event, Emitter<CrudState> emit) {
    final updated = state.crudList.map((e) {
      return e.id == event.id
          ? CrudModel(id: e.id, title: e.title, isCompleted: !e.isCompleted)
          : e;
    }).toList();
    emit(CrudState(crudList: updated));
  }

  FutureOr<void> _deleteCrud(DeleteCrudEvent event, Emitter<CrudState> emit) {
    // final updated = state.crudList
    //     .where((element) => element.id != event.id)
    //     .toList();
    final updated = List<CrudModel>.from(state.crudList) ..removeWhere((element) => element.id == event.id);
    emit(CrudState(crudList: updated));
  }
}
