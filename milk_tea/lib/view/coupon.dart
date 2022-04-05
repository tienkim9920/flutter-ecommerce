import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:milk_tea/component/navbar.dart';
import 'package:milk_tea/component/text-error.dart';
import 'package:milk_tea/component/text-label.dart';
import 'package:milk_tea/pattern/current-parent.dart';

class Coupon extends StatelessWidget {
  final Function backStep;
  final CurrentParent currentParent;
  final Function nextStep;
  final List<dynamic> coupons;

  const Coupon(this.backStep, this.currentParent, this.nextStep, this.coupons,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Navbar(
              true,
              true,
              true,
              true,
              'Danh sách mã giảm giá',
              'lucky.png',
              () => backStep(currentParent.id, currentParent.name),
              () => nextStep()),
          Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                ...coupons
                    .map((item) => Padding(
                          padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                          child: Column(
                            children: [
                              Container(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        TextLabel(
                                            false,
                                            false,
                                            false,
                                            true,
                                            false,
                                            '${item['describe']} giá đơn hàng của bạn',
                                            18,
                                            false,
                                            0),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        TextLabel(
                                            false,
                                            false,
                                            false,
                                            false,
                                            true,
                                            '${item['createdAt'].toString().substring(0, 10)} | ',
                                            16,
                                            false,
                                            0),
                                        !item['status']
                                            ? TextLabel(
                                                false,
                                                false,
                                                true,
                                                false,
                                                false,
                                                'Chưa sử dụng',
                                                16,
                                                false,
                                                0)
                                            : Text(
                                                'Đã sử dụng',
                                                textAlign: TextAlign.start,
                                                style: GoogleFonts.quicksand(
                                                  color: Colors.red[500],
                                                  fontSize: 14,
                                                ),
                                              ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 13),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: .9,
                                color: Color.fromARGB(255, 241, 241, 241),
                              )
                            ],
                          ),
                        ))
                    .toList()
              ],
            ),
          )
        ],
      ),
    );
  }
}
