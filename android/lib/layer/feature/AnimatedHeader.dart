import 'package:flutter/material.dart';

import '../../core/Routes/route.dart';
import '../Widget/CustomHelper.dart';


class AnimatedHeader extends StatefulWidget {
  final bool isDark;
  const AnimatedHeader({super.key, required this.isDark});

  @override
  State<AnimatedHeader> createState() => AnimatedHeaderState();
}

class AnimatedHeaderState extends State<AnimatedHeader>
    with SingleTickerProviderStateMixin,CustomHelperMixin{
  late final AnimationController _controller;
  late final Animation<double> _fade;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _fade = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _scale = Tween<double>(begin: 0.92, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutBack,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fade,
      child: ScaleTransition(
        scale: _scale,
        child: Center(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: widget.isDark
                          ? Colors.black54
                          : Colors.black.withOpacity(0.15),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: customImage(
                  path: logoIcon,
                  width: 140,
                  height: 140,
                ),
              ),
              const SizedBox(height: 14),
              Text(
                AppRoute.appName,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Version 1.0.0',
                style: TextStyle(
                  color: widget.isDark ? Colors.white60 : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
