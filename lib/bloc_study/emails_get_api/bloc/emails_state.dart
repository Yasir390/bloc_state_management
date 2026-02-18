import 'package:bloc_state_management/bloc_study/emails_get_api/model/emails_response_model.dart';
import 'package:bloc_state_management/bloc_study/emails_get_api/utils/enums.dart';
import 'package:equatable/equatable.dart';

class EmailsState extends Equatable {
  final ApiResponseStatus apiResponseStatus;
  final List<EmailsResponseModel> emailList;
  final String message;

  const EmailsState({
    this.apiResponseStatus = ApiResponseStatus.loading,
    this.emailList = const <EmailsResponseModel>[],
    this.message = "",
  });

  EmailsState copyWith({
    ApiResponseStatus? apiResponseStatus,
    List<EmailsResponseModel>? emailsList,
    String? message,
  }) {
    return EmailsState(
      apiResponseStatus: apiResponseStatus ?? this.apiResponseStatus,
      emailList: emailsList ?? emailList,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [apiResponseStatus, emailList, message];
}
