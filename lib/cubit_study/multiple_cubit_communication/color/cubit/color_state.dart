part of 'color_cubit.dart';

class ColorState extends Equatable {
  final Color color;

  const ColorState({required this.color});

  @override
  List<Object> get props => [color];
  factory ColorState.initial() {
    return ColorState(color: Colors.red);
  }

  ColorState copyWith({Color? color}) {
    return ColorState(color: color ?? this.color);
  }
}
