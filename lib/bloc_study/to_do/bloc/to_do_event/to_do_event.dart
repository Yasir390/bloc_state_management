import 'package:equatable/equatable.dart';

abstract class ToDoEvent extends Equatable{
  @override
  List<Object?> get props => [];

}

class AddToDoEvent extends ToDoEvent{
  final String task;
  AddToDoEvent({required this.task});

   @override
  List<Object?> get props => [task];
}
class RemoveToDoEvent extends ToDoEvent{
   final Object task;
  RemoveToDoEvent({required this.task});

   @override
  List<Object?> get props => [task];
}