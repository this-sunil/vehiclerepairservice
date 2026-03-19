import 'package:flutter/material.dart';

class ColorAnimation extends StatelessWidget {
  final Widget child;

  const ColorAnimation({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<Color?>(
      tween: ColorTween(
        begin: Colors.amber,
        end: Colors.deepPurple,
      ),
      duration: const Duration(seconds: 3),
      curve: Curves.easeInOut,
      onEnd: () {},
      builder: (context, color, _) {
        return child;
      },
    );
  }
}
