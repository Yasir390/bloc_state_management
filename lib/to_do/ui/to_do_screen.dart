import 'package:bloc_state_management/to_do/bloc/to_do_bloc/to_do_bloc.dart';
import 'package:bloc_state_management/to_do/bloc/to_do_event/to_do_event.dart';
import 'package:bloc_state_management/to_do/bloc/to_do_state/to_do_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("To-Do Bloc")),
      body: BlocBuilder<ToDoBloc, ToDoState>(
        builder: (context, state) {
          if (state.todoList.isEmpty) {
            return Center(child: Text("No ToDo Found"));
          } else {
            return ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: state.todoList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.todoList[index]),
                  trailing: IconButton(
                    onPressed: () {
                      context.read<ToDoBloc>().add(
                        RemoveToDoEvent(task: state.todoList[index]),
                      );
                    },
                    icon: Icon(Icons.delete_forever),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          for (int i = 0; i < 10; i++) {
            context.read<ToDoBloc>().add(AddToDoEvent(task: "Task: $i"));
          }
        },
      ),
    );
  }
}
