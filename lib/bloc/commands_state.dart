part of 'commands_bloc.dart';

class CommandsState {
  const CommandsState({required this.commands});

  final List<Command> commands;

// 1) add toJson method
  Map<String, dynamic> toJson() => {
        'commands': commands.map((e) => e.toString()).toList(),
      };

// 2) add fromJson factory
  factory CommandsState.fromJson(Map<String, dynamic> json) =>
      CommandsState(commands: json['commands'].map<Command>((e) => e.toList()));
// 3) add an initial state factory
  factory CommandsState.initial() => const CommandsState(
        commands: [],
      );
}

// class CommandsInitial extends CommandsState {}

// class CommandsLoaded extends CommandsState {
//   final List<Command> commands;

//   const CommandsLoaded({required this.commands});

//   @override
//   List<Object> get props => commands;
// }
