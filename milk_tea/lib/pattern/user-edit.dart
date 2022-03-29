import 'package:flutter/cupertino.dart';

class UserEdit {
  String? userId;
  TextEditingController fullname = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
}

class UserPassword {
  String? userId;
  TextEditingController password = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
}
