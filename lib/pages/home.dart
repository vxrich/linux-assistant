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
      if (state is CommandsInitial) {
        return const CircularProgressIndicator(color: Colors.orange);
      }
      if (state is CommandsLoaded) {
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
                        print("data");
                        // state.commands = [
                        //   ...state.commands,
                        //   {
                        //     "button": "Prova",
                        //     "command": "google-chrome https://instagram.com"
                        //   }
                        // ];
                        context.read<CommandsBloc>().add(const AddCommand(
                            Command(
                                text: "Prova",
                                command:
                                    "google-chrome https://instagram.com")));
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
      } else {
        return const Text("Something went wrong!");
      }
    })));
  }
}

_launchApp(command) async {
  var shell = Shell();
}
