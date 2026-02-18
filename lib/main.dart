import 'package:bloc_state_management/bloc_study/counter_app/bloc/counter_bloc.dart';
import 'package:bloc_state_management/bloc_study/counter_app/presentation/counter_screen.dart';
import 'package:bloc_state_management/bloc_study/crud/bloc/crud_bloc.dart';
import 'package:bloc_state_management/bloc_study/emails_get_api/bloc/emails_bloc.dart';
import 'package:bloc_state_management/bloc_study/emails_get_api/repository/emails_repository.dart';
import 'package:bloc_state_management/bloc_study/favorite_app/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:bloc_state_management/bloc_study/favorite_app/repository/favorite_repository.dart';
import 'package:bloc_state_management/bloc_study/image_picker/bloc/bloc/image_picker_bloc.dart';
import 'package:bloc_state_management/bloc_study/switch_example/bloc/switch_bloc.dart';
import 'package:bloc_state_management/bloc_study/to_do/bloc/to_do_bloc/to_do_bloc.dart';
import 'package:bloc_state_management/bloc_study/utils/image_picker_utils.dart';
import 'package:bloc_state_management/cubit_study/counter_app_using_cubit/cubit/counter_cubit.dart';
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
        BlocProvider(
          create: (context) => FavoriteItemBloc(FavoriteRepository()),
        ),
        BlocProvider(create: (context) => EmailsBloc(EmailsRepository())),
        BlocProvider(create: (context) => CrudBloc()),
        BlocProvider<CounterCubit>(create: (context) => CounterCubit()),
      ],
      child: MaterialApp(
        title: 'Bloc State Management',
        debugShowCheckedModeBanner: false,
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
        home: CounterScreenUsingBloc(),
      ),
    );
  }
}
