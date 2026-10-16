import 'package:flutter/material.dart';

class TranslateText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final String? initialText;

  //static final Map<String, String> _translationCache = {};

  const TranslateText(
    this.text, {
    super.key,
    this.initialText,
    this.style,
    this.textAlign,
  });

  // Future<String> _translateText(String sourceText) async {
  //   if (sourceText.trim().isEmpty) return sourceText;
  //
  //   // Return cached translation if available
  //   final code = await Storage.instance.getLanguage();
  //   final cacheKey = '$code:$sourceText';
  //   if (_translationCache.containsKey(cacheKey)) {
  //     return _translationCache[cacheKey].toString();
  //   }
  //
  //   try {
  //     final targetLanguage = TranslateLanguage.values.firstWhere(
  //       (e) => e.bcpCode == code,
  //       orElse: () => TranslateLanguage.english,
  //     );
  //
  //     // Return original text if target is English
  //     if (targetLanguage == TranslateLanguage.english) {
  //       return sourceText;
  //     }
  //
  //     final modelManager = OnDeviceTranslatorModelManager();
  //     final model = targetLanguage.bcpCode;
  //
  //     if (!await modelManager.isModelDownloaded(model)) {
  //       final downloaded = await modelManager.downloadModel(model);
  //       if (!downloaded) return sourceText;
  //     }
  //
  //     final translator = OnDeviceTranslator(
  //       sourceLanguage: TranslateLanguage.english,
  //       targetLanguage: targetLanguage,
  //     );
  //
  //     final translated = await translator.translateText(sourceText);
  //     await translator.close();
  //
  //     // Store result in cache
  //     _translationCache[cacheKey] = translated;
  //     return translated;
  //   } catch (_) {
  //     return sourceText;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Text(text, style: style, textAlign: textAlign);
    // return FutureBuilder<String>(
    //   future: _translateText(text),
    //   initialData: initialText,
    //   builder: (context, snapshot) {
    //     final displayText = snapshot.data ?? text;
    //     return Text(displayText, style: style, textAlign: textAlign);
    //   },
    // );
  }
}
