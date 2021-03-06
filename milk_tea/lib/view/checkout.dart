import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:milk_tea/component/button-color.dart';
import 'package:milk_tea/component/button-custom.dart';
import 'package:milk_tea/component/button-icon.dart';
import 'package:milk_tea/component/button.dart';
import 'package:milk_tea/component/input-custom.dart';
import 'package:milk_tea/component/input.dart';
import 'package:milk_tea/component/modal-center.dart';
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
  final bool errorPhoneCheckout;
  final bool errorAddressCheckout;
  final bool modalApplyCoupon;
  final Function openModalCoupon;
  final List<dynamic> coupons;
  final String? couponId;
  final Function onChangeCouponId;
  final Function applyCoupon;

  const Checkout(
      this.currentParent,
      this.backStep,
      this.checkoutItem,
      this.gotoCheckingOrder,
      this.modalCheckout,
      this.onChangeModal,
      this.total,
      this.loadingCheckout,
      this.errorPhoneCheckout,
      this.errorAddressCheckout,
      this.modalApplyCoupon,
      this.openModalCoupon,
      this.coupons,
      this.couponId,
      this.onChangeCouponId,
      this.applyCoupon,
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
                'Nh???p th??ng tin ?????t h??ng',
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
            Input(checkoutItem.phone, 'S??? ??i???n tho???i',
                'S??? ??i???n tho???i kh??ng ???????c ????? tr???ng', errorPhoneCheckout),
            SizedBox(height: 25),
            Container(
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: TextLabel(false, false, false, false, true,
                          "T???nh/TP", 12, false, 0),
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
            Input(checkoutItem.addressHome, '?????a ch??? nh???n h??ng',
                '?????a ch??? nh???n h??ng kh??ng ???????c ????? tr???ng', errorAddressCheckout),
            SizedBox(height: 25),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: TextLabel(false, false, false, true, false,
                      '??p d???ng khuy???n m??i: ', 16, false, 0),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: ButtonCustom('Ch???n', () => openModalCoupon(), 123),
                )
              ],
            ),
            SizedBox(height: 25),
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
                          hintText: "Vi???t l???i nh???n c???a b???n ??? ????y",
                        ),
                      )),
                )),
            SizedBox(height: 25),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                children: [
                  TextLabel(false, false, false, true, false, 'T???ng ????n h??ng: ',
                      20, true, 0),
                  TextLabel(
                      true, false, false, true, false, total, 20, true, 0),
                ],
              ),
            ),
            SizedBox(height: 25),
            Button(0, 0, 'Ti???n h??nh ?????t h??ng', CustomColor(),
                () => onChangeModal(checkoutItem))
          ]),
        ),
        if (loadingCheckout) ...[SpinnerLoading()],
        if (modalCheckout) ...[
          Modal('B???n ???? ?????t h??ng th??nh c??ng', 'Ki???m tra ????n h??ng',
              () => gotoCheckingOrder())
        ],
        if (modalApplyCoupon) ...[
          ModalCenter('Ch???n phi???u gi???m gi??', () => openModalCoupon(), coupons,
              couponId, (id) => onChangeCouponId(id), () => applyCoupon())
        ],
      ]),
    );
  }
}
