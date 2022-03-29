class UserEditInterface {
  String? userId;
  String? fullname;
  String? email;
  String? address;
  String? phone;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['fullname'] = this.fullname;
    data['email'] = this.email;
    data['address'] = this.address;
    data['phone'] = this.phone;
    return data;
  }
}
