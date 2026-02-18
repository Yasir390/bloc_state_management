import 'package:bloc_state_management/bloc_study/counter_app/bloc/counter_bloc.dart';
import 'package:bloc_state_management/bloc_study/counter_app/bloc/counter_event.dart';
import 'package:bloc_state_management/bloc_study/counter_app/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreenUsingBloc extends StatefulWidget {
  const CounterScreenUsingBloc({super.key});

  @override
  State<CounterScreenUsingBloc> createState() => _CounterScreenUsingBlocState();
}

class _CounterScreenUsingBlocState extends State<CounterScreenUsingBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Counter Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text("Counter: ${state.counter}");
              },
            ),
            Row(
              mainAxisAlignment: .spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(IncrementCounterEvent());
                  },
                  child: Text("Increment"),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(DecrementCounterEvent());
                  },
                  child: Text("Decrement"), 
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {}),
    );
  }
}




// 1. UI Layer (CounterScreen)
// BlocBuilder<CounterBloc, CounterState> → Bloc এর state শুনে UI rebuild করে।
// যখনই নতুন state emit হয়, builder আবার run হয় এবং Text(state.counter.toString()) আপডেট হয়।
// ElevatedButton → Bloc এ event পাঠাচ্ছে (IncrementCounter, DecrementCounter)।
// context.read<CounterBloc>().add(...) → Bloc কে জানাচ্ছে কোন action নিতে হবে।
// 👉 এখানে UI শুধু state দেখাচ্ছে এবং event পাঠাচ্ছে — খুব clean separation।