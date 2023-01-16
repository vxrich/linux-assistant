import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tutorial/bloc/commands_bloc.dart';
import 'package:flutter_tutorial/components/sidebar.dart';

import "../bloc/commands_state.dart";

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child:
        BlocBuilder<CommandsBloc, CommandsState>(builder: (context, state) {
      return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Text("Settings"),
        // AnimatedContainer(
        //   duration: Duration(milliseconds: 300),
        //   width: 200,
        //   height: 50,
        //   decoration: BoxDecoration(
        //     gradient: _isPressed
        //         ? LinearGradient(
        //             colors: [Colors.red, Colors.orange],
        //             begin: Alignment.topLeft,
        //             end: Alignment.bottomRight,
        //           )
        //         : LinearGradient(
        //             colors: [Colors.lightBlue, Colors.blue],
        //             begin: Alignment.topLeft,
        //             end: Alignment.bottomRight,
        //           ),
        //     borderRadius: BorderRadius.circular(25),
        //   ),
        //   child: Center(
        //     child: Text(
        //       'Animate gradient on long press',
        //       style: TextStyle(color: Colors.white),
        //     ),
        //   ),
        // )
      ]);
    })));
  }
}
