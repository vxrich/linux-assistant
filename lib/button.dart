import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function action;
  Function? longPressAction;
  final String text;

  Button({required this.text, required this.action, this.longPressAction});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10, left: 10, right: 5),
        child: ElevatedButton(
          onPressed: () => action(),
          onLongPress: () => longPressAction!(),
          child: Text(text),
          style: ElevatedButton.styleFrom(
            elevation: 3,
            // shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(32.0)),
            minimumSize: const Size(250, 40), //////// HERE
          ),
        ));
  }
}
