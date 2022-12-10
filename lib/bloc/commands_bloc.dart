import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../models/commands.dart';

part 'commands_event.dart';
part 'commands_state.dart';

class CommandsBloc extends HydratedBloc<CommandsEvent, List<Command>> {
  CommandsBloc() : super([]) {
    // on<LoadCommands>((event, emit) async {
    //   await Future<void>.delayed(const Duration(seconds: 1));
    //   emit(const CommandsLoaded(commands: <Command>[]));
    // });
    on<AddCommand>((event, emit) {
      final state = this.state as CommandsLoaded;
      emit(List.from(state.commands)..add(event.command));
    });
    on<RemoveCommand>((event, emit) {
      final state = this.state as CommandsLoaded;
      emit(List.from(state.commands)..remove(event.command));
    });
  }

  @override
  List<Command> fromJson(Map<String, dynamic> json) =>
      json['commands'] as List<Command>;

  @override
  Map<String, dynamic> toJson(List<Command> state) => {"commands": state};
}
