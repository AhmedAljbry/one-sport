/*
import 'package:shared_preferences/shared_preferences.dart';
class CachHelper
{
  static late SharedPreferences sharedpreferences;
  static init()async{
    sharedpreferences=await SharedPreferences.getInstance();
  }

*/
/* static Future<bool> setBool({
    required String key,
    required bool value,
})async
  {
    return await sharedpreferences.setBool(key, value);
  }*//*

  static Future<bool> savaDate({
    required String key,
    required dynamic value,
  }) async
  {
     if(value is bool ) return await sharedpreferences.setBool(key, value);
     if(value is int ) return await sharedpreferences.setInt(key, value);
     if(value is String )return await  sharedpreferences.setString(key, value);
     return await sharedpreferences.setDouble(key, value);
  }
  static dynamic getdate({
    required String key,
})
  {
    return sharedpreferences.get(key);
  }
 static Future<bool> removeDate({
    required String key,
})async
  {
    return await sharedpreferences.remove(key);
  }
}


*/
