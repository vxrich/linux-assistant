import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Expanded(
        child: TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Nome comando',
        isDense: true,
        contentPadding: EdgeInsets.all(10),
      ),
    ));
  }
}
