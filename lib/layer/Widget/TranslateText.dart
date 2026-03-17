import '../../layer/Widget/Storage.dart';
import 'package:flutter/material.dart';
//import 'package:google_mlkit_translation/google_mlkit_translation.dart';

class TranslateText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final String? translateText;

  //late final Stream<String> _future;

  TranslateText(this.text,{super.key,
     this.translateText,
    this.style,
    this.textAlign,
  }) {
    //_future = _translate();
    //log("message=>Translate ");
  }

  // Stream<String> _translate() async* {
  //   final modelManager = OnDeviceTranslatorModelManager();
  //
  //   final code = await Storage.instance.getLanguage();
  //
  //
  //   final targetLanguage = TranslateLanguage.values.firstWhere(
  //         (e) => e.bcpCode == code,
  //     orElse: () => TranslateLanguage.english,
  //   );
  //
  //   final translator = OnDeviceTranslator(
  //     sourceLanguage: TranslateLanguage.english,
  //     targetLanguage: targetLanguage,
  //   );
  //
  //   try {
  //     final model = targetLanguage.bcpCode;
  //     //log("message=>$model");
  //     if (!await modelManager.isModelDownloaded(model)) {
  //       await modelManager.downloadModel(model);
  //     }
  //     yield await translator.translateText(text);
  //   } finally {
  //     translator.close();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: textAlign,
    );

    // return StreamBuilder<String>(
    //   stream: _future,
    //   initialData: translateText,
    //   builder: (context, snapshot) {
    //     if(snapshot.connectionState==ConnectionState.waiting){
    //       return Text(text, style: style, textAlign: textAlign);
    //     }
    //     else if (snapshot.hasError) {
    //       return Text(text, style: style, textAlign: textAlign);
    //     }
    //     return Text(
    //       snapshot.data ?? text,
    //       style: style,
    //       textAlign: textAlign,
    //     );
    //   },
    // );
  }
}

