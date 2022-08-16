import 'package:flutter/material.dart';

class FormInput extends StatefulWidget {
  final String labelText;
  final Function onSaved;

  FormInput({
    required this.labelText,
    required this.onSaved,
  });

  @override
  State<FormInput> createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
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
        labelText: widget.labelText,
        labelStyle: const TextStyle(color: Color(0xffBDB4BF)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return '${widget.labelText} is required';
        }
        return null;
      },
      onSaved: widget.onSaved as void Function(String?)?,
    );
  }
}
