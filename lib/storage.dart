import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum StorageTypes { string, int, double, bool, list, map }

class Storage {
  static Future readList(String key) async {
    final SharedPreferences shared = await SharedPreferences.getInstance();

    List<String> valuesString = shared.getStringList(key) ?? [];
    List<Map> values = [];
    if (valuesString.isNotEmpty) {
      for (var element in valuesString) {
        values.add(json.decode(element));
      }
    }
    return values;
  }

  static Future read(String key, [bool convertMapList = true]) async {
    final SharedPreferences shared = await SharedPreferences.getInstance();
    var result = shared.get(key);
    if (result is List && convertMapList) {
      //try convert items in map
      try {
        List currentList = result;
        List finalList = [];

        for (String item in currentList) {
          finalList.add(jsonDecode(item));
        }

        return finalList;
      } catch (e) {
        debugPrint("!!>> Erro on convert Map list, return default");
        return result;
      }
    } else {
      return result;
    }
  }

  static Future<bool> write(StorageTypes type, String key, value) async {
    final SharedPreferences shared = await SharedPreferences.getInstance();
    bool sucess = false;
    switch (type) {
      case StorageTypes.string:
        await shared
            .setString(key, value ?? "")
            .then((result) => sucess = result);
        return sucess;

      case StorageTypes.int:
        await shared.setInt(key, value).then((result) => sucess = result);
        return sucess;

      case StorageTypes.double:
        await shared.setDouble(key, value).then((result) => sucess = result);
        return sucess;

      case StorageTypes.bool:
        await shared.setBool(key, value).then((result) => sucess = result);
        return sucess;

      case StorageTypes.list:
        List<String> valuesString = [];
        value.forEach((element) {
          valuesString.add(json.encode(element));
        });
        await shared
            .setStringList(key, valuesString)
            .then((result) => sucess = result);
        return sucess;

      case StorageTypes.map:
        return sucess;
    }
  }

  static remove(key) async {
    final SharedPreferences shared = await SharedPreferences.getInstance();

    await shared.remove(key);
  }
}
