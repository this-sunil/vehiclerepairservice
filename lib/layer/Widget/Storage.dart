import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage {
  Storage._();
  static Storage get instance=>Storage._();

  final secureStorage=FlutterSecureStorage();

  Future<void> setToken(String value) async{
    secureStorage.write(key:"token", value:value);
  }

  Future<String?> getToken() async{
    String? token=await secureStorage.read(key:"token");
    return token;
  }

  Future<void> setUId(String value) async{
    secureStorage.write(key:"key", value:value);
  }
  Future<String?> getUID() async{
    String? uid=await secureStorage.read(key:"key");
    return uid;
  }

  Future<void> setLanguage(String value) async{
    secureStorage.write(key:"language", value:value);
  }

  Future<String?> getLanguage() async{
    String? uid=await secureStorage.read(key:"language");
    return uid;
  }

  Future<void> resetToken() async{
    secureStorage.deleteAll();
  }

}