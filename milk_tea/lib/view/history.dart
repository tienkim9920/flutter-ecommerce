import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:milk_tea/component/text-label.dart';
import 'package:milk_tea/pattern/custom-color.dart';

class History extends StatelessWidget {
  final Function nextStep;
  final List<dynamic> history;
  final Map<dynamic, dynamic> informationUser;
  final Function nextCoupon;

  const History(
      this.nextStep, this.history, this.informationUser, this.nextCoupon,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(scrollDirection: Axis.vertical, children: [
        Padding(
          padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
          child: Column(children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 180,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/bg-history.png'),
                fit: BoxFit.fill,
              )),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 180,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/bg-mask.png'),
                  fit: BoxFit.fill,
                )),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(children: [
                          TextLabel(false, true, false, false, false,
                              'Điểm của bạn', 20, false, 0)
                        ]),
                        Row(children: [
                          TextLabel(false, true, false, false, false,
                              informationUser['score'].toString(), 32, false, 0)
                        ]),
                        SizedBox(height: 10),
                        Row(children: [
                          GestureDetector(
                            onTap: () => nextCoupon(),
                            child: Container(
                              width: 140,
                              height: 42,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(46, 141, 108, 1)
                                      .withOpacity(1),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextLabel(false, true, false, false, false,
                                      'Mã khuyến mãi', 16, false, 0)
                                ],
                              ),
                            ),
                          )
                        ]),
                      ]),
                ),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextLabel(false, false, false, true, false, 'Lịch sử đặt hàng',
                    20, true, 0)
              ],
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Column(
                children: [
                  ...history.map((item) => GestureDetector(
                        onTap: () => nextStep(item['id']),
                        child: Padding(
                          padding: EdgeInsets.only(top: 10),
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
                                            'Đơn hàng có mã số ${item['id']}',
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
                                        TextLabel(
                                            false,
                                            false,
                                            false,
                                            false,
                                            true,
                                            item['pay']
                                                ? 'Đã thanh toán'
                                                : 'Chưa thanh toán',
                                            16,
                                            false,
                                            0),
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
                        ),
                      ))
                ],
              ),
            ),
          ]),
        ),
      ]),
    );
  }
}
