import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tutorial/bloc/commands_bloc.dart';
import 'package:flutter_tutorial/models/commands.dart';
import 'package:flutter_tutorial/sidebar.dart';
import 'package:flutter_tutorial/textInput.dart';
import 'package:process_run/shell.dart';

import "../bloc/commands_state.dart";
import "../bloc/commands_event.dart";

import '../button.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, String>> programs = const [
    {"text": "Open terminal", "command": "gnome-terminal"},
    {"text": "Open Chrome", "command": "google-chrome"},
    {"text": "Open Chrome Incognito", "command": "google-chrome --incognito"}
  ];

  var _commandText = "";
  var _commandInstruction = "";

  void handleAdd(context) {
    if (_commandText != "" && _commandInstruction != "") {
      BlocProvider.of<CommandsBloc>(context).add(AddCommand(
          Command(text: _commandText, command: _commandInstruction)));
      resetFields();
    }
  }

  void resetFields() {
    setState(() {
      _commandText = "";
      _commandInstruction = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: Drawer(child: Column(children: const [Text("Home")])),
        body: Center(child:
            BlocBuilder<CommandsBloc, CommandsState>(builder: (context, state) {
          return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            const Sidebar(),
            Column(children: [
              ...List.generate(
                  programs.length, // Length of the list
                  (index) => Button(
                      action: () => _launchApp(programs[index]["command"]),
                      text: programs[index]["text"] as String,
                      margin:
                          const EdgeInsets.only(top: 10, left: 10, right: 5))),
              ...List.generate(
                  state.commands.length, // Length of the list
                  (index) => Button(
                      text: state.commands[index].text,
                      action: () => _launchApp(state.commands[index].command),
                      longPressAction: () => {
                            BlocProvider.of<CommandsBloc>(context).add(
                                RemoveCommand(Command(
                                    text: state.commands[index].text,
                                    command: state.commands[index].command)))
                          },
                      margin:
                          const EdgeInsets.only(top: 10, left: 10, right: 5))),
              // Button(
              //     action: () => {
              //           BlocProvider.of<CommandsBloc>(context).add(const AddCommand(
              //               Command(
              //                   text: "Prova",
              //                   command: "google-chrome https://instagram.com")))
              //         },
              //     text: "+")
            ]),
            Expanded(
              child: Column(children: [
                Container(
                    margin: const EdgeInsets.only(top: 10, left: 10, right: 5),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextInput(
                              margin: const EdgeInsets.only(right: 5),
                              value: _commandText,
                              placeholder: "Name comando",
                              onChange: (text) {
                                setState(() {
                                  _commandText = text;
                                });
                              }),
                          TextInput(
                              margin: const EdgeInsets.only(right: 5),
                              value: _commandInstruction,
                              placeholder: "Comando",
                              onChange: (text) {
                                setState(() {
                                  _commandInstruction = text;
                                });
                              }),
                          Button(
                              text: "Aggiungi comando",
                              action: () => handleAdd(context))
                        ]))
              ]),
            ),
          ]);
        })));
  }
}

_launchApp(command) async {
  var shell = Shell();
  shell.run(command);
}
