import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cach_helper {
  static SharedPreferences? sharedpref;

  static initstate() async {
    sharedpref = await SharedPreferences.getInstance();
  }

  static Future<bool?> saveData({
    @required key,
    @required value,
  }) async {
    if (value is String) return await sharedpref?.setString(key, value);
    if (value is int) return await sharedpref?.setInt(key, value);
    if (value is bool)
      return await sharedpref?.setBool(key, value);
    else
      return await sharedpref?.setDouble(key, value);
  }

  static Future<dynamic> getData({@required key}) async {
    return sharedpref?.get(key!);
  }

  static Future<bool?> removeData({@required key}) async {
    return await sharedpref?.remove(key!);
  }
}
