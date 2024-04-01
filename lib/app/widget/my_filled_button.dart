import 'package:flutter/material.dart';

class MyFilledButton extends StatelessWidget {
  const MyFilledButton({super.key, required this.onPressed, required this.child, required this.height, required this.width});
 final VoidCallback onPressed;
 final Widget child;
 final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return  FilledButton(
      style: FilledButton.styleFrom(
        minimumSize: Size(width, height)
      ),
      onPressed:  onPressed, child: child,);
  }
}
