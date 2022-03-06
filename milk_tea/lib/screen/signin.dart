import 'package:flutter/material.dart';
import 'package:milk_tea/component/button.dart';
import 'package:milk_tea/pattern/custom-color.dart';

class SignIn extends StatefulWidget {
  const SignIn({ Key? key }) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Button(10, 10, 'Đăng Nhập', CustomColor(4, 118, 78, 1), () => print("Click Me"))
        ],
      )
    );
  }
}