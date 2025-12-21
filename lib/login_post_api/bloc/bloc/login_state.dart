part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.email = '',
    this.password = '',
    this.message = '',
    this.apiResponseStatus = ApiResponseStatus.initial,
  });
  final String email;
  final String password;
  final String message;
  final ApiResponseStatus apiResponseStatus;

  LoginState copyWith({
    String? email,
    String? password,
    String? message,
    ApiResponseStatus? apiResponseStatus,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      message: message ?? this.message,
      apiResponseStatus: apiResponseStatus ?? this.apiResponseStatus,
    );
  }

  @override
  List<Object> get props => [email, password, message, apiResponseStatus];
}

enum ApiResponseStatus { initial, loading, success, error }
