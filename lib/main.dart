import 'package:bloc_state_management/counter_app/bloc/counter_bloc.dart';
import 'package:bloc_state_management/image_picker/bloc/bloc/image_picker_bloc.dart';
import 'package:bloc_state_management/switch_example/bloc/switch_bloc.dart';
import 'package:bloc_state_management/to_do/bloc/to_do_bloc/to_do_bloc.dart';
import 'package:bloc_state_management/to_do/ui/to_do_screen.dart';
import 'package:bloc_state_management/utils/image_picker_utils.dart';
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
        BlocProvider(
          create: (context) =>
              ImagePickerBloc(imagePickerUtils: ImagePickerUtils()),
        ),
        BlocProvider(create: (context) => ToDoBloc()),
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
        builder: (context, child) {
          return SafeArea(bottom: true, top: false, child: child!);
        }, //to avoid ui show under system navigation bar
        home: ToDoScreen(),
      ),
    );
  }
}
