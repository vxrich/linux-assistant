import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String value;
  final String placeholder;
  final Function onChange;
  final EdgeInsets? margin;

  const TextInput(
      {super.key,
      this.value = "",
      required this.placeholder,
      required this.onChange,
      this.margin});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            margin: margin,
            child: TextField(
              // controller: TextEditingController()..text = value,
              onChanged: (String text) => onChange(text),
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: placeholder,
                isDense: true,
                contentPadding: const EdgeInsets.all(12),
              ),
            )));
  }
}
