import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage<T> {
  LocalStorage._();

  ///instance member
  static final instance = LocalStorage._();

  SharedPreferences? _sharedPreferences;

  ///Error Message
  final _message = 'Please initial class before use this Function.';

  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    debugPrint('Inited : $_sharedPreferences');
  }

  Future<bool> setStr({required String key, required String? value}) async {
    final result = await _sharedPreferences!.setString(key, value as String);
    return result;
  }

  Future<void> storeData({required String key, T? value}) async {
    if (_sharedPreferences != null) {
      final type = value.runtimeType;

      if (type is String) {
        await _sharedPreferences?.setString(key, value as String);
      }
      if (type is double) {
        await _sharedPreferences?.setDouble(key, value as double);
      }

      if (type is int) {
        await _sharedPreferences?.setInt(key, value as int);
      }
      if (type is bool) {
        await _sharedPreferences?.setBool(key, value as bool);
      }
    } else {
      throw _message;
    }
  }

  Future<String?> getString({required String key}) async {
    if (_sharedPreferences != null) {
      final value = _sharedPreferences?.getString('NAME');
      debugPrint(value);
      return value;
    } else {
      throw _message;
    }
  }
}
