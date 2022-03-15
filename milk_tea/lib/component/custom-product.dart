import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:milk_tea/component/button-icon.dart';
import 'package:milk_tea/pattern/custom-color.dart';

class CustomProduct extends StatelessWidget {

  final Function productId;

  const CustomProduct(this.productId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 140.0,
      margin: EdgeInsets.only(top: 5),
      // color: Colors.red,
      child: Row(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      child: Image.asset('assets/tradao.png',
                          width: 120, height: 120),
                    ),
                    Positioned(
                      top: 90,
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 30,
                            padding: EdgeInsets.fromLTRB(7, 5, 15, 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              color: Color.fromRGBO(255, 135, 48, 1),
                            ),
                            child: Row(children: [
                              Image.asset(
                                'assets/star.png',
                                width: 30,
                              ),
                              Text('Mới',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.quicksand(
                                      color: Colors.white))
                            ]),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Trà Xanh Đá Xay",
                  textAlign: TextAlign.start,
                  style: GoogleFonts.quicksand(
                      color: Color.fromRGBO(20, 20, 20, 1), fontSize: 18)),
              SizedBox(height: 20.0),
              Row(
                children: [
                  Text("Loại SP",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.quicksand(
                          color: Color.fromRGBO(120, 120, 120, 1),
                          fontSize: 16)),
                  ButtonIcon(0, 0, 'Mua', CustomColor(), 'id',
                      (id) => { productId(id) }, Icons.shopping_cart, false)
                ],
              ),
              SizedBox(height: 15.0),
              Text('${NumberFormat.decimalPattern().format(70000)} VNĐ',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.quicksand(
                      color: Color.fromRGBO(20, 20, 20, 1),
                      fontSize: 18,
                      fontWeight: FontWeight.w500)),
            ],
          )
        ],
      ),
    );
  }
}
