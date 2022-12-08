part of 'commands_bloc.dart';

abstract class CommandsState extends Equatable {
  const CommandsState();

  @override
  List<Object> get props => [];
}

class CommandsInitial extends CommandsState {}

class CommandsLoaded extends CommandsState {
  final List<Command> commands;

  const CommandsLoaded({required this.commands});

  @override
  List<Object> get props => [commands];
}
