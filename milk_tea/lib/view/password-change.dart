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
  final bool showNewPassword;
  final Function onShowNewPassword;
  final bool showConfirmPassword;
  final Function onShowConfirmPassword;

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
      this.showNewPassword,
      this.onShowNewPassword,
      this.showConfirmPassword,
      this.onShowConfirmPassword,
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
                    "M???t kh???u hi???n t???i",
                    showPassword,
                    () => onShowPassword(),
                    passwordInvalid
                        ? 'Vui l??ng ki???m tra l???i m???t kh???u hi???n t???i'
                        : 'M???t kh???u hi???n t???i kh??ng ???????c ????? tr???ng',
                    errorPassword),
                SizedBox(height: 20),
                InputPassword(
                    userPassword.newPassword,
                    "M???t kh???u m???i",
                    showNewPassword,
                    () => onShowNewPassword(),
                    newPasswordInvalid
                        ? 'Vui l??ng ki???m tra l???i m???t kh???u m???i'
                        : 'M???t kh???u m???i kh??ng ???????c ????? tr???ng',
                    errorNewPassword),
                SizedBox(height: 20),
                InputPassword(
                    userPassword.confirmPassword,
                    "X??c nh???n m???t kh???u m???i",
                    showConfirmPassword,
                    () => onShowConfirmPassword(),
                    confirmPasswordInvalid
                        ? 'Vui l??ng ki???m tra l???i x??c nh???n m???t kh???u m???i'
                        : 'X??c nh???n m???t kh???u m???i kh??ng ???????c ????? tr???ng',
                    errorConfirmPassword),
                SizedBox(height: 35),
                Button(0, 0, 'Thay ?????i m???t kh???u', CustomColor(),
                    () => handleUpdatePassword(userPassword))
              ],
            ),
          ),
          if (modalPassword) ...[SpinnerLoading()]
        ]));
  }
}
