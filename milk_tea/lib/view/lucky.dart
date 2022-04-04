import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:milk_tea/component/button-custom.dart';
import 'package:milk_tea/component/button-white.dart';
import 'package:milk_tea/component/button.dart';
import 'package:milk_tea/component/modal.dart';
import 'package:milk_tea/component/text-error.dart';
import 'package:milk_tea/component/text-label.dart';
import 'package:milk_tea/pattern/current-parent.dart';
import 'package:milk_tea/pattern/custom-color.dart';

class Lucky extends StatelessWidget {
  final CurrentParent currentParent;
  final Function backStep;
  final List<dynamic> items;
  final StreamController<int> selected;
  final Function onSelected;
  final bool allowSpin;
  final bool errorSpin;
  final Map<dynamic, dynamic> informationUser;
  final bool modalLucky;
  final Function onLucky;
  final String describeLucky;

  const Lucky(
      this.currentParent,
      this.backStep,
      this.items,
      this.selected,
      this.onSelected,
      this.allowSpin,
      this.errorSpin,
      this.informationUser,
      this.modalLucky,
      this.onLucky,
      this.describeLucky,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: [
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(children: [
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
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
                      Image.asset('assets/logo_spin.png',
                          width: 50, height: 50),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: TextLabel(false, false, false, true, false,
                            'Vòng quay', 20, false, 0),
                      ),
                    ]),
                    Container(
                      width: 30,
                      height: 30,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              Container(
                height: 400,
                width: 300,
                child: FortuneWheel(
                  animateFirst: false,
                  selected: selected.stream,
                  items: [
                    ...items.map((item) => FortuneItem(
                        child: TextLabel(false, true, false, false, false,
                            item['describe'], 15, false, 0)))
                  ],
                  styleStrategy: UniformStyleStrategy(
                    color: Color.fromRGBO(
                        CustomColor().R, CustomColor().G, CustomColor().B, 1),
                    borderColor: Colors.white,
                  ),
                ),
              ),
              allowSpin
                  ? Button(0, 0, 'Bắt đầu', CustomColor(), () => onSelected())
                  : TextLabel(false, false, false, false, true,
                      'Vui lòng chờ trong vài giây', 20, false, 0),
              if (errorSpin) ...[
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [TextError('Bạn không đủ điểm để thực hiện')])
              ],
              SizedBox(
                height: 50,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                width: 330,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Color.fromRGBO(
                      CustomColor().R, CustomColor().G, CustomColor().B, 1),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextLabel(false, true, false, false, false,
                            'Điểm số của bạn', 20, false, 0),
                        Container(
                          child: ButtonIconWhite(
                              0,
                              0,
                              informationUser['score'].toString(),
                              'id',
                              (id) => {},
                              Icons.sports_soccer_rounded,
                              false),
                        )
                      ]),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextLabel(false, false, false, true, false,
                  'Lưu ý: 500 điểm cho 1 lần quay', 20, false, 0),
            ]),
          ),
          if (modalLucky) ...[
            Modal('Bạn đã nhận được mã ${describeLucky} cho đơn hàng',
                'Xác nhận', () => onLucky())
          ]
        ]));
  }
}
