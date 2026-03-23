import 'package:flutter/material.dart';
import 'package:vehicle_repair_service/layer/Widget/TranslateText.dart';

class InfoScreen extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const InfoScreen({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TranslateText(title,style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }
}
