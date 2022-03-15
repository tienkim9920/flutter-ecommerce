import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:milk_tea/component/button-icon.dart';
import 'package:milk_tea/component/custom-product.dart';
import 'package:milk_tea/component/search.dart';
import 'package:milk_tea/pattern/custom-color.dart';

class Home extends StatelessWidget {

  final Function productId;
  final TextEditingController inputSearch;
  final Function onInputSearch;
  final List slideProduct;

  const Home(this.productId, this.inputSearch, this.onInputSearch, this.slideProduct, { Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                child: InputSearch(inputSearch, 'Tìm kiếm sản phẩm', (text) => onInputSearch(text)),
              ),
              Container(
                width: 390,
                height: 330,
                // color: Colors.red,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: 0,
                      bottom: -70,
                      left: 0,
                      right: 0,
                      child: CarouselSlider(
                        options: CarouselOptions(
                          height: 220,
                          viewportFraction: .55,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 4),
                          autoPlayAnimationDuration: Duration(milliseconds: 1000),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          scrollDirection: Axis.horizontal,
                        ),
                        items: slideProduct.map((item) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: 400,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(CustomColor().R, CustomColor().G, CustomColor().B, 1),
                                  borderRadius: BorderRadius.circular(30)
                                ),
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Positioned(
                                      top: -200,
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Image.asset(item['image'], width: 200, height: 200),
                                    ),
                                    Positioned(
                                      top: 130,
                                      bottom: 0,
                                      left: 20,
                                      right: 0,
                                      child: Text(
                                        item['name'],
                                        style: GoogleFonts.quicksand(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 24
                                        ),
                                      )
                                    ),
                                    Positioned(
                                      top: 165,
                                      bottom: 0,
                                      left: 20,
                                      right: 0,
                                      child: Text(
                                        '${NumberFormat.decimalPattern().format(int.parse(item['price']))} VNĐ',
                                        style: GoogleFonts.quicksand(
                                          color: Colors.white,
                                          fontSize: 19
                                        ),
                                      )
                                    ),
                                  ],
                                )
                              );
                            },
                          );
                        }).toList(),
                      )
                    )
                  ],
                ),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    Text(
                      'Loại sản phẩm',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.quicksand(
                        color: Color.fromRGBO(20, 20, 20, 1),
                        fontSize: 20,
                        fontWeight: FontWeight.w500
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 80,
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                margin: EdgeInsets.symmetric(vertical: 20.0),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      width: 160,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Color.fromRGBO(245, 245, 245, 1)),
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 243, 243, 243).withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Image.asset('assets/logo_color.png', width: 35, height: 35),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                            child: Column(
                              children: [
                                Text(
                                  'Tất cả',
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.quicksand(
                                    color: Color.fromRGBO(20, 20, 20, 1),
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  '19 loại',
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.quicksand(
                                    color: Color.fromRGBO(CustomColor().R, CustomColor().G, CustomColor().B, 1),
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      width: 160,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Color.fromRGBO(245, 245, 245, 1)),
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 243, 243, 243).withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Image.asset('assets/logo_color.png', width: 35, height: 35),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                            child: Column(
                              children: [
                                Text(
                                  'Trà Sữa',
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.quicksand(
                                    color: Color.fromRGBO(20, 20, 20, 1),
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  '23 loại',
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.quicksand(
                                    color: Color.fromRGBO(CustomColor().R, CustomColor().G, CustomColor().B, 1),
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      width: 160,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Color.fromRGBO(245, 245, 245, 1)),
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 243, 243, 243).withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Image.asset('assets/logo_color.png', width: 35, height: 35),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                            child: Column(
                              children: [
                                Text(
                                  'Hoa Quả',
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.quicksand(
                                    color: Color.fromRGBO(20, 20, 20, 1),
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  '21 loại',
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.quicksand(
                                    color: Color.fromRGBO(CustomColor().R, CustomColor().G, CustomColor().B, 1),
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      width: 160,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Color.fromRGBO(245, 245, 245, 1)),
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 243, 243, 243).withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Image.asset('assets/logo_color.png', width: 35, height: 35),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                            child: Column(
                              children: [
                                Text(
                                  'Coffee',
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.quicksand(
                                    color: Color.fromRGBO(20, 20, 20, 1),
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  '5 loại',
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.quicksand(
                                    color: Color.fromRGBO(CustomColor().R, CustomColor().G, CustomColor().B, 1),
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    Text(
                      'Sản phẩm bán chạy',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.quicksand(
                        color: Color.fromRGBO(20, 20, 20, 1),
                        fontSize: 20,
                        fontWeight: FontWeight.w500
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 25),
              CustomProduct((id) => productId(id)),
              CustomProduct((id) => productId(id)),
              CustomProduct((id) => productId(id)),
            ],
          ),
        ],
      )
    );
  }
}