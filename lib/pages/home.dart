import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tutorial/bloc/commands_bloc.dart';
import 'package:flutter_tutorial/models/commands.dart';
import 'package:process_run/shell.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child:
        BlocBuilder<CommandsBloc, CommandsState>(builder: (context, state) {
      return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Column(children: [
          ...List.generate(
              programs.length, // Length of the list
              (index) => Button(
                  action: () => _launchApp(programs[index]["command"]),
                  text: programs[index]["text"] as String)),
          ...List.generate(
              state.commands.length, // Length of the list
              (index) => Button(
                  action: () => _launchApp(state.commands[index].command),
                  text: state.commands[index].text)),
          Button(
              action: () => {
                    setState(() {
                      // state.commands.commands = [
                      //   ...state.commands.commands,
                      //   {
                      //     "button": "Prova",
                      //     "command": "google-chrome https://instagram.com"
                      //   }
                      // ];
                      BlocProvider.of<CommandsBloc>(context).add(
                          const AddCommand(Command(
                              text: "Prova",
                              command: "google-chrome https://instagram.com")));
                    })
                  },
              text: "+")
        ]),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a search term',
              ),
            ),
          ),
        ),
      ]);
    })));
  }
}

_launchApp(command) async {
  var shell = Shell();
  shell.run(command);
}
