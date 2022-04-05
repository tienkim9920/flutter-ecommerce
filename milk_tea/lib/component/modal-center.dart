import 'package:flutter/material.dart';
import 'package:milk_tea/component/button-custom.dart';
import 'package:milk_tea/component/text-label.dart';
import 'package:milk_tea/pattern/custom-color.dart';

class ModalCenter extends StatelessWidget {
  final String title;
  final Function closeModal;
  final List<dynamic> arrayItems;
  final String? couponId;
  final Function onChangeCouponId;
  final Function applyCoupon;

  const ModalCenter(this.title, this.closeModal, this.arrayItems, this.couponId,
      this.onChangeCouponId, this.applyCoupon,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 844,
      color: Colors.black.withOpacity(.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 400,
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.fromLTRB(30, 15, 30, 10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextLabel(
                        false, false, false, true, false, title, 18, false, 1),
                    GestureDetector(
                      child: Image.asset('assets/close_black.png'),
                      onTap: () => closeModal(),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  height: 270,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      ...arrayItems
                          .where((element) => !element['status'])
                          .map((item) => GestureDetector(
                                onTap: () =>
                                    onChangeCouponId(item['id'].toString()),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.fastOutSlowIn,
                                  decoration: BoxDecoration(
                                      color: item['id'].toString() ==
                                              couponId.toString()
                                          ? Colors.grey[100]
                                          : Colors.white,
                                      border: Border(
                                          left: BorderSide(
                                              width: item['id'].toString() ==
                                                      couponId.toString()
                                                  ? 12.0
                                                  : 0,
                                              color: item['id'].toString() ==
                                                      couponId.toString()
                                                  ? Color.fromRGBO(
                                                      CustomColor().R,
                                                      CustomColor().G,
                                                      CustomColor().B,
                                                      1)
                                                  : Colors.white))),
                                  margin: EdgeInsets.symmetric(vertical: 3),
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            'assets/coupon.png',
                                            width: 70,
                                            height: 60,
                                          ),
                                          Container(
                                            width: 200,
                                            padding: EdgeInsets.only(left: 5),
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
                                                        '${item['describe']} giá đơn hàng',
                                                        16,
                                                        false,
                                                        0),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    TextLabel(
                                                        false,
                                                        false,
                                                        true,
                                                        false,
                                                        false,
                                                        'Chưa sử dụng',
                                                        15,
                                                        false,
                                                        0),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ))
                          .toList()
                    ],
                  ),
                ),
                ButtonCustom('Áp dụng', () => applyCoupon(), 0)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
