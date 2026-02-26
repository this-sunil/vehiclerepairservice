import 'dart:math';
import 'package:flutter/material.dart';
import 'package:vehicle_repair_service/Widget/CustomHelper.dart';
class RotateAnimation extends StatefulWidget {
  const RotateAnimation({super.key});

  @override
  State<RotateAnimation> createState() => _RotateAnimationState();
}

class _RotateAnimationState extends State<RotateAnimation>
    with SingleTickerProviderStateMixin,CustomHelperMixin {

  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat(reverse: true);
    _animation=Tween<double>(begin: 0,end: 2*pi).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animation,
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          shape: .circle,
          image: DecorationImage(image: AssetImage(logoIcon))
        ),
      ),
    );
  }
}
