import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Widget/TranslateText.dart';

class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({super.key});

  Future<void> _callNumber(String number) async {
    log("message");
    final Uri launchUri = Uri(scheme: 'tel', path: number);
    if(await canLaunchUrl(launchUri)){
      await launchUrl(launchUri,mode: LaunchMode.inAppWebView);
    }
    else{
      log("Something Went Wrong !!!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: TranslateText("Emergency Contacts")),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              leading: Icon(Icons.local_police),
              title: TranslateText("Police (India)"),
              subtitle: TranslateText("100"),
              onTap: () => _callNumber("100"),
            ),
          ),
         Card(child:ListTile(
           leading: Icon(Icons.health_and_safety),
           title: TranslateText("Ambulance"),
           subtitle: TranslateText("102"),
           onTap: () => _callNumber("102"),
         )),
          Card(
            child: ListTile(
              leading: Icon(Icons.directions_boat_filled),
              title: TranslateText("Highway Helpline"),
              subtitle: TranslateText("1033"),
              onTap: () => _callNumber("1033"),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.build),
              title: TranslateText("Vehicle Towing (India)"),
              subtitle: TranslateText("+919289482828"),
              onTap: () => _callNumber("+919289482828"),
            ),
          ),
        ],
      ),
    );
  }
}
