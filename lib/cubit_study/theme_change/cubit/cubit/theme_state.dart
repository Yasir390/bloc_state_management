part of 'theme_cubit.dart';
class ThemeStateByCubit extends Equatable {
  final AppThemeByCubit appTheme;
  final int? randInt;
  const ThemeStateByCubit({required this.appTheme, this.randInt});

  @override
  List<Object?> get props => [appTheme, randInt];

  factory ThemeStateByCubit.initial() {
    return ThemeStateByCubit(appTheme: AppThemeByCubit.light);
  }

  ThemeStateByCubit copyWith({AppThemeByCubit? appTheme, int? randInt}) {
    return ThemeStateByCubit(
      appTheme: appTheme ?? this.appTheme,
      randInt: randInt ?? this.randInt,
    );
  }
}

enum AppThemeByCubit { light, dark }
