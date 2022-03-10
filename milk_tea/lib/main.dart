import 'package:flutter/material.dart';
import 'package:milk_tea/constant/route.dart';
import 'package:milk_tea/screen/index.dart';
import 'package:milk_tea/screen/intro.dart';
import 'package:milk_tea/screen/loading.dart';
import 'package:milk_tea/screen/login.dart';
import 'package:milk_tea/screen/signin.dart';
import 'package:milk_tea/screen/signup.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: Routes().index,
    routes: {
      Routes().loading: (context) => Loading(),
      Routes().intro: (context) => Intro(),
      Routes().login: (context) => Login(),
      Routes().signin: (context) => SignIn(),
      Routes().signup: (context) => SignUp(),
      Routes().index: (context) => Index(),
    },
  ));
}