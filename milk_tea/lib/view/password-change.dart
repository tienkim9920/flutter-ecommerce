import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:milk_tea/component/button.dart';
import 'package:milk_tea/component/input-password.dart';
import 'package:milk_tea/component/input.dart';
import 'package:milk_tea/component/spinner-loading.dart';
import 'package:milk_tea/component/text-label.dart';
import 'package:milk_tea/pattern/current-parent.dart';
import 'package:milk_tea/pattern/custom-color.dart';
import 'package:milk_tea/pattern/user-edit.dart';

class PasswordChange extends StatelessWidget {
  final CurrentParent currentParent;
  final Function backStep;
  final UserPassword userPassword;
  final bool modalPassword;
  final Function handleUpdatePassword;
  final bool errorPassword;
  final bool errorNewPassword;
  final bool errorConfirmPassword;
  final bool passwordInvalid;
  final bool newPasswordInvalid;
  final bool confirmPasswordInvalid;
  final bool showPassword;
  final Function onShowPassword;

  const PasswordChange(
      this.currentParent,
      this.backStep,
      this.userPassword,
      this.modalPassword,
      this.handleUpdatePassword,
      this.errorPassword,
      this.errorNewPassword,
      this.errorConfirmPassword,
      this.passwordInvalid,
      this.newPasswordInvalid,
      this.confirmPasswordInvalid,
      this.showPassword,
      this.onShowPassword,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: [
          Positioned(
            child: Column(
              children: [
                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          child: Image.asset('assets/back-arrow.png',
                              width: 40, height: 40),
                          onTap: () =>
                              backStep(currentParent.id, currentParent.name),
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
                SizedBox(height: 50),
                InputPassword(
                    userPassword.password,
                    "Mật khẩu",
                    showPassword,
                    () => onShowPassword(),
                    passwordInvalid
                        ? 'Vui lòng kiểm tra lại mật khẩu'
                        : 'Mật khẩu không được để trống',
                    errorPassword),
                SizedBox(height: 20),
                Input(userPassword.newPassword, 'Mật khẩu mới',
                    'Mật khẩu mới không được để trống', errorNewPassword),
                SizedBox(height: 20),
                Input(
                    userPassword.confirmPassword,
                    'Xác nhận mật khẩu mới',
                    'Xác nhận mật khẩu không được để trống',
                    errorConfirmPassword),
                SizedBox(height: 35),
                Button(0, 0, 'Thay đổi mật khẩu', CustomColor(),
                    () => handleUpdatePassword(userPassword))
              ],
            ),
          ),
          if (modalPassword) ...[SpinnerLoading()]
        ]));
  }
}
