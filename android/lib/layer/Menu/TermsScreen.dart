import 'package:flutter/material.dart';
import '../../layer/Menu/InfoScreen.dart';

import '../feature/AnimatedSectionTile.dart';

class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return InfoScreen(
      title: 'Terms & Conditions',
      children:  [
        AnimatedSectionTile(
          index: 0,
          icon: Icons.verified_user,
          title: 'Acceptance of Terms',
          content:
          'By accessing or using this application, you confirm that you have read, understood, and agreed to these terms and conditions.',
        ),
        AnimatedSectionTile(
          index: 1,
          icon: Icons.person,
          title: 'User Responsibilities',
          content:
          'You agree to use the application lawfully and responsibly. Any attempt to misuse or gain unauthorized access is strictly prohibited.',
        ),
        AnimatedSectionTile(
          index: 2,
          icon: Icons.copyright,
          title: 'Content Ownership',
          content:
          'All content including text, graphics, logos, and intellectual property belong exclusively to the service provider.',
        ),
        AnimatedSectionTile(
          index: 3,
          icon: Icons.build_circle,
          title: 'Service Availability',
          content:
          'We reserve the right to modify, suspend, or discontinue any service or feature without prior notice.',
        ),
        AnimatedSectionTile(
          index: 4,
          icon: Icons.report_problem,
          title: 'Limitation of Liability',
          content:
          'We shall not be liable for any indirect or consequential damages arising from the use of this application.',
        ),
      ],
    );
  }
}
