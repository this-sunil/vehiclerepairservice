import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:vehicle_repair_service/layer/Widget/TranslateText.dart';

class ScanQRCode extends StatefulWidget {
  const ScanQRCode({super.key});

  @override
  State<ScanQRCode> createState() => _ScanQRCodeState();
}

class _ScanQRCodeState extends State<ScanQRCode> {
  late MobileScannerController _controller;
  @override
  void initState() {
    // TODO: implement initState
    _controller=MobileScannerController(autoZoom: true,lensType: CameraLensType.zoom,torchEnabled: true);
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TranslateText("Scan QR Code"),
      ),
      body: MobileScanner(
        controller: _controller,
         onDetect: (result){
          log('Barcode => ${result.barcodes.first.rawValue}');
         },
      ),
    );
  }
}
