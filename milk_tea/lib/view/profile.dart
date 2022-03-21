import 'package:flutter/material.dart';
import 'package:milk_tea/component/text-label.dart';
import 'package:milk_tea/pattern/custom-color.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Column(children: [
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
                TextLabel(false, false, false, true, false, 'Nguyễn Kim Tiền',
                    24, false, 1),
                SizedBox(height: 5),
                TextLabel(
                    false, false, true, false, false, 'Quy Nhơn', 16, false, 1),
              ],
            ),
          ]),
          SizedBox(height: 40),
          Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(60),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 226, 226, 226)
                              .withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Icon(Icons.phone,
                        size: 30,
                        color: Color.fromRGBO(CustomColor().R, CustomColor().G,
                            CustomColor().B, 1)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextLabel(false, false, false, false, true,
                                  'Số điện thoại', 14, false, 0)
                            ]),
                        SizedBox(height: 5),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                  width: 220,
                                  child: TextLabel(false, false, true, false,
                                      false, '0763557366', 18, false, 0)),
                            ]),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(60),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 226, 226, 226)
                              .withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Icon(Icons.mail_outline,
                        size: 30,
                        color: Color.fromRGBO(CustomColor().R, CustomColor().G,
                            CustomColor().B, 1)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextLabel(false, false, false, false, true,
                                  'Email', 14, false, 0)
                            ]),
                        SizedBox(height: 5),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                  width: 220,
                                  child: TextLabel(
                                      false,
                                      false,
                                      true,
                                      false,
                                      false,
                                      'tienkim9920@gmail.com',
                                      18,
                                      false,
                                      0)),
                            ]),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(60),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 226, 226, 226)
                              .withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Image.asset('assets/location.png'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextLabel(false, false, false, false, true,
                                  'Địa chỉ', 14, false, 0)
                            ]),
                        SizedBox(height: 5),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                  width: 220,
                                  child: TextLabel(false, false, true, false,
                                      false, '16 Nguyễn Nghiêm', 18, false, 0)),
                            ]),
                      ],
                    ),
                  )
                ],
              ),
            ],
          )
        ]),
      ),
    );
  }
}
