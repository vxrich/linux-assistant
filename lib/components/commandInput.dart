import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tutorial/bloc/commands_bloc.dart';
import 'package:flutter_tutorial/components/button.dart';
import 'package:flutter_tutorial/models/commands.dart';
import 'package:flutter_tutorial/components/textInput.dart';

import '../bloc/commands_event.dart';

class CommandInput extends StatelessWidget {
  CommandInput({super.key});

  String _commandText = "";
  String _commandInstruction = "";

  void handleAdd(context) {
    if (_commandText != "" && _commandInstruction != "") {
      BlocProvider.of<CommandsBloc>(context).add(AddCommand(
          Command(text: _commandText, command: _commandInstruction)));
      resetFields();
    }
  }

  void resetFields() {
    _commandText = "";
    _commandInstruction = "";

    controllers[0].clear();
    controllers[1].clear();
  }

  List<TextEditingController> controllers =
      List.generate(2, (i) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextInput(
              controller: controllers[0],
              margin: const EdgeInsets.only(right: 5),
              // value: _commandText,
              placeholder: "Command name",
              onChange: (text) {
                _commandText = text;
              }),
          TextInput(
              controller: controllers[1],
              margin: const EdgeInsets.only(right: 5),
              // value: _commandInstruction,
              placeholder: "Command instruction",
              onChange: (text) {
                _commandInstruction = text;
              }),
          Button(text: "Add command", action: () => handleAdd(context))
        ]);
  }
}
