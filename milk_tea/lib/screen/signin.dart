import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:milk_tea/component/button-color.dart';
import 'package:milk_tea/component/button.dart';
import 'package:milk_tea/component/input-password.dart';
import 'package:milk_tea/component/input.dart';
import 'package:milk_tea/component/spinner-loading.dart';
import 'package:milk_tea/component/text-label.dart';
import 'package:milk_tea/constant/route.dart';
import 'package:milk_tea/mapping/user.mapping.dart';
import 'package:milk_tea/pattern/custom-color.dart';
import 'package:milk_tea/pattern/user-login.dart';
import 'package:milk_tea/screen/index.dart';
import 'package:milk_tea/screen/signup.dart';
import 'package:milk_tea/service/user.service.dart';
import 'package:milk_tea/store/authenticate.store.dart';
import 'package:page_transition/page_transition.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _validateUsername = false;
  bool usernameInvalid = false;

  bool _validatePassword = false;
  bool passwordInvalid = false;

  UserLogin user = UserLogin();
  bool isPassword = true;
  bool spinnerLoading = false;

  void handlerSignIn() async {
    bool checkingInfo = checkValidation();

    if (!checkingInfo) {
      return;
    }

    setState(() => spinnerLoading = true);

    var res =
        await ServiceUser().postSignIn(UserMapping().MapServiceSignIn(user));

    Future.delayed(
        const Duration(seconds: 2),
        () => {
              if (res == 'Username is invalid')
                {
                  setState(
                      () => {usernameInvalid = true, _validateUsername = true})
                }
              else if (res == 'Password is invalid')
                {
                  setState(
                      () => {passwordInvalid = true, _validatePassword = true})
                }
              else
                {
                  Authenticate().setToken(res),
                  Navigator.push(
                      context,
                      PageTransition(
                          child: Index(),
                          childCurrent: widget,
                          type: PageTransitionType.rightToLeftJoined,
                          duration: Duration(milliseconds: 300),
                          reverseDuration: Duration(milliseconds: 300))),
                },
              setState(() => spinnerLoading = false)
            });
  }

  dynamic checkValidation() {
    setState(() {
      user.username.text.isEmpty
          ? _validateUsername = true
          : _validateUsername = false;
      user.password.text.isEmpty
          ? _validatePassword = true
          : _validatePassword = false;
    });

    if (_validatePassword || _validateUsername) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: [
          Positioned(
            child: Column(
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
                      child: TextLabel(false, false, false, true, false,
                          '????ng Nh???p', 25, false, 0),
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
                          'Ch??o m???ng b???n ?????n v???i Ombee c???a ch??ng t??i. Hay ????ng nh???p ????? tr???i nghi???m n??o',
                          16,
                          false,
                          0),
                    )
                  ],
                ),
                SizedBox(height: 25),
                Input(
                    user.username,
                    "T??n ????ng nh???p",
                    usernameInvalid
                        ? 'Vui l??ng ki???m tra l???i t??n ????ng nh???p'
                        : 'T??n ????ng nh???p kh??ng ???????c ????? tr???ng',
                    _validateUsername),
                SizedBox(height: 25),
                InputPassword(
                    user.password,
                    "M???t kh???u",
                    isPassword,
                    () => {setState(() => isPassword = !isPassword)},
                    passwordInvalid
                        ? 'Vui l??ng ki???m tra l???i m???t kh???u'
                        : 'M???t kh???u kh??ng ???????c ????? tr???ng',
                    _validatePassword),
                SizedBox(height: 35),
                Button(0, 0, '????ng nh???p', CustomColor(), () => handlerSignIn()),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: TextLabel(false, false, false, false, true,
                          'Qu??n m???t kh???u', 16, false, 2),
                    )
                  ],
                ),
                SizedBox(height: 30),
                TextLabel(false, false, false, false, true,
                    "B???n ch??a c?? t??i kho???n", 16, false, 1),
                SizedBox(height: 15),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: ButtonColor(
                        'T???o t??i kho???n',
                        246,
                        219,
                        179,
                        () => Navigator.push(
                            context,
                            PageTransition(
                                child: SignUp(),
                                childCurrent: widget,
                                type: PageTransitionType.rightToLeftJoined,
                                duration: Duration(milliseconds: 300),
                                reverseDuration: Duration(milliseconds: 300)))))
              ],
            ),
          ),
          if (spinnerLoading) ...[SpinnerLoading()]
        ]));
  }
}
