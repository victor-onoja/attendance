import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  final String labelText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const FormInput(
      {Key? key,
      required this.labelText,
      required this.validator,
      this.controller})
      : super(key: key);

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
      validator: validator,
      controller: controller,
    );
  }
}
