import 'dart:convert';

import 'package:milk_tea/models-interface/order.interface.dart';
import 'package:milk_tea/models/order.model.dart';

class OrderMapping {
  dynamic MapServiceOrder(OrderModel model) {
    OrderInterface order = OrderInterface();
    order.address = model.address;
    order.phone = model.phone;
    order.total = model.total;
    order.delivery = model.delivery;
    order.pay = model.pay;
    order.note = model.note;
    order.paymentId = model.paymentId;
    order.userId = model.userId;
    order.couponId = model.couponId;
    order.products = model.products;

    return json.encode(order.toJson());
  }
}
