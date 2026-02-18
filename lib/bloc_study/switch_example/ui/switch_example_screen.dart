import 'dart:developer';

import 'package:bloc_state_management/bloc_study/switch_example/bloc/switch_bloc.dart';
import 'package:bloc_state_management/bloc_study/switch_example/bloc/switch_event.dart';
import 'package:bloc_state_management/bloc_study/switch_example/bloc/switch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchExampleScreen extends StatefulWidget {
  const SwitchExampleScreen({super.key});

  @override
  State<SwitchExampleScreen> createState() => _SwitchExampleScreenState();
}

class _SwitchExampleScreenState extends State<SwitchExampleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Multi State example")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: .center,
            crossAxisAlignment: .center,
            children: [
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text("Notifications"),
                  BlocBuilder<SwitchBloc, SwitchState>(
                    buildWhen: (previous, current) =>
                        previous.isSwitch != current.isSwitch,
                    builder: (BuildContext context, state) {
                      log("switch");
                      return Switch(
                        value: state.isSwitch,
                        onChanged: (value) {
                          context.read<SwitchBloc>().add(
                            EnableOrDisableNotificationEvent(),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
              BlocBuilder<SwitchBloc, SwitchState>(
                buildWhen: (previous, current) =>
                    previous.slider != current.slider,
                builder: (BuildContext context, state) {
                  log("container");
                  return Container(
                    height: 200,
                    color: Colors.red.withOpacity(state.slider),
                  );
                },
              ),

              SizedBox(height: 50),
              BlocBuilder<SwitchBloc, SwitchState>(
                buildWhen: (previous, current) =>
                    previous.slider != current.slider,
                builder: (BuildContext context, state) {
                  log("slider");
                  return Slider(
                    value: state.slider,
                    onChanged: (value) {
                      context.read<SwitchBloc>().add(
                        SliderEvent(slider: value),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
