import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:milk_tea/component/button.dart';
import 'package:milk_tea/component/input-hint.dart';
import 'package:milk_tea/component/input-password.dart';
import 'package:milk_tea/component/input.dart';
import 'package:milk_tea/component/text-label.dart';
import 'package:milk_tea/pattern/current-parent.dart';
import 'package:milk_tea/pattern/custom-color.dart';

class ProfileDetail extends StatelessWidget {
  final CurrentParent currentParent;
  final Function backStep;
  final TextEditingController user;
  final bool isPasswordUser;
  final Function onPasswordUser;

  const ProfileDetail(this.currentParent, this.backStep, this.user,
      this.isPasswordUser, this.onPasswordUser,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
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
                    Image.asset('assets/logo_color.png', width: 50, height: 50),
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
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Column(
                children: [
                  SizedBox(height: 40),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(80.0),
                    child: Image.asset(
                      'assets/avt.png',
                      width: 110,
                      height: 110,
                    ),
                  ),
                  SizedBox(height: 10),
                  TextLabel(false, false, true, false, false,
                      'Thay đổi ảnh đại diện', 16, false, 1),
                ],
              ),
            ]),
            SizedBox(height: 20),
            Input(user, 'Họ và tên', 'Họ và tên không được để trống', false),
            SizedBox(height: 20),
            Input(user, 'Địa chỉ', 'Đại chỉ không được để trống', false),
            SizedBox(height: 20),
            Input(user, 'Email', 'Email không được để trống', false),
            SizedBox(height: 20),
            Input(user, 'Số điện thoại', 'Số điện thoại không được để trống',
                false),
            SizedBox(height: 20),
            Input(user, 'Tên đăng nhập', 'Tên đăng nhập không được để trống',
                false),
            SizedBox(height: 20),
            InputPassword(user, 'Mật khẩu', isPasswordUser,
                () => onPasswordUser(), 'Mật khẩu không được để trống', false),
            SizedBox(height: 35),
            Button(0, 0, 'Chỉnh sửa', CustomColor(), () => print('123'))
          ],
        ));
  }
}
