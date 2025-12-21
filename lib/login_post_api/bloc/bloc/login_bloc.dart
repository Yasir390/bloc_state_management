import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<EmailChangedEvent>(_emailChanged);
    on<PasswordChangedEvent>(_passwordChanged);
    on<LoginApiEvent>(_loginApiEvent);
  }

  FutureOr<void> _emailChanged(
    EmailChangedEvent event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(email: event.email));
  }

  FutureOr<void> _passwordChanged(
    PasswordChangedEvent event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(password: event.password));
  }

  Future<void> _loginApiEvent(
    LoginApiEvent event,
    Emitter<LoginState> emit,
  ) async {
    Map data = {'email': state.email, 'password': state.password};
      emit(
          state.copyWith(
            apiResponseStatus: ApiResponseStatus.loading,
            message:"Submitting",
          ),
        );
    try {
      final response = await http.post(
        Uri.parse("https://reqres.in/api/login"),
        body: data,
      );
      var responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
         emit(
          state.copyWith(
            apiResponseStatus: ApiResponseStatus.error,
            message:"Login Successful",
          ),
        );
      } else {
        log(responseData['error']);
        emit(
          state.copyWith(
            apiResponseStatus: ApiResponseStatus.error,
            message:responseData['error'],
          ),
        );
      }
    } catch (e) {
      log(e.toString());
      emit(
        state.copyWith(
          apiResponseStatus: ApiResponseStatus.error,
          message: e.toString(),
        ),
      );
    }
  }
}
