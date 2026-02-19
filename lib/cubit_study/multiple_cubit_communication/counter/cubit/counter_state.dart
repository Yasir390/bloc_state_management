part of 'counter_cubit.dart';

class CounterState extends Equatable {
  final int counter;

  const CounterState({required this.counter});

  @override
  List<Object?> get props => [counter];

  factory CounterState.initial() {
    return CounterState(counter: 0);
  }
  CounterState copyWith({int? counter}) {
    return CounterState(counter: counter ?? this.counter);
  }
}

// sealed class CounterState extends Equatable {
//   const CounterState();

//   @override
//   List<Object> get props => [];
// }

// final class CounterInitial extends CounterState {}
