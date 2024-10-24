import 'package:shared_preferences/shared_preferences.dart';

import 'cache_consumer.dart';
//CacheHelper That's Connect and Talk to local database.

class CacheHelper extends CacheConsumer {
  final SharedPreferences sharedPreferences;

  //Here The Initialize of cache .

  CacheHelper(this.sharedPreferences);


// this fun to put data in local data base using key
  @override
  Future<bool> saveData({required String key, required dynamic value}) async {
    if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    }
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    }

    if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else {
      return await sharedPreferences.setDouble(key, value);
    }
  }

  // this fun to get data already saved in local data base

  @override
  dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

// remove data using specific key

  @override
  Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }

  Future<bool> containsKey({required String key}) async {
    return sharedPreferences.containsKey(key);
  }

  //clear all data in the local data base
  @override
  Future<bool> clearData() async {
    return await sharedPreferences.clear();
  }

  // this fun to put data in local data base using key
  @override
  Future<dynamic> put({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else {
      return await sharedPreferences.setInt(key, value);
    }
  }
}
