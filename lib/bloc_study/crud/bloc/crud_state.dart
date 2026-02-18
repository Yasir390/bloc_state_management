import 'package:bloc_state_management/bloc_study/crud/model/crud_model.dart';
import 'package:equatable/equatable.dart';

class CrudState extends Equatable {
  final List<CrudModel> crudList;
  const CrudState({this.crudList = const []});
  @override
  List<Object?> get props => [crudList];
}
