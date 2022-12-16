import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../models/commands.dart';

import './commands_event.dart';
import './commands_state.dart';

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
    on<RemoveCommand>((event, emit) {
      emit(CommandsState(
          commands: List.from(state.commands)..remove(event.command)));
    });
  }

  @override
  CommandsState? fromJson(Map<String, dynamic> json) =>
      CommandsState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(CommandsState state) => state.toJson();
}
