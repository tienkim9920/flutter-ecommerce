class CouponInterface {
  bool? status;
  String? promotion;
  String? describe;
  String? couponCategoryId;
  String? userId;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['promotion'] = this.promotion;
    data['describe'] = this.describe;
    data['couponCategoryId'] = this.couponCategoryId;
    data['userId'] = this.userId;
    return data;
  }
}
