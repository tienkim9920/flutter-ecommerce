import 'package:flutter/material.dart';

class CheckoutItem {
  TextEditingController phone = TextEditingController();
  String addressState = 'Thành Phố Quy Nhơn, Tỉnh Bình Định';
  TextEditingController addressHome = TextEditingController();
  String? addressShow;
  TextEditingController coupon = TextEditingController();
  TextEditingController note = TextEditingController();
  bool? checkingCoupon = false;
  String? couponId;
}
