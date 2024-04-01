import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  const MyTextButton({super.key, required this.onPressed, required this.text,this.color});
final VoidCallback onPressed;
final String text;
final Color? color;
  @override
  Widget build(BuildContext context) {
    return  TextButton(onPressed: onPressed,style: TextButton.styleFrom(
      foregroundColor: color,

    ), child: Text(text),);
  }
}
