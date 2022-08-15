import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  final String labelText;
  final Function onFieldSubmitted;

  FormInput({
    required this.labelText,
    required this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Color(0xffBDB4BF)),
      cursorColor: const Color(0xffBDB4BF),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffBE5A38)),
            borderRadius: BorderRadius.circular(16)),
        fillColor: const Color(0xffBE5A38),
        filled: true,
        labelText: labelText,
        labelStyle: const TextStyle(color: Color(0xffBDB4BF)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
      initialValue: 'goat',
      validator: (String? value) {
        if (value!.isEmpty) {
          return '$labelText is required';
        }
        return null;
      },
      onFieldSubmitted: onFieldSubmitted as void Function(String),
    );
  }
}
