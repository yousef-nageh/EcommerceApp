import 'package:flutter/material.dart';

class WaitingProgress extends StatelessWidget {
  const WaitingProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
