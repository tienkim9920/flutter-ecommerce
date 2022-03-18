import 'package:flutter/material.dart';

class CheckoutItem{
  late TextEditingController phone = TextEditingController();
  late TextEditingController email = TextEditingController();
  late TextEditingController name = TextEditingController();
  late String addressState = 'Thành Phố Quy Nhơn, Tỉnh Bình Định';
  late TextEditingController addressHome = TextEditingController();
  late String addressShow = '${addressHome.text}, ${addressState}';
  late TextEditingController coupon = TextEditingController();
}