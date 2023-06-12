import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

/// 本地存储
class SpUtil {
  static final SpUtil _instance = SpUtil._();
  factory SpUtil() => _instance;
  static SharedPreferences? _prefs;

  SpUtil._();

  static Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  Future<bool>? setJSON(String key, dynamic jsonVal) {
    String jsonString = jsonEncode(jsonVal);
    return _prefs?.setString(key, jsonString);
  }

  dynamic getJSON(String key) {
    String? jsonString = _prefs?.getString(key);
    return jsonString == null ? null : jsonDecode(jsonString);
  }

  Future<bool>? setBool(String key, bool val) {
    return _prefs?.setBool(key, val);
  }

  bool getBool(String key) {
    bool? val = _prefs?.getBool(key);
    return val ?? false;
  }

  Future<bool>? setString(String key,String val){
    return _prefs?.setString(key, val);
  }

  String? getString(String key){
    return _prefs?.getString(key);
  }

  Future<bool>? remove(String key) {
    return _prefs?.remove(key);
  }
}