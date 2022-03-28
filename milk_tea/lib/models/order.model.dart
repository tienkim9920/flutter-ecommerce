import 'package:flutter/cupertino.dart';
import 'package:milk_tea/pattern/order-detail-item.dart';

class OrderModel {
  String? id;
  String? address;
  String? phone;
  String? total;
  String? delivery; // status delivery
  bool? pay;
  String? note;
  String? userId;
  String? paymentId;
  String? couponId;
  List<dynamic> products = [];
}
