import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../models/commands.dart';

part 'commands_event.dart';
part 'commands_state.dart';

class CommandsBloc extends HydratedBloc<CommandsEvent, CommandsState> {
  CommandsBloc() : super(CommandsState.initial()) {
    // on<LoadCommands>((event, emit) async {
    //   await Future<void>.delayed(const Duration(seconds: 1));
    //   emit(const CommandsLoaded(commands: <Command>[]));
    // });
    on<AddCommand>((event, emit) {
      emit(CommandsState(
          commands: List.from(state.commands)..add(event.command)));
    });
    // on<RemoveCommand>((event, emit) {
    //   emit(List.from(state)..remove(event.command));
    // });
  }

  @override
  CommandsState fromJson(Map<String, dynamic> json) =>
      json['value'] as CommandsState;

  @override
  Map<String, dynamic> toJson(CommandsState state) => {"value": state};
}
