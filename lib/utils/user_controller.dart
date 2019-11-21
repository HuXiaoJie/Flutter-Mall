import 'dart:convert';
import 'dart:math';

import 'package:mall/http/entity/user_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController {
  static String SHAREPREFERENCES_USER_INFO_NAME = "user_info";

  static UserEntity mUserEntity;

  static saveUserInfo(UserEntity entity) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(SHAREPREFERENCES_USER_INFO_NAME, json.encode(entity));
  }

//  static Future<String> getUserInfo() async {
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    return prefs.getString(SHAREPREFERENCES_USER_INFO_NAME);
//  }

  static Future<UserEntity> getUserEntity() async {
    if (mUserEntity == null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var data = prefs.getString(SHAREPREFERENCES_USER_INFO_NAME);
      if (data == null) {
        return null;
      }
      UserEntity entity = UserEntity.fromJson(jsonDecode(data));
      mUserEntity = entity;
      return entity;
    } else {
      return mUserEntity;
    }
  }

  static Future<String> getUserUID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = prefs.getString(SHAREPREFERENCES_USER_INFO_NAME);
    UserEntity entity = UserEntity.fromJson(jsonDecode(data));
    return entity.uid;
  }
}
