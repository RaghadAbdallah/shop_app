

class LoginModel {
  bool? status;
  String? message;
  UserData? data;

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? UserData.fromJson(json['data']):null;
  }
}

class UserData {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? points;
  int? credit;
  String? token;

  UserData(
      {this.email,
      this.image,
      this.name,
      this.id,
      this.credit,
      this.phone,
      this.points,
      this.token});

  ///named constructor
  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    email = json['email'];
    name = json['name'];
    credit = json['credit'];
    phone = json['phone'];
    points = json['points'];
    token = json['token'];
  }
}
