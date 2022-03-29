import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:milk_tea/component/button.dart';
import 'package:milk_tea/component/input-hint.dart';
import 'package:milk_tea/component/input-password.dart';
import 'package:milk_tea/component/input.dart';
import 'package:milk_tea/component/spinner-loading.dart';
import 'package:milk_tea/component/text-label.dart';
import 'package:milk_tea/pattern/current-parent.dart';
import 'package:milk_tea/pattern/custom-color.dart';
import 'package:milk_tea/pattern/user-edit.dart';

class ProfileDetail extends StatelessWidget {
  final CurrentParent currentParent;
  final Function backStep;
  final UserEdit user;
  final bool isPasswordUser;
  final Function onPasswordUser;
  final Function handleEditProfile;
  final bool modalEditProfile;
  final bool errorFullname;
  final bool errorEmail;

  const ProfileDetail(
      this.currentParent,
      this.backStep,
      this.user,
      this.isPasswordUser,
      this.onPasswordUser,
      this.handleEditProfile,
      this.modalEditProfile,
      this.errorFullname,
      this.errorEmail,
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
                Input(user.fullname, 'Họ và tên',
                    'Họ và tên không được để trống', errorFullname),
                SizedBox(height: 20),
                Input(user.address, 'Địa chỉ', 'Đại chỉ không được để trống',
                    false),
                SizedBox(height: 20),
                Input(user.email, 'Email', 'Email không được để trống',
                    errorEmail),
                SizedBox(height: 20),
                Input(user.phone, 'Số điện thoại',
                    'Số điện thoại không được để trống', false),
                SizedBox(height: 35),
                Button(0, 0, 'Chỉnh sửa', CustomColor(),
                    () => handleEditProfile(user))
              ],
            ),
          ),
          if (modalEditProfile) ...[SpinnerLoading()]
        ]));
  }
}
