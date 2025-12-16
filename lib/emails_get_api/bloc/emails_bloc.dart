import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_state_management/emails_get_api/bloc/emails_event.dart';
import 'package:bloc_state_management/emails_get_api/bloc/emails_state.dart';
import 'package:bloc_state_management/emails_get_api/repository/emails_repository.dart';
import 'package:bloc_state_management/emails_get_api/utils/enums.dart';

class EmailsBloc extends Bloc<EmailsEvent, EmailsState> {
  final EmailsRepository emailsRepository;

  EmailsBloc(this.emailsRepository) : super(const EmailsState()) {
    on<EmailsFetchEvent>(_onEmailFetch);
  }

  Future<void> _onEmailFetch(
    EmailsFetchEvent event,
    Emitter<EmailsState> emit,
  ) async {
    emit(state.copyWith(apiResponseStatus: ApiResponseStatus.loading));
    try {
      final emails = await emailsRepository.fetchEmails();
      emit(
        state.copyWith(
          apiResponseStatus: ApiResponseStatus.success,
          emailsList: emails,
          message: "Success",
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          apiResponseStatus: ApiResponseStatus.failure,
          message: error.toString(),
        ),
      );
    }
  }
}
