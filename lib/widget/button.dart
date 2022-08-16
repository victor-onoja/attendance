import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final String text;
  final Function onPressed;
  final Color? color;

  Button({required this.text, required this.onPressed, this.color});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
          style: TextButton.styleFrom(
              padding: const EdgeInsets.all(16),
              elevation: 8,
              backgroundColor: const Color(0xff92140C),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)))),
          onPressed: widget.onPressed as void Function(),
          child: Text(
            widget.text,
            style: const TextStyle(fontSize: 16, color: Color(0xffE6E49F)),
          )),
    );
  }
}
