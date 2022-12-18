import 'dart:convert';

import 'package:flutter_tutorial/models/commands.dart';

class CommandsState {
  CommandsState({required this.commands});

  final List<Command> commands;

// 1) add toJson method
  Map<String, dynamic> toJson() => {
        'commands': commands.map((e) => jsonEncode(e)).toList(),
      };

// 2) add fromJson factory
  factory CommandsState.fromJson(Map<String, dynamic> jsonData) {
    List<Command> commands = [];

    jsonData['commands'].forEach((e) {
      final decoded = json.decode(e);

      commands.add(Command(text: decoded["text"], command: decoded["command"]));
    });

    return CommandsState(commands: commands);
  }

// 3) add an initial state factory
  factory CommandsState.initial() => CommandsState(
        commands: [],
      );
}
