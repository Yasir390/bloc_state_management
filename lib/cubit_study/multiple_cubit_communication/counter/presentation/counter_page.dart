import 'package:bloc_state_management/cubit_study/multiple_cubit_communication/color/cubit/color_cubit.dart';
import 'package:bloc_state_management/cubit_study/multiple_cubit_communication/counter/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterUI extends StatelessWidget {
  const CounterUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("Counter Example"),),
      backgroundColor: context.watch<ColorCubit>().state.color,
      body: Column(
        mainAxisAlignment: .center,
        children: [
          ElevatedButton(onPressed: () {
            context.read<ColorCubit>().changeColor();
          }, child: Text("Change Color")),
          SizedBox(height: 20),
          Center(
            child: BlocBuilder<CounterCubitMultiListen, CounterState>(
              builder: (context, state) {
                return Text(
                  'Counter: ${state.counter}',
                  style: const TextStyle(fontSize: 32),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "increment",
            onPressed: () =>
                context.read<CounterCubitMultiListen>().increment(),
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
