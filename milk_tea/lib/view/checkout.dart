import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:milk_tea/component/button-color.dart';
import 'package:milk_tea/component/button-custom.dart';
import 'package:milk_tea/component/button-icon.dart';
import 'package:milk_tea/component/button.dart';
import 'package:milk_tea/component/input-custom.dart';
import 'package:milk_tea/component/input.dart';
import 'package:milk_tea/component/modal.dart';
import 'package:milk_tea/component/navbar.dart';
import 'package:milk_tea/component/spinner-loading.dart';
import 'package:milk_tea/component/text-label.dart';
import 'package:milk_tea/pattern/checkout-item.dart';
import 'package:milk_tea/pattern/current-parent.dart';
import 'package:milk_tea/pattern/custom-color.dart';

class Checkout extends StatelessWidget {
  final CurrentParent currentParent;
  final Function backStep;
  final CheckoutItem checkoutItem;
  final Function gotoCheckingOrder;
  final bool modalCheckout;
  final Function onChangeModal;
  final String total;
  final bool loadingCheckout;

  const Checkout(
      this.currentParent,
      this.backStep,
      this.checkoutItem,
      this.gotoCheckingOrder,
      this.modalCheckout,
      this.onChangeModal,
      this.total,
      this.loadingCheckout,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(clipBehavior: Clip.none, children: [
        Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          right: 0,
          child: Column(children: [
            Navbar(
                true,
                true,
                false,
                true,
                'Nhập thông tin đặt hàng',
                'flag.png',
                () => backStep(currentParent.id, currentParent.name),
                () => print("123")),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/logo_color.png', width: 50, height: 40),
                Text(
                  'Ombee',
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.bold)),
                )
              ],
            ),
            SizedBox(height: 40),
            Input(checkoutItem.phone, 'Số điện thoại',
                'Số điện thoại không được để trống', false),
            SizedBox(height: 25),
            Container(
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: TextLabel(false, false, false, false, true,
                          "Tỉnh/TP", 12, false, 0),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: TextLabel(false, false, false, true, false,
                          checkoutItem.addressState, 16, false, 0),
                    )
                  ],
                ),
                SizedBox(height: 5),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  width: MediaQuery.of(context).size.width,
                  height: .9,
                  color: Color.fromRGBO(235, 235, 235, 1),
                )
              ]),
            ),
            SizedBox(height: 25),
            Input(checkoutItem.addressHome, 'Địa chỉ nhận hàng',
                'Địa chỉ nhận hàng không được để trống', false),
            SizedBox(height: 25),
            Row(
              children: [
                InputCustom(checkoutItem.coupon, 'Mã giảm giá', 230),
                Container(
                  margin: EdgeInsets.only(top: 3),
                  width: 123,
                  child: ButtonCustom('Áp dụng', () => print('123')),
                )
              ],
            ),
            SizedBox(height: 40),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                  child: SizedBox(
                      height: 130,
                      child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        minLines: 5,
                        maxLines: 5,
                        controller: checkoutItem.note,
                        cursorColor: Color.fromRGBO(4, 118, 78, 1),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hoverColor: Color.fromRGBO(250, 250, 250, 1),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(230, 230, 230, 1),
                                  width: 1)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(CustomColor().R,
                                      CustomColor().G, CustomColor().B, 1),
                                  width: 2)),
                          hintStyle: GoogleFonts.quicksand(
                              color: Color.fromRGBO(150, 150, 150, 1)),
                          hintText: "Viết lời nhắn của bạn ở đây",
                        ),
                      )),
                )),
            SizedBox(height: 25),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                children: [
                  TextLabel(false, false, false, true, false, 'Tổng đơn hàng: ',
                      20, true, 0),
                  TextLabel(
                      true, false, false, true, false, total, 20, true, 0),
                ],
              ),
            ),
            SizedBox(height: 25),
            Button(0, 0, 'Tiến hành đặt hàng', CustomColor(),
                () => onChangeModal(checkoutItem))
          ]),
        ),
        if (loadingCheckout) ...[SpinnerLoading()],
        if (modalCheckout) ...[
          Modal('Bạn đã đặt hàng thành công', 'Kiểm tra đơn hàng',
              () => gotoCheckingOrder(checkoutItem))
        ]
      ]),
    );
  }
}
