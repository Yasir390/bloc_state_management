import 'package:bloc_state_management/counter_app/bloc/counter_bloc.dart';
import 'package:bloc_state_management/switch_example/bloc/switch_bloc.dart';
import 'package:bloc_state_management/switch_example/ui/switch_example_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(create: (context) => SwitchBloc()),
      ],
      child: MaterialApp(
        title: 'Bloc State Management',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.amber,
            centerTitle: true,
          ),
        ),
        home: SwitchExampleScreen(),
      ),
    );
  }
}
