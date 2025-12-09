import 'dart:convert';

import '../common/storage.dart';
import '../model/user_model.dart';

class UserService {
  static Future<void> setInfo(UserModel user) async {
    await Storage.setString("user_info", jsonEncode(user.toJson()));
  }

  static Future<UserModel?> getInfo() async {
    var userJson = await Storage.getString("user_info");
    if (userJson == "") {
      return null;
    }
    return UserModel.fromJson(jsonDecode(userJson));
  }

  static Future<void> removeInfo() async {
    await Storage.remove("user_info");
  }
}
