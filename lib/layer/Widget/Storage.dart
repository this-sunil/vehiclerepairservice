import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage {
  Storage._();
  static Storage get instance => Storage._();

  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  Future<void> setToken(String value) async {
    await secureStorage.write(key: 'token', value: value);
  }

  Future<String?> getToken() async {
    return secureStorage.read(key: 'token');
  }

  Future<void> setUId(String value) async {
    await secureStorage.write(key: 'key', value: value);
  }

  Future<String?> getUID() async {
    return secureStorage.read(key: 'key');
  }

  Future<void> setLanguage(String value) async {
    await secureStorage.write(key: 'language', value: value);
  }

  Future<String?> getLanguage() async {
    return secureStorage.read(key: 'language');
  }

  Future<void> resetToken() async {
    await secureStorage.deleteAll();
  }
}
