import 'package:bloc_state_management/emails_get_api/bloc/emails_bloc.dart';
import 'package:bloc_state_management/emails_get_api/bloc/emails_event.dart';
import 'package:bloc_state_management/emails_get_api/bloc/emails_state.dart';
import 'package:bloc_state_management/emails_get_api/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailsScreen extends StatefulWidget {
  const EmailsScreen({super.key});

  @override
  State<EmailsScreen> createState() => _EmailsScreenState();
}

class _EmailsScreenState extends State<EmailsScreen> {
  @override
  void initState() {
    context.read<EmailsBloc>().add(EmailsFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Emails List")),
      body: BlocBuilder<EmailsBloc, EmailsState>(
        builder: (context, state) {
          switch (state.apiResponseStatus) {
            case ApiResponseStatus.loading:
              return Center(child: CircularProgressIndicator());
            case ApiResponseStatus.failure:
              return Text(state.message);
            case ApiResponseStatus.success:
              return ListView.builder(
                itemCount: state.emailList.length,
                itemBuilder: (context, index) {
                  final indexedData = state.emailList[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 7,
                    ),
                    child: Card(
                      child: ListTile(
                        title: Text(indexedData.name ?? "N/A"),

                        subtitle: Text(indexedData.body ?? "N/A"),
                      ),
                    ),
                  );
                },
              );
          }
        },
      ),
    );
  }
}
