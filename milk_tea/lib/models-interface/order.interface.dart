class OrderInterface {
  String? address;
  String? phone;
  String? total;
  String? delivery;
  bool? pay;
  String? note;
  String? userId;
  String? paymentId;
  String? couponId;
  List<dynamic>? products;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['total'] = this.total;
    data['delivery'] = this.delivery;
    data['pay'] = this.pay;
    data['note'] = this.note;
    data['userId'] = this.userId;
    data['paymentId'] = this.paymentId;
    data['couponId'] = this.couponId;
    data['products'] = this.products;
    return data;
  }
}
