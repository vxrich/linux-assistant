import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:process_run/shell.dart';

import '../button.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, String>> addedScripts = [];

  final List<Map<String, String>> programs = const [
    {"button": "Open terminal", "command": "gnome-terminal"},
    {"button": "Open Chrome", "command": "google-chrome"},
    {"button": "Open Chrome Incognito", "command": "google-chrome --incognito"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(children: [
      Column(children: [
        ...List.generate(
            programs.length, // Length of the list
            (index) => Button(
                action: () => _launchApp(programs[index]["command"]),
                text: programs[index]["button"] as String)),
        ...List.generate(
            addedScripts.length, // Length of the list
            (index) => Button(
                action: () => _launchApp(addedScripts[index]["command"]),
                text: addedScripts[index]["button"] as String)),
        Button(
            action: () => {
                  setState(() {
                    print("data");
                    addedScripts = [
                      ...addedScripts,
                      {
                        "button": "Prova",
                        "command": "google-chrome https://instagram.com"
                      }
                    ];
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
    ]));
  }
}

_launchApp(command) async {
  var shell = Shell();
}
