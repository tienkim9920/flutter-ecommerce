import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:milk_tea/component/button-icon.dart';
import 'package:milk_tea/component/text-label.dart';
import 'package:milk_tea/pattern/custom-color.dart';

class CustomProduct extends StatelessWidget {
  final dynamic product;
  final Function productId;
  final bool countChange;
  final String id;
  final String size;
  final String count;
  final Function upCount;
  final Function downCount;

  const CustomProduct(this.product, this.productId, this.countChange, this.id,
      this.size, this.count, this.upCount, this.downCount,
      {Key? key})
      : super(key: key);

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
                      child: Image.network(product['image'],
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
              Text(product['name'],
                  textAlign: TextAlign.start,
                  style: GoogleFonts.quicksand(
                      color: Color.fromRGBO(20, 20, 20, 1), fontSize: 18)),
              SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(countChange ? size : product['product-category']['name'],
                      textAlign: TextAlign.start,
                      style: GoogleFonts.quicksand(
                          color: Color.fromRGBO(120, 120, 120, 1),
                          fontSize: 16)),
                  countChange
                      ? Container(
                          margin: EdgeInsets.only(left: 5),
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              border: Border.all(
                                  color: Color.fromRGBO(220, 220, 220, 1))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    child: Icon(Icons.keyboard_arrow_down,
                                        size: 30,
                                        color: Color.fromRGBO(40, 40, 40, 1)),
                                    onTap: () => downCount({
                                      'id': id,
                                      'size': size,
                                      'count': count
                                    }),
                                  ),
                                ),
                              ),
                              Container(
                                width: 26,
                                child: Text(
                                  count,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.quicksand(
                                      color: Color.fromRGBO(40, 40, 40, 1),
                                      fontSize: 19,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    child: Icon(Icons.keyboard_arrow_up,
                                        size: 30,
                                        color: Color.fromRGBO(40, 40, 40, 1)),
                                    onTap: () => upCount({
                                      'id': id,
                                      'size': size,
                                      'count': count
                                    }),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : ButtonIcon(
                          10,
                          10,
                          'Mua',
                          CustomColor(),
                          product['id'].toString(),
                          (id) => {productId(id)},
                          Icons.shopping_cart,
                          false)
                ],
              ),
              SizedBox(height: 15.0),
              TextLabel(true, false, false, true, false, product['price'], 18,
                  true, 0)
            ],
          )
        ],
      ),
    );
  }
}
