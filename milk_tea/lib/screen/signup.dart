import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:milk_tea/component/button.dart';
import 'package:milk_tea/component/input-password.dart';
import 'package:milk_tea/component/input.dart';
import 'package:milk_tea/component/modal.dart';
import 'package:milk_tea/component/spinner-loading.dart';
import 'package:milk_tea/component/text-error.dart';
import 'package:milk_tea/component/text-label.dart';
import 'package:milk_tea/mapping/user.mapping.dart';
import 'package:milk_tea/models/user.model.dart';
import 'package:milk_tea/pattern/custom-color.dart';
import 'package:milk_tea/service/user.service.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _validateEmail = false;
  bool emailUsed = false;

  bool _validateUsername = false;
  bool usernameUsed = false;

  bool _validateFullname = false;
  bool _validatePassword = false;

  bool isPassword = true;
  bool modal = false;
  bool spinnerLoading = false;

  UserModel userModel = UserModel();

  void handlerSignUp() async {
    bool checkingInfo = checkValidation();

    if (!checkingInfo) {
      return;
    }

    clearError();

    var res = await ServiceUser()
        .postSignUp(UserMapping().MapServiceSignUp(userModel));

    Future.delayed(
        const Duration(seconds: 3),
        () => {
              if (res == 'Email has already been used')
                {
                  setState(() => {emailUsed = true, _validateEmail = true})
                }
              else if (res == 'Username has already been used')
                {
                  setState(
                      () => {usernameUsed = true, _validateUsername = true})
                }
              else
                {setState(() => modal = true)},
              setState(() => spinnerLoading = false)
            });
  }

  void clearError() {
    setState(() {
      spinnerLoading = true;
      emailUsed = false;
      usernameUsed = false;
    });
  }

  void clearInput() {
    userModel.fullname.text = '';
    userModel.email.text = '';
    userModel.username.text = '';
    userModel.password.text = '';
  }

  dynamic checkValidation() {
    setState(() {
      userModel.fullname.text.isEmpty
          ? _validateFullname = true
          : _validateFullname = false;
      userModel.email.text.isEmpty
          ? _validateEmail = true
          : _validateEmail = false;
      userModel.username.text.isEmpty
          ? _validateUsername = true
          : _validateUsername = false;
      userModel.password.text.isEmpty
          ? _validatePassword = true
          : _validatePassword = false;
    });

    if (_validateFullname ||
        _validateEmail ||
        _validatePassword ||
        _validateUsername) {
      return false;
    }
    return true;
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
                  Input(userModel.fullname, "Họ và tên",
                      'Họ và tên không được để trống', _validateFullname),
                  SizedBox(height: 20),
                  Input(
                      userModel.email,
                      "Email",
                      emailUsed
                          ? 'Email đã được sử dụng'
                          : 'Email không được để trống',
                      _validateEmail),
                  SizedBox(height: 20),
                  Input(
                      userModel.username,
                      "Tên đăng nhập",
                      usernameUsed
                          ? 'Tên đăng nhập đã được sử dụng'
                          : 'Tên đăng nhập không được để trống',
                      _validateUsername),
                  SizedBox(height: 20),
                  InputPassword(
                      userModel.password,
                      "Mật khẩu",
                      isPassword,
                      () => {setState(() => isPassword = !isPassword)},
                      'Mật khẩu không được để trống',
                      _validatePassword),
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
                  () => setState(() => {modal = false, clearInput()}))
            ],
            if (spinnerLoading) ...[SpinnerLoading()]
          ],
        ));
  }
}
