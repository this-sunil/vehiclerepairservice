import 'package:flutter/material.dart';
import '../../layer/Menu/InfoScreen.dart';
import '../feature/AnimatedHeader.dart';
import '../feature/AnimatedSectionTile.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return InfoScreen(
      title: 'About Us',
      children: [
        AnimatedHeader(isDark: isDark),
        const SizedBox(height: 28),

        const AnimatedSectionTile(
          index: 0,
          icon: Icons.groups,
          title: 'Who We Are',
          content:
          'We are dedicated to building high-quality digital solutions that improve user experience and reliability.',
        ),
        const AnimatedSectionTile(
          index: 1,
          icon: Icons.flag,
          title: 'Our Mission',
          content:
          'To deliver secure, reliable, and user-friendly applications that add real value to users.',
        ),
        const AnimatedSectionTile(
          index: 2,
          icon: Icons.support_agent,
          title: 'Contact Us',
          content:
          'Email: support@vehiclerepair.com \n Website: www.vehicle-repair-service.com',
        ),
      ],
    );
  }
}
