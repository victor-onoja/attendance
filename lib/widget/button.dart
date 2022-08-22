import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color? color;

  Button({required this.text, required this.onPressed, this.color});

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
          onPressed: onPressed as void Function(),
          child: Text(
            text,
            style: const TextStyle(fontSize: 16, color: Color(0xffE6E49F)),
          )),
    );
  }
}
