import 'dart:convert';

import 'package:milk_tea/models-interface/coupon.interface.dart';
import 'package:milk_tea/models/coupon.model.dart';

class CouponMapping {
  dynamic MapServiceCoupon(CouponModel model) {
    CouponInterface coupon = CouponInterface();
    coupon.status = model.status;
    coupon.promotion = model.promotion;
    coupon.describe = model.describe;
    coupon.couponCategoryId = model.couponCategoryId;
    coupon.userId = model.userId;

    return json.encode(coupon.toJson());
  }
}
