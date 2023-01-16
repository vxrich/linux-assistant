import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function action;
  final Function? longPressAction;
  final String text;
  final EdgeInsets? margin;

  const Button(
      {super.key,
      required this.text,
      required this.action,
      this.longPressAction,
      this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin,
        child: ElevatedButton(
          onPressed: () => action(),
          onLongPress: () => longPressAction!(),
          style: ElevatedButton.styleFrom(
            elevation: 3,
            // shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(32.0)),
            minimumSize: const Size(250, 40), //////// HERE
          ),
          child: Text(text),
        ));
  }
}
