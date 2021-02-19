import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_marketplace_service/models/login_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class UserProvider extends ChangeNotifier {
  Future<LoginResponseModel> getUser() async {
    final SharedPreferences prefs = await _prefs;
    final string = prefs.getString('tokenData');

    if (string != null)
      return LoginResponseModel.fromJson(string);
    else
      return null;
  }
}
