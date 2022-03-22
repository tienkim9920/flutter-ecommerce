class UserInterface {
  String? id;
  String? fullname;
  String? email;
  String? username;
  String? password;
  String? address;
  String? image;
  String? score;
  String? permissionId;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullname'] = this.fullname;
    data['email'] = this.email;
    data['username'] = this.username;
    data['password'] = this.password;
    data['address'] = this.address;
    data['image'] = this.image;
    data['score'] = this.score;
    data['permissionId'] = this.permissionId;
    return data;
  }
}
