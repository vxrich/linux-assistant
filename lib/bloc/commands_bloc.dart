import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../models/commands.dart';

part 'commands_event.dart';
part 'commands_state.dart';

class CommandsBloc extends HydratedBloc<CommandsEvent, CommandsState> {
  CommandsBloc() : super(CommandsInitial()) {
    on<LoadCommands>((event, emit) async {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(const CommandsLoaded(commands: <Command>[]));
    });
    on<AddCommand>((event, emit) {
      if (state is CommandsLoaded) {
        final state = this.state as CommandsLoaded;
        emit(CommandsLoaded(
            commands: List.from(state.commands)..add(event.command)));
      }
    });
    on<RemoveCommand>((event, emit) {
      if (state is CommandsLoaded) {
        final state = this.state as CommandsLoaded;
        emit(CommandsLoaded(
            commands: List.from(state.commands)..remove(event.command)));
      }
    });
  }

  @override
  List<Command> fromJson(Map<String, dynamic> json) =>
      json['value'] as List<Command>;

  @override
  List<Command> toJson(int state) => {'value': state};
}
