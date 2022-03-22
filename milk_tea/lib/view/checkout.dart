import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:milk_tea/component/button-custom.dart';
import 'package:milk_tea/component/button-icon.dart';
import 'package:milk_tea/component/button.dart';
import 'package:milk_tea/component/input-custom.dart';
import 'package:milk_tea/component/input.dart';
import 'package:milk_tea/component/modal.dart';
import 'package:milk_tea/component/navbar.dart';
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

  const Checkout(this.currentParent, this.backStep, this.checkoutItem,
      this.gotoCheckingOrder, this.modalCheckout, this.onChangeModal,
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
            Input(checkoutItem.name, 'Họ và tên',
                'Họ và tên không được để trống', false),
            SizedBox(height: 25),
            Input(checkoutItem.email, 'Địa chỉ email',
                'Email không được để trống', false),
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
            SizedBox(height: 25),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                children: [
                  TextLabel(false, false, false, true, false, 'Tổng đơn hàng: ',
                      20, true, 0),
                  TextLabel(
                      true, false, false, true, false, '70000', 20, true, 0),
                ],
              ),
            ),
            SizedBox(height: 40),
            Button(0, 0, 'Tiến hành đặt hàng', CustomColor(),
                () => onChangeModal())
          ]),
        ),
        if (modalCheckout) ...[
          Modal('Bạn đã đặt hàng thành công', 'Kiểm tra đơn hàng',
              () => gotoCheckingOrder(checkoutItem))
        ]
      ]),
    );
  }
}
