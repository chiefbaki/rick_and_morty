import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/utils/constants/consts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs extends ChangeNotifier {
  late String name = "name";
  late String lastName = "name";
  late String middleName = "name";
  late String email = "name";
  late String password = "name";

  SharedPrefs(){
    getData();
  }

  Future<void> initPrefs({required String key, required String value}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
    
  }

  Future<void> getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString(AppKeys.name) ?? "";
    lastName = prefs.getString(AppKeys.lastName) ?? "";
    middleName = prefs.getString(AppKeys.middleName) ?? "";
    email = prefs.getString(AppKeys.email) ?? "";
    password = prefs.getString(AppKeys.password) ?? "";
    notifyListeners();
  }
}
