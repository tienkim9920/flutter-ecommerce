import 'package:flutter/material.dart';
import 'package:milk_tea/component/button-icon.dart';
import 'package:milk_tea/component/input.dart';
import 'package:milk_tea/component/navbar.dart';
import 'package:milk_tea/component/text-label.dart';
import 'package:milk_tea/pattern/checkout-item.dart';
import 'package:milk_tea/pattern/current-parent.dart';
import 'package:milk_tea/pattern/custom-color.dart';

class Checkout extends StatelessWidget {

  final CurrentParent currentParent;
  final Function backStep;
  final Function nextStep;
  final CheckoutItem checkoutItem;
  final Function gotoMapAddress;

  const Checkout(this.currentParent, this.backStep, this.nextStep, this.checkoutItem, this.gotoMapAddress, { Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Navbar(true, true, false, true, 'Nhập thông tin đặt hàng', 'flag.png', 
                      () => backStep(currentParent.id, currentParent.name), 
                      () => nextStep()),
          SizedBox(height: 50),
          Input(checkoutItem.phone, 'Số điện thoại'),
          SizedBox(height: 25),
          Input(checkoutItem.name, 'Họ và tên'),
          SizedBox(height: 25),
          Input(checkoutItem.email, 'Địa chỉ email'),
          SizedBox(height: 35),
          ButtonIcon(0, 0, 'Vui lòng chọn địa chỉ', CustomColor(), 'id', 
            (id) => gotoMapAddress(id), Icons.map, true)
          // Container(
          //   child: Column(
          //     children: [
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.start,
          //         children: [
          //           Padding(
          //             padding: EdgeInsets.symmetric(horizontal: 40),
          //             child: TextLabel(false, false, false, false, true, "Tỉnh/TP", 12, false, 0),
          //           )
          //         ],
          //       ),
          //       Row(
          //         children: [
          //           Padding(
          //             padding: EdgeInsets.symmetric(horizontal: 40),
          //             child: TextLabel(false, false, false, true, false, "Thành Phố Quy Nhơn, Tỉnh Bình Định", 16, false, 0),
          //           )
          //         ],
          //       ),
          //       SizedBox(height: 5),
          //       Container(
          //         margin: EdgeInsets.symmetric(horizontal: 40),
          //         width: MediaQuery.of(context).size.width,
          //         height: .9,
          //         color: Color.fromRGBO(235, 235, 235, 1),
          //       )
          //   ]),
          // )
        ]
      ),
    );
  }
}