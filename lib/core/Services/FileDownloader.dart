import 'dart:async';
import 'dart:io';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class FileDownloader {
  StreamSubscription? _subscription;

  Future<void> downloadFile(String url, String savePath,
      Function(double) onProgress, VoidCallback onComplete) async {

    final request = Request('GET', Uri.parse(url));
    final response = await request.send().timeout(const Duration(minutes: 30));

    if (response.statusCode == 200) {
      final file = File(savePath);
      final sink = file.openWrite();

      int totalBytes = response.contentLength ?? 0;
      int receivedBytes = 0;

      _subscription = response.stream.listen(
            (List<int> bytes) {
          receivedBytes += bytes.length;
          sink.add(bytes);

          if (totalBytes > 0) {
            onProgress((receivedBytes / totalBytes) * 100);
          }
        },
        onDone: () async {
          await sink.close();
          onComplete();
        },
        onError: (e) {
          sink.close();
          log("Error: $e");
        },
        cancelOnError: true,
      );
    }
  }

  void stopDownload(String filePath) async {
    _subscription?.cancel();
    final file = File(filePath);
    if (await file.exists()) {
      await file.delete();
    }
    log("Download stopped and file cleaned up.");
  }
}

