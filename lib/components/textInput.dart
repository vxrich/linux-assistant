import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String value;
  final String placeholder;
  final Function onChange;
  final EdgeInsets? margin;
  final TextEditingController? controller;

  const TextInput(
      {super.key,
      required this.placeholder,
      required this.onChange,
      this.value = "",
      this.margin,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            margin: margin,
            child: TextField(
              controller: controller,
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
