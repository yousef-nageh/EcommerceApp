import 'package:flutter/material.dart';


class FadeAnimation extends StatefulWidget {
  const FadeAnimation({
    super.key, required this.child,

  });
final Widget child;

  @override
  State<FadeAnimation> createState() => _FadeAnimationState();
}

class _FadeAnimationState extends State<FadeAnimation>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 900));
    animation = Tween<double>(begin: 0.2, end: 1).animate(animationController);
    animationController.repeat(reverse: true);
  }
@override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child:  widget.child,
    );
  }
}
