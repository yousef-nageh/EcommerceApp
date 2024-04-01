import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.onPressed, required this.text});
  final VoidCallback onPressed;
 final String text;

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(onPressed: onPressed, child: Text(text));
  }
}
