class FeedbackInterface {
  String? content;
  String? star;
  String? productId;
  String? userId;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['content'] = this.content;
    data['star'] = this.star;
    data['productId'] = this.productId;
    data['userId'] = this.userId;
    return data;
  }
}
