import 'dart:developer';

import 'package:bloc_state_management/login_post_api/bloc/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc loginBloc;

  @override
  void initState() {
    super.initState();
    loginBloc = LoginBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: BlocProvider(
        create: (BuildContext context) => loginBloc,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              SizedBox(height: 30),
              BlocBuilder<LoginBloc, LoginState>(
                buildWhen: (previous, current) =>
                    previous.email != current.email,
                builder: (context, state) {
                  log("email section");
                  return TextFormField(
                    decoration: InputDecoration(
                      hintText: "Email",
                      border: OutlineInputBorder(),
                    ),
                    textInputAction: TextInputAction.next,
                    onChanged: (value) {
                      context.read<LoginBloc>().add(
                        EmailChangedEvent(email: value.toString()),
                      );
                    },
                  );
                },
              ),
              SizedBox(height: 20),
              BlocBuilder<LoginBloc, LoginState>(
                buildWhen: (previous, current) =>
                    previous.password != current.password,
                builder: (context, state) {
                  log("password section");
                  return TextFormField(
                    decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(),
                    ),
                    textInputAction: TextInputAction.next,
                    onChanged: (value) {
                      context.read<LoginBloc>().add(
                        PasswordChangedEvent(password: value.toString()),
                      );
                    },
                  );
                },
              ),

              SizedBox(height: 20),
              BlocListener<LoginBloc, LoginState>(
                listener: (context, state) {
                  if (state.apiResponseStatus == ApiResponseStatus.error) {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(SnackBar(content: Text(state.message)));
                  }
                  if (state.apiResponseStatus == ApiResponseStatus.loading) {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(SnackBar(content: Text(state.message)));
                  }
                  if (state.apiResponseStatus == ApiResponseStatus.success) {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(SnackBar(content: Text(state.message)));
                  }
                },
                child: BlocBuilder<LoginBloc, LoginState>(
                  buildWhen: (previous, current) => false,
                  builder: (context, state) {
                    log("password section");
                    return ElevatedButton(
                      onPressed: () {
                        //eve.holt@reqres.in
                        //cityslicka
                        context.read<LoginBloc>().add(LoginApiEvent());
                      },
                      child: Text("Login"),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
