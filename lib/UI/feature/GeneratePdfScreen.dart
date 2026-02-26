import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import '../../Services/FileDownloader.dart';

class GeneratePdfScreen extends StatefulWidget {
  const GeneratePdfScreen({super.key});

  @override
  State<GeneratePdfScreen> createState() => _GeneratePdfScreenState();
}

class _GeneratePdfScreenState extends State<GeneratePdfScreen> {
  double _progress = 0;
  String? _localPath;
  bool _isDownloading = false;
  final downloader = FileDownloader();

  Future<void> startPdfDownload(String url) async {
    final directory = await getApplicationDocumentsDirectory();
    final String fileName = url.split('/').last; // Extracts filename
    final String filePath = "${directory.path}/$fileName";


    setState(() {
      _isDownloading = true;
      _progress = 0;
    });

    await downloader.downloadFile(
      url,
      filePath,
          (p) => setState((){
            _progress = p;
            log("Progress=>${_progress.toDouble()}");
          }),
          () {
        setState(() {
          _isDownloading = false;
          _localPath = filePath;
        });
        _openFile(_localPath.toString());
        print("PDF Saved to: $filePath");
      },
    );
  }
  void _openFile(String path) {
    OpenFilex.open(path);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            if (_isDownloading) ...[
              LinearProgressIndicator(value: _progress / 100),
              Text("${_progress.toStringAsFixed(0)}%"),
            ],

            if (!_isDownloading && _localPath != null)
              ElevatedButton(onPressed: (){
                _openFile(_localPath.toString());
              }, child: Text("Open File")),
            ElevatedButton(
                onPressed: _isDownloading ? null :()=> startPdfDownload("https://archive.org/download/tom_and_jerry_full_episodes/T%26J%2001%20-%20Puss%20Gets%20The%20Boot%20%281940%29.mp4"),
                child: Text("Download PDF")
            ),

           ElevatedButton(
              onPressed: () => downloader.stopDownload(_localPath.toString()),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: Text("Stop"),
            ),
          ],
        ),
      ),
    );
  }
}
