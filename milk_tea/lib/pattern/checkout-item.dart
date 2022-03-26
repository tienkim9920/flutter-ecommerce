import 'package:flutter/material.dart';

class CheckoutItem {
  TextEditingController phone = TextEditingController();
  String addressState = 'Thành Phố Quy Nhơn, Tỉnh Bình Định';
  TextEditingController addressHome = TextEditingController();
  late String addressShow = '${addressHome.text}, ${addressState}';
  TextEditingController coupon = TextEditingController();
  TextEditingController note = TextEditingController();
}
