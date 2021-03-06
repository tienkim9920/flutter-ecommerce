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
                            'T???o T??i Kho???n', 25, false, 0),
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
                            'H??y ????ng k?? ????? tr??? th??nh m???t ph???n c???a Ombee ch??ng t??i ??i n??o!',
                            16,
                            false,
                            0),
                      )
                    ],
                  ),
                  SizedBox(height: 25),
                  Input(userModel.fullname, "H??? v?? t??n",
                      'H??? v?? t??n kh??ng ???????c ????? tr???ng', _validateFullname),
                  SizedBox(height: 20),
                  Input(
                      userModel.email,
                      "Email",
                      emailUsed
                          ? 'Email ???? ???????c s??? d???ng'
                          : 'Email kh??ng ???????c ????? tr???ng',
                      _validateEmail),
                  SizedBox(height: 20),
                  Input(
                      userModel.username,
                      "T??n ????ng nh???p",
                      usernameUsed
                          ? 'T??n ????ng nh???p ???? ???????c s??? d???ng'
                          : 'T??n ????ng nh???p kh??ng ???????c ????? tr???ng',
                      _validateUsername),
                  SizedBox(height: 20),
                  InputPassword(
                      userModel.password,
                      "M???t kh???u",
                      isPassword,
                      () => {setState(() => isPassword = !isPassword)},
                      'M???t kh???u kh??ng ???????c ????? tr???ng',
                      _validatePassword),
                  SizedBox(height: 35),
                  Button(0, 0, '????ng k??', CustomColor(), () => handlerSignUp()),
                  SizedBox(height: 25),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Column(children: [
                      TextLabel(false, false, false, false, true,
                          "B???m v??o ????y ????? ?????c c??c ??i???u lu???t", 16, false, 1),
                      GestureDetector(
                        onTap: () => print("123"),
                        child: TextLabel(false, false, true, false, false,
                            "B???t ?????u th??i", 16, false, 1),
                      )
                    ]),
                  )
                ],
              ),
            ),
            if (modal) ...[
              Modal('B???n ???? ????ng k?? th??nh c??ng', 'X??c nh???n',
                  () => setState(() => {modal = false, clearInput()}))
            ],
            if (spinnerLoading) ...[SpinnerLoading()]
          ],
        ));
  }
}
