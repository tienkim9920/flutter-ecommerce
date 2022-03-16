import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:milk_tea/component/button-icon.dart';
import 'package:milk_tea/component/navbar.dart';
import 'package:milk_tea/models/product.model.dart';
import 'package:milk_tea/pattern/current-parent.dart';
import 'package:milk_tea/pattern/custom-color.dart';

class ProductDetail extends StatelessWidget {

  final ProductModel product;
  final Function backStep;
  final Function nextStep;
  final CurrentParent currentParent;
  final double sizeProductDetail;
  final Function onChangeSize;
  final int countProductDetail;
  final Function onCountDown;
  final Function onCountUp;
  final Function addCart;

  const ProductDetail(this.product, this.backStep, this.currentParent, this.sizeProductDetail, this.onChangeSize, 
    this.countProductDetail, this.onCountDown, this.onCountUp, this.addCart, this.nextStep, { Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            height: 744,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    height: 420,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/bg-green.png'),
                        fit: BoxFit.fill,
                      )
                    )
                  ),
                ),
                Positioned(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Navbar(true, true, true, false, 'Chi tiết sản phẩm', 'flag.png', 
                      () => backStep(currentParent.id, currentParent.name), 
                      () => nextStep())
                  )
                ),
                Positioned(
                  top: 80,
                  left: 74,
                  child: Image.asset('assets/tradao.png', width: 250, height: 250)
                ),
                Positioned(
                  top: 370,
                  child: Container(
                    height: 474,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/bg-white.png'),
                        fit: BoxFit.fill,
                      )
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(30, 40, 30, 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Trà Đào', style: GoogleFonts.quicksand(
                            fontSize: 24,
                            color: Color.fromRGBO(30, 30, 30, 1),
                            fontWeight: FontWeight.w500
                          ),),
                          SizedBox(height: 8.0),
                          Text('Trà Đào kết hợp với lá trà mang đầy sức sống, cho bạn hương thơm thật là tuyệt vời.', style: GoogleFonts.quicksand(
                            fontSize: 18,
                            color: Color.fromRGBO(60, 60, 60, 1)
                          ),),
                          SizedBox(height: 10.0),
                          SliderTheme(
                            data: SliderThemeData(
                              thumbColor: Color.fromRGBO(4, 118, 78, 1),
                              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 14),
                              trackHeight: 13
                            ),
                            child: Slider(
                              max: 100,
                              value: sizeProductDetail,
                              inactiveColor: Color.fromRGBO(240, 240, 240, 1),
                              activeColor: Color.fromRGBO(4, 118, 78, 1),
                              onChanged: (double val) => onChangeSize(val),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('Nhỏ', style: GoogleFonts.quicksand(
                                color: sizeProductDetail >= 0 && sizeProductDetail <= 35 ? 
                                  Color.fromRGBO(4, 118, 78, 1) : Color.fromRGBO(200, 200, 200, 1),
                                fontSize: 18,
                                fontWeight: FontWeight.w500
                              ),),
                              Text('Vừa', style: GoogleFonts.quicksand(
                                color: sizeProductDetail > 35 && sizeProductDetail <= 70 ? 
                                  Color.fromRGBO(4, 118, 78, 1) : Color.fromRGBO(200, 200, 200, 1),
                                fontSize: 18,
                                fontWeight: FontWeight.w500
                              ),),
                              Text('Lớn', style: GoogleFonts.quicksand(
                                color: sizeProductDetail > 70 && sizeProductDetail <= 100 ? 
                                  Color.fromRGBO(4, 118, 78, 1) : Color.fromRGBO(200, 200, 200, 1),
                                fontSize: 18,
                                fontWeight: FontWeight.w500
                              ),),
                            ],
                          ),
                          SizedBox(height: 40.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${NumberFormat.decimalPattern().format(70000)} VNĐ',
                                textAlign: TextAlign.start,
                                style: GoogleFonts.quicksand(
                                  color: Color.fromRGBO(20, 20, 20, 1),
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500
                                )
                              ),
                              Container(
                                height: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(60),
                                  border: Border.all(color: Color.fromRGBO(220, 220, 220, 1))
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 10),
                                      child: MouseRegion(
                                        cursor: SystemMouseCursors.click,
                                        child: GestureDetector(
                                          child: Icon(Icons.keyboard_arrow_down, size: 30, color: Color.fromRGBO(40, 40, 40, 1)),
                                          onTap: () => {
                                            if (countProductDetail > 1){
                                              onCountDown()
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 30,
                                      child: Text(countProductDetail.toString(),
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.quicksand(
                                          color: Color.fromRGBO(40, 40, 40, 1),
                                          fontSize: 22,
                                          fontWeight: FontWeight.w500
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 10),
                                      child: MouseRegion(
                                        cursor: SystemMouseCursors.click,
                                        child: GestureDetector(
                                          child: Icon(Icons.keyboard_arrow_up, size: 30, color: Color.fromRGBO(40, 40, 40, 1)),
                                          onTap: () => onCountUp() ,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 20.0),
                          Text(
                            'Nếu bạn thích sản phẩm này vui lòng them vào giỏ hàng',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.quicksand(
                              color: Color.fromRGBO(40, 40, 40, 1),
                              fontSize: 16
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                )
              ],
            ),
          ),
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white
            ),
            child: ButtonIcon(0, 0, 'Mua Hàng', CustomColor(), 'data', (data) => addCart(data), Icons.shopping_cart, true),
          )
        ],
      ),
    );
  }
}