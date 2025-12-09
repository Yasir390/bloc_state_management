import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class EquatablePracticeScreen extends StatefulWidget {
  const EquatablePracticeScreen({super.key});

  @override
  State<EquatablePracticeScreen> createState() =>
      _EquatablePracticeScreenState();
}

class _EquatablePracticeScreenState extends State<EquatablePracticeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Person person = Person(name: "Hasan", age: 21);
          Person person1 = Person(name: "Hasan", age: 21);

          log(person.hashCode.toString());
          log(person1.hashCode.toString());
          log((person == person1).toString());
        },
      ),
    );
  }
}

//!using equatable
class Person extends Equatable {
  final String name;
  final int age;
  const Person({required this.name, required this.age});
  @override
  List<Object?> get props => [name, age];
}

//!without equatable
// class Person   {
//   final String name;
//   final int age;
//   const Person({required this.name, required this.age});

// }
