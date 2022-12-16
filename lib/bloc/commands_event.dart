import 'package:equatable/equatable.dart';
import 'package:flutter_tutorial/models/commands.dart';

abstract class CommandsEvent extends Equatable {
  const CommandsEvent();

  @override
  List<Object> get props => [];
}

class LoadCommands extends CommandsEvent {}

class AddCommand extends CommandsEvent {
  final Command command;

  const AddCommand(this.command);
}

class RemoveCommand extends CommandsEvent {
  final Command command;

  const RemoveCommand(this.command);
}
