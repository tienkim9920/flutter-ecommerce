import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:milk_tea/component/button.dart';
import 'package:milk_tea/component/input-password.dart';
import 'package:milk_tea/component/input.dart';
import 'package:milk_tea/component/modal.dart';
import 'package:milk_tea/component/spinner-loading.dart';
import 'package:milk_tea/component/text-label.dart';
import 'package:milk_tea/pattern/custom-color.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController inputUsername = TextEditingController();
  TextEditingController inputPassword = TextEditingController();
  bool isPassword = true;
  bool modal = false;
  bool spinnerLoading = false;

  void handlerSignUp() {
    setState(() => spinnerLoading = true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
              child: Column(
                children: [
                  SizedBox(height: 50),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            child: Image.asset('assets/back-arrow.png',
                                width: 40, height: 40),
                            onTap: () => Navigator.pop(context),
                          ),
                        ),
                        Row(children: [
                          Image.asset('assets/logo_color.png',
                              width: 50, height: 50),
                          Text(
                            'Ombee',
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold)),
                          )
                        ]),
                        Container(
                          width: 30,
                          height: 30,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: TextLabel(false, false, false, true, false,
                            'Tạo Tài Khoản', 25, false, 0),
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
                        child: TextLabel(
                            false,
                            false,
                            false,
                            false,
                            true,
                            'Hãy đăng ký để trở thành một phần của Ombee chúng tôi đi nào!',
                            16,
                            false,
                            0),
                      )
                    ],
                  ),
                  SizedBox(height: 25),
                  Input(inputUsername, "Họ và tên"),
                  SizedBox(height: 25),
                  Input(inputUsername, "Email"),
                  SizedBox(height: 25),
                  Input(inputUsername, "Tên đăng nhập"),
                  SizedBox(height: 25),
                  InputPassword(inputPassword, "Mật khẩu", isPassword,
                      () => {setState(() => isPassword = !isPassword)}),
                  SizedBox(height: 35),
                  Button(0, 0, 'Đăng ký', CustomColor(), () => handlerSignUp()),
                  SizedBox(height: 25),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Column(children: [
                      TextLabel(false, false, false, false, true,
                          "Bấm vào đây để đọc các điều luật", 16, false, 1),
                      GestureDetector(
                        onTap: () => print("123"),
                        child: TextLabel(false, false, true, false, false,
                            "Bắt đầu thôi", 16, false, 1),
                      )
                    ]),
                  )
                ],
              ),
            ),
            if (modal) ...[
              Modal('Bạn đã đăng ký thành công', 'Xác nhận',
                  () => setState(() => modal = false))
            ],
            if (spinnerLoading) ...[SpinnerLoading()]
          ],
        ));
  }
}
