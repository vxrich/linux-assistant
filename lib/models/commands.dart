import 'dart:convert';

import 'package:equatable/equatable.dart';

class Command extends Equatable {
  final String text;
  final String command;

  const Command({required this.text, required this.command});

  @override
  List<Object?> get props => [text, command];

  static List<Command> commands = [];

  Map<String, dynamic> toJson() {
    return {"text": text, "command": command};
  }

  Command fromJson(String json) {
    return Command(text: text, command: command);
  }
}
