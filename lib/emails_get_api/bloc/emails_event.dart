import 'package:equatable/equatable.dart';

abstract class EmailsEvent extends Equatable {
  const EmailsEvent();

  @override 
  List<Object?> get props => [];
}

class EmailsFetchEvent extends EmailsEvent {}
