import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class Command extends Equatable {
  final String text;
  final String command;

  const Command({required this.text, required this.command});

  @override
  List<Object?> get props => [text, command];

  static List<Command> commands = [];
}
