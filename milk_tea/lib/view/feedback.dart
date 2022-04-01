import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:milk_tea/component/navbar.dart';
import 'package:milk_tea/component/text-label.dart';
import 'package:milk_tea/pattern/current-parent.dart';

class FeedBack extends StatelessWidget {
  final CurrentParent currentParent;
  final Function backStep;
  final String productName;
  final List<dynamic> feedbacks;

  const FeedBack(
      this.currentParent, this.backStep, this.productName, this.feedbacks,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(children: [
            Positioned(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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
                    Image.asset('assets/logo_color.png', width: 40, height: 40),
                    Text(
                      productName,
                      style: GoogleFonts.lato(
                          textStyle:
                              TextStyle(color: Colors.black, fontSize: 24)),
                    )
                  ]),
                  Container(
                    width: 30,
                    height: 30,
                    color: Colors.white,
                  )
                ],
              ),
            )),
            Positioned(
              top: 80,
              bottom: 0,
              left: 0,
              right: 0,
              child: ListView(scrollDirection: Axis.vertical, children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextLabel(false, false, false, true, false,
                              'Những bình luận liên quan', 20, true, 0)
                        ],
                      ),
                      SizedBox(height: 20),
                      ...feedbacks
                          .map(
                            (feedback) => Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.only(top: 10),
                                  child: Column(children: [
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(80.0),
                                              child: feedback['user']['image']
                                                          .toString() ==
                                                      null.toString()
                                                  ? Image.asset(
                                                      'assets/avt.png',
                                                      width: 70,
                                                      height: 70,
                                                    )
                                                  : Image.network(
                                                      feedback['user']['image'],
                                                      width: 70,
                                                      height: 70,
                                                    ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          width: 255,
                                          child: Column(
                                            children: [
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 15),
                                                      child: TextLabel(
                                                          false,
                                                          false,
                                                          false,
                                                          true,
                                                          false,
                                                          feedback['content'],
                                                          16,
                                                          false,
                                                          0),
                                                    ),
                                                  ]),
                                              SizedBox(height: 5),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 15),
                                                    child: TextLabel(
                                                        false,
                                                        false,
                                                        false,
                                                        false,
                                                        true,
                                                        feedback['user']
                                                            ['fullname'],
                                                        15,
                                                        false,
                                                        0),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 5),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 15),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        ...[1, 2, 3, 4, 5]
                                                            .map((item) => int.parse(
                                                                        feedback[
                                                                            'star']) >=
                                                                    item
                                                                ? Padding(
                                                                    padding: EdgeInsets
                                                                        .only(
                                                                            left:
                                                                                2),
                                                                    child: Image
                                                                        .asset(
                                                                      'assets/star-active.png',
                                                                      width: 15,
                                                                      height:
                                                                          15,
                                                                    ))
                                                                : Padding(
                                                                    padding: EdgeInsets
                                                                        .only(
                                                                            left:
                                                                                2),
                                                                    child: Image
                                                                        .asset(
                                                                      'assets/star-unactive.png',
                                                                      width: 15,
                                                                      height:
                                                                          15,
                                                                    )))
                                                            .toList()
                                                      ],
                                                    ),
                                                  ),
                                                  TextLabel(
                                                      false,
                                                      false,
                                                      false,
                                                      false,
                                                      true,
                                                      feedback['createdAt']
                                                          .toString()
                                                          .substring(0, 10),
                                                      15,
                                                      false,
                                                      0)
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: .9,
                                      color: Color.fromARGB(255, 241, 241, 241),
                                    )
                                  ]),
                                ),
                              ],
                            ),
                          )
                          .toList()
                    ],
                  ),
                )
              ]),
            )
          ]),
        ));
  }
}
