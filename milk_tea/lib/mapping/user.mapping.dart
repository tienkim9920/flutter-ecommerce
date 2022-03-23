import 'dart:convert';

import 'package:milk_tea/models-interface/user.interface.dart';
import 'package:milk_tea/models/user.model.dart';
import 'package:milk_tea/pattern/user-login.dart';

class UserMapping {
  dynamic MapServiceSignUp(UserModel model) {
    UserInterface user = UserInterface();
    user.fullname = model.fullname.text;
    user.email = model.email.text;
    user.username = model.username.text;
    user.password = model.password.text;
    user.address = model.address;
    user.image = model.image;
    user.score = '0';
    user.permissionId = '2';

    return json.encode(user.toJson());
  }

  dynamic MapServiceSignIn(UserLogin model) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = model.username.text;
    data['password'] = model.password.text;

    return json.encode(data);
  }
}
