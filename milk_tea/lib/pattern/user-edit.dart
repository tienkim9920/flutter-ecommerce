import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class UserEdit {
  String? userId;
  TextEditingController fullname = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  ImagePicker image = ImagePicker();
  String? avatar;
  File? avatarTemp;
}

class UserPassword {
  String? userId;
  TextEditingController password = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
}
