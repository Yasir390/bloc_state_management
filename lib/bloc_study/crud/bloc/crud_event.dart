import 'package:bloc_state_management/bloc_study/crud/model/crud_model.dart';

abstract class CrudEvent {}

class AddCrudEvent extends CrudEvent {
  final CrudModel crudModel;
  AddCrudEvent({required this.crudModel});
}

class ToggleCrudEvent extends CrudEvent {
  final String id;
  ToggleCrudEvent({required this.id});
}

class DeleteCrudEvent extends CrudEvent {
  final String id;
  DeleteCrudEvent({required this.id});
}
