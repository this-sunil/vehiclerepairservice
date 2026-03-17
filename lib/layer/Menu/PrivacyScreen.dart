import 'package:flutter/material.dart';
import '../feature/AnimatedSectionTile.dart';
import 'InfoScreen.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return InfoScreen(
      title: 'Privacy Policy',
      children: const [
        AnimatedSectionTile(
          index: 0,
          icon: Icons.security,
          title: 'Your Privacy Matters',
          content:
          'We respect your privacy and are committed to protecting your personal information.',
        ),
        AnimatedSectionTile(
          index: 1,
          icon: Icons.data_usage,
          title: 'Information We Collect',
          content:
          'We may collect basic details such as name, email, device information, and usage data to improve our services.',
        ),
        AnimatedSectionTile(
          index: 2,
          icon: Icons.lock,
          title: 'Data Protection',
          content:
          'Your data is securely stored and protected using industry-standard security practices.',
        ),
        AnimatedSectionTile(
          index: 3,
          icon: Icons.share,
          title: 'Third-Party Sharing',
          content:
          'We do not sell or share your personal data with third parties without your consent.',
        ),
        AnimatedSectionTile(
          index: 4,
          icon: Icons.update,
          title: 'Policy Updates',
          content:
          'This privacy policy may be updated periodically. Please review it regularly.',
        ),
      ],
    );
  }
}
