import 'package:milk_tea/models/user.model.dart';

class UserMapping {
  Map<dynamic, dynamic> MapServiceSignUp(UserModel model){
    var data = {
      'username': model.username,
      'password': model.password
    };
    return data;
  }

  Map<dynamic, dynamic> MapServiceSignIn(UserModel model){
    var data = {
      'username': model.username,
      'password': model.password
    };
    return data;
  }
}