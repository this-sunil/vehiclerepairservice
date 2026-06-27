import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:gscankit/gscankit.dart';

class ScanQrCode extends StatefulWidget {
  const ScanQrCode({super.key});

  @override
  State<ScanQrCode> createState() => _ScanQrCodeState();
}

class _ScanQrCodeState extends State<ScanQrCode> {
  late MobileScannerController scannerController;

  @override
  void initState() {
    // TODO: implement initState
    scannerController=MobileScannerController();
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    scannerController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Scan Qr Code",style: TextStyle(color: Colors.white)),
      ),
      body: GscanKit(
        controller: scannerController, // MobileScannerController instance
        onDetect: (BarcodeCapture capture) {
          // Handle scanned result
          log("message=>${capture.barcodes[0].url}");
        },
        floatingOption: [], // Add custom floating widgets if needed
        gscanOverlayConfig: GscanOverlayConfig(
          scannerScanArea: ScannerScanArea.center, // Focus scan area in center
          scannerBorder: ScannerBorder.visible, // Enable visible border
          scannerBorderPulseEffect: ScannerBorderPulseEffect.enabled, // Apple-style border pulse
          borderColor: Colors.white, // Customize border color
          borderRadius: 24.0, // Rounded border edges
          scannerLineAnimationColor: Colors.green, // Scanning line color
          scannerOverlayBackground: ScannerOverlayBackground.blur, // Blurred camera overlay
          scannerLineAnimation: ScannerLineAnimation.enabled, // Enable line animation
        ),
      ),
    );
  }
}
