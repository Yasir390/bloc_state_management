part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final AppTheme appTheme;
  final int? randInt;
  const ThemeState({this.appTheme = AppTheme.light, this.randInt});

  factory ThemeState.initial() {
    return ThemeState();
  }
  @override
  List<Object?> get props => [appTheme, randInt];

  @override
  String toString() => 'ThemeChangeState(appTheme: $appTheme)';

  ThemeState copyWith({AppTheme? appTheme, int? randInt}) {
    return ThemeState(
      appTheme: appTheme ?? this.appTheme,
      randInt: randInt ?? this.randInt,
    );
  }
}

enum AppTheme { light, dart }
