import 'package:bloc_state_management/cubit_study/counter_app_using_cubit/cubit/counter_cubit.dart';
import 'package:bloc_state_management/cubit_study/counter_app_using_cubit/cubit/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// এখানে তোমার CounterCubit আর CounterState থাকবে

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Counter Example")),
        body: Center(
          child: BlocBuilder<CounterCubit, CounterState>(
            builder: (context, state) {
              return Text(
                'Counter: ${state.counter}',
                style: const TextStyle(fontSize: 32),
              );
            },
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: "increment",
              onPressed: () => context.read<CounterCubit>().increment(),
              child: const Icon(Icons.add),
            ),
            const SizedBox(width: 12),
            FloatingActionButton(
              heroTag: "decrement",
              onPressed: () => context.read<CounterCubit>().decrement(),
              child: const Icon(Icons.remove),
            ),
          ],
        ),
      );
  }
}


// import 'package:bloc_state_management/bloc_study/counter_app/bloc/counter_state.dart';
// import 'package:bloc_state_management/cubit_study/counter_app_using_cubit/cubit/counter_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class CounterAppUsingCubit extends StatefulWidget {
//   const CounterAppUsingCubit({super.key});

//   @override
//   State<CounterAppUsingCubit> createState() => _CounterAppUsingCubitState();
// }

// class _CounterAppUsingCubitState extends State<CounterAppUsingCubit> {
//   @override
//   Widget build(BuildContext context) {
//     final counterCubit = context.read<CounterCubit>();
//     return Scaffold(
//       appBar: AppBar(title: const Text('Cubit Counter App')),
//       body: Center(
//         child: BlocBuilder<CounterCubit, CounterState>(
//           builder: (context, count) {
//             return Text('$count', style: const TextStyle(fontSize: 40));
//           },
//         ),
//       ),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           FloatingActionButton(
//             onPressed: counterCubit.increment,
//             child: const Icon(Icons.add),
//           ),
//           const SizedBox(width: 10),
//           FloatingActionButton(
//             onPressed: counterCubit.decrement,
//             child: const Icon(Icons.remove),
//           ),
//         ],
//       ),
//     );
//   }
// }
