import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:milk_tea/component/button-color.dart';
import 'package:milk_tea/component/button.dart';
import 'package:milk_tea/component/input-password.dart';
import 'package:milk_tea/component/input.dart';
import 'package:milk_tea/component/text-label.dart';
import 'package:milk_tea/constant/route.dart';
import 'package:milk_tea/pattern/custom-color.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

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
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logo_color.png', width: 50, height: 40),
              Text(
                'Ombee',
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.bold)),
              )
            ],
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: TextLabel(false, false, false, true, false, 'Đăng Nhập', 25, false, 0),
              )
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: TextLabel(false, false, false, false, true, 'Chào mừng bạn đến với Ombee của chúng tôi. Hay đăng nhập để trải nghiệm nào', 16, false, 0),
              )
            ],
          ),
          SizedBox(height: 25),
          Input(inputUsername, "Tên đăng nhập"),
          SizedBox(height: 25),
          InputPassword(inputPassword, "Mật khẩu", isPassword,
              () => {setState(() => isPassword = !isPassword)}),
          SizedBox(height: 35),
          Button(0, 0, 'Đăng nhập', CustomColor(), () => Navigator.pushNamed(context, Routes().index)),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: TextLabel(false, false, false, false, true, 'Quên mật khẩu', 16, false, 2),
              )
            ],
          ),
          SizedBox(height: 30),
          TextLabel(false, false, false, false, true, "Bạn chưa có tài khoản", 16, false, 1),
          SizedBox(height: 15),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: ButtonColor('Tạo tài khoản', 246, 219, 179, () => Navigator.pushNamed(context, Routes().signup))
          )
        ],
      )
    );
  }
}
