import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({this.placeholderText, super.key});

  final String? placeholderText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: placeholderText,
      ),
    );
  }
}
