import 'package:flutter/material.dart';
import 'package:milk_tea/component/button.dart';
import 'package:milk_tea/component/input-password.dart';
import 'package:milk_tea/component/input.dart';
import 'package:milk_tea/pattern/custom-color.dart';

class SignIn extends StatefulWidget {
  const SignIn({ Key? key }) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  TextEditingController inputUsername = TextEditingController();
  TextEditingController inputPassword = TextEditingController();
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Button(10, 10, 'Đăng Nhập', CustomColor(), () => print("Click Me")),
          Input(inputUsername, "Tên đăng nhập"),
          InputPassword(inputPassword, "Mật khẩu", isPassword, () => {
            setState(() => isPassword = !isPassword)
          }),
        ],
      )
    );
  }
}