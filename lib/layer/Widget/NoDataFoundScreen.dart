import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vehicle_repair_service/layer/Widget/TranslateText.dart';

class NoDataFoundScreen extends StatelessWidget {
  final String message;
  final String buttonText;
  final VoidCallback? onRetry;

  const NoDataFoundScreen({
    super.key,
    this.message = "No Data Found",
    this.buttonText = "Retry",
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: .zero,
      padding: .zero,

      child: Column(
        mainAxisAlignment: .center,
        children: [
          const SizedBox(height: 30),
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.95, end: 1),
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeOut,
            builder: (context, scale, child) {
              return Transform.scale(scale: scale, child: child);
            },
            child: Container(
              margin: .zero,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: .topRight,
                 end: .bottomRight,
                  colors: [
                    Color(0xff754fe1),
                    Color(0xFFCF3D44)
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 30,
                    spreadRadius: 4,
                  ),
                ],
              ),
              child: Lottie.asset(
                'assets/icons/no_data.json',
                height: 200,
                repeat: true, // 🔁 auto repeat animation
              ),
            ),
          ),
          const SizedBox(height: 30),
          TranslateText(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 10),
          TranslateText(
            "We couldn't find anything here.\nTry refreshing or check again later.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, height: 1.5),
          ),
          const SizedBox(height: 35),
          if (onRetry != null)
            GestureDetector(
              onTap: onRetry,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xff6366f1), Color(0xff8b5cf6)],
                  ),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepPurple.withOpacity(0.35),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.refresh, color: Colors.white, size: 20),
                    SizedBox(width: 8),
                    TranslateText(
                      "Retry",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
