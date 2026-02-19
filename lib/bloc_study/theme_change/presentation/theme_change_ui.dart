import 'dart:math';

import 'package:bloc_state_management/bloc_study/theme_change/bloc/bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeChangeScreen extends StatefulWidget {
  const ThemeChangeScreen({super.key});

  @override
  State<ThemeChangeScreen> createState() => _ThemeChangeScreenState();
}

class _ThemeChangeScreenState extends State<ThemeChangeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("hello"), centerTitle: true),
      body: Center(
        child: Column(
          children: [
            Text(
              "If random value is even then theme will be light otherwise theme will be dark",
              textAlign: TextAlign.center,
            ),
            BlocBuilder<ThemeBloc, ThemeState>(
              builder: (BuildContext context, state) {
                return Column(
                  children: [
                    Text("${state.appTheme}"),
                    SizedBox(height: 20),
                    Text("Random value is: ${state.randInt}"),
                  ],
                );
              },
            ),

            ElevatedButton(
              onPressed: () {
                final int randInt = Random().nextInt(10);
                context.read<ThemeBloc>().add(
                  ChangeThemeEvent(randInt: randInt),
                );
              },
              child: Text("Change Theme"),
            ),
          ],
        ),
      ),
    );
  }
}
