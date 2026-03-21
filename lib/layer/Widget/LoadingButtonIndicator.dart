import 'package:flutter/material.dart';

import 'TranslateText.dart';
class LoadingButtonIndicator extends StatelessWidget {
  const LoadingButtonIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        backgroundColor: Colors.indigo,
      ),
      onPressed: () {},
      icon: SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          color: Colors.white,
          strokeWidth: 2,
        ),
      ),
      label: TranslateText("Please Wait ...",style: TextStyle(color: Colors.white,fontWeight: .bold,fontSize: 16)),
    );
  }
}
