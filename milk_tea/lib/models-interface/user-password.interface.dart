class UserPasswordInterface {
  String? userId;
  String? password;
  String? newPassword;
  String? confirmPassword;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['password'] = this.password;
    data['newPassword'] = this.newPassword;
    data['confirmPassword'] = this.confirmPassword;
    return data;
  }
}
