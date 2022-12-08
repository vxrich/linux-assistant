part of 'commands_bloc.dart';

abstract class CommandsEvent extends Equatable {
  const CommandsEvent();

  @override
  List<Object> get props => [];
}

class LoadCommands extends CommandsEvent {}

class AddCommand extends CommandsEvent {
  final Command command;

  const AddCommand(this.command);

  @override
  List<Object> get props => [];
}

class RemoveCommand extends CommandsEvent {
  final Command command;

  const RemoveCommand(this.command);

  @override
  List<Object> get props => [];
}
