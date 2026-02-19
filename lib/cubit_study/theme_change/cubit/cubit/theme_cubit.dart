import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeStateByCubit> {
  ThemeCubit() : super(ThemeStateByCubit.initial());

  void changeTheme({required int randInt}) {
    if (randInt % 2 == 0) {
      emit(state.copyWith(appTheme: AppThemeByCubit.light,randInt: randInt));
    } else {
      emit(state.copyWith(appTheme: AppThemeByCubit.dark,randInt: randInt));
    }
  }
}
