import 'dart:math';

import 'package:bloc_state_management/cubit_study/theme_change/cubit/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeUiByCubit extends StatelessWidget {
  const ThemeUiByCubit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Theme change ui by Cubit")),

      body: Column(
        mainAxisAlignment: .center,
        crossAxisAlignment: .center,
        children: [
          Text(
            "If Random value is even then theme will be light, otherwise theme will be dark",
            textAlign: TextAlign.center,
          ),
          BlocBuilder<ThemeCubit, ThemeStateByCubit>(
            builder: (context, state) {
              return Column(children: [Text("Rand value is : ${state.randInt}")]);
            },
          ),

          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              final int randInt = Random().nextInt(12);
              context.read<ThemeCubit>().changeTheme(randInt: randInt);
            },
            child: Text("Change Theme"),
          ),
        ],
      ),
    );
  }
}
