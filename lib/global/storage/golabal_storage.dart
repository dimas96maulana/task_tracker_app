import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../menu/login/model/single_get_login_model.dart';

class Storage {
  static SharedPreferences? prefs;
  static SingleGetLoginModel? singleGetLoginModel;
  static bool? isLogin;

  static Future getDataStorage() async {
    prefs = await SharedPreferences.getInstance();

    isLogin = prefs!.getBool("isLogin");
    String? jsonString = prefs!.getString("singleGetLoginModel");
    singleGetLoginModel = (jsonString == "" || jsonString == null)
      ? null
      : SingleGetLoginModel.fromJson(jsonDecode(jsonString));
  }

  static Future setDataStorage({required bool isLogin, required String modelEncode}) async {
    prefs = await SharedPreferences.getInstance();

    prefs!.setBool("isLogin", isLogin);
    prefs!.setString("singleGetLoginModel", modelEncode);

    getDataStorage();
  }

  static Future logout() async {
    prefs = await SharedPreferences.getInstance();

    prefs!.setBool("isLogin", false);
    prefs!.setString("singleGetLoginModel", "");

    getDataStorage();
  } 
}