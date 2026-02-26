import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  Storage._();
  static Storage get instance=>Storage._();

  Future<void> setToken(String value) async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    pref.setString("token", value);
  }

  Future<String?> getToken() async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    String? token=pref.getString("token");
    return token;
  }

  Future<void> setUId(String value) async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    pref.setString("key", value);
  }
  Future<String?> getUID() async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    String? uid=pref.getString("key");
    return uid;
  }

  Future<void> setLanguage(String value) async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    pref.setString("language", value);
  }

  Future<String?> getLanguage() async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    String? uid=pref.getString("language");
    return uid;
  }

  Future<void> resetToken() async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    pref.clear();
  }
}