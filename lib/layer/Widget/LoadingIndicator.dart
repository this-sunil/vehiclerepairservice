import 'package:flutter/material.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';

import 'RotateAnimation.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 50,
        height: 50,
        child: RippleAnimation(
            color: Colors.red,

            maxRadius: 80,
            child: RotateAnimation()),
      ),

    );
  }
}
