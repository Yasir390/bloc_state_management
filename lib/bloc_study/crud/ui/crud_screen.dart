import 'package:bloc_state_management/bloc_study/crud/bloc/crud_bloc.dart';
import 'package:bloc_state_management/bloc_study/crud/bloc/crud_event.dart';
import 'package:bloc_state_management/bloc_study/crud/bloc/crud_state.dart';
import 'package:bloc_state_management/bloc_study/crud/model/crud_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CrudScreen extends StatefulWidget {
  const CrudScreen({super.key});

  @override
  State<CrudScreen> createState() => _CrudScreenState();
}

class _CrudScreenState extends State<CrudScreen> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Crud with Bloc")),
      body: BlocBuilder<CrudBloc, CrudState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.crudList.length,
            itemBuilder: (context, index) {
              final crud = state.crudList[index];
              return ListTile(
                title: Text(
                  crud.title,
                  style: TextStyle(
                    decoration: crud.isCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                leading: Checkbox(
                  value: crud.isCompleted,
                  onChanged: (_) {
                    context.read<CrudBloc>().add(ToggleCrudEvent(id: crud.id));
                  },
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    context.read<CrudBloc>().add(DeleteCrudEvent(id: crud.id));
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter++;
          final newCrud = CrudModel(
            id: counter.toString(),
            title: "Task $counter",
            isCompleted: false,
          );
          context.read<CrudBloc>().add(AddCrudEvent(crudModel: newCrud));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
