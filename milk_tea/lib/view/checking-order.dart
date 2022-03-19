import 'package:flutter/material.dart';
import 'package:milk_tea/component/navbar.dart';
import 'package:milk_tea/component/text-label.dart';
import 'package:milk_tea/constant/name-component.dart';
import 'package:milk_tea/pattern/current-parent.dart';
import 'package:milk_tea/pattern/custom-color.dart';

class CheckingOrder extends StatelessWidget {

  final CurrentParent currentParent;
  final Function backStep;

  const CheckingOrder(this.currentParent, this.backStep, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Navbar(true, true, false, true, NameComponent().kiemtra, 'flag.png', 
                      () => backStep(currentParent.id, currentParent.name), 
                      () => print("123")),
          Padding(
            padding: EdgeInsets.fromLTRB(40, 40, 40, 50),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 330,
                  // color: Colors.red,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        child: Container(
                          margin: EdgeInsets.only(left: 20),
                          width: 1,
                          height: 330,
                          color: Color.fromRGBO(240, 240, 240, 1),
                        ),
                      ),
                      Positioned(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(10, 20, 0, 0),
                          width: 22,
                          height: 22,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Color.fromRGBO(CustomColor().R, CustomColor().G, CustomColor().B, 1),
                          ),
                        )
                      ),
                      Positioned(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(12, 110, 0, 0),
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.grey,
                          ),
                        )
                      ),
                      Positioned(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(12, 200, 0, 0),
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.grey,
                          ),
                        )
                      ),
                      Positioned(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(12, 290, 0, 0),
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.grey,
                          ),
                        )
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  width: 250,
                  height: 330,
                  child: Stack(
                    children: [
                      Positioned(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(10, 20, 0, 0),
                          child: TextLabel(false, false, true, false, false, "Đang xác nhận đơn hàng", 18, false, 0),
                        )
                      ),
                      Positioned(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(12, 107, 0, 0),
                          child: TextLabel(false, false, false, false, true, "Đang xử lý đơn hàng", 18, false, 0),
                        )
                      ),
                      Positioned(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(12, 197, 0, 0),
                          child: TextLabel(false, false, false, false, true, "Đang vận chuyện lý đơn hàng", 18, false, 0),
                        )
                      ),
                      Positioned(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(12, 287, 0, 0),
                          child: TextLabel(false, false, false, false, true, "Hoàn thành", 18, false, 0),
                        )
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 350,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                'assets/bg-green-2.png'),
                fit: BoxFit.fill,
              )
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30.0),
                            child: Image.network('https://scontent.fsgn2-5.fna.fbcdn.net/v/t39.30808-6/272090950_2008790629302495_8262403573064001788_n.jpg?_nc_cat=104&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=5OypHVeqvLcAX9qoKOJ&_nc_ht=scontent.fsgn2-5.fna&oh=00_AT-23brcDam82txiCWO8odDHkVZxh98fsWDtUhUhaJqM7g&oe=62395C81',
                              width: 50,
                              height: 50,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    TextLabel(false, true, false, false, false, "Nguyễn Kim Tiền", 18, false, 0),
                                  ],
                                ),
                                Row(
                                  children: [
                                    TextLabel(false, true, false, false, false, "Điểm của bạn 500", 16, false, 0),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Image.asset('assets/phone.png'),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Image.asset('assets/chat.png'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 239,
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                      'assets/bg-white-2.png'),
                      fit: BoxFit.fill,
                    )
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/location-checking.png'),
                          Padding(
                            padding: EdgeInsets.only(left: 25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 230,
                                  child: TextLabel(false, false, false, true, false, "299 Nguyễn Thị Minh Khai", 18, false, 0),
                                ),
                                SizedBox(height: 3),
                                Row(
                                  children: [
                                    TextLabel(false, false, false, false, true, "Tổng đơn hàng: ", 15, false, 0),
                                    TextLabel(true, false, false, false, true, '70000', 15, false, 0),
                                  ],
                                )
                                
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(
                        children: [
                          Image.asset('assets/shop.png'),
                          Padding(
                            padding: EdgeInsets.only(left: 25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 230,
                                  child: TextLabel(false, false, false, true, false, "155 Nguyễn Thị Định", 18, false, 0),
                                ),
                                SizedBox(height: 3),
                                TextLabel(false, false, false, false, true, "Ombee", 15, false, 0),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ]
            ),
          )
        ],
      )
    );
  }
}
