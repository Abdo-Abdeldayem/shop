class User_login_Model {
  late bool status;
  late String message;
  UserdataModel? data;

  User_login_Model.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? UserdataModel.fromJson(json['data']) : null;
  }
}

class UserdataModel {
  int? id;
  String? name;
  String? email;
  String? password;
  String? phone;
  String? image;
  int? points;
  int? credit;
  String? token;

  UserdataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    image = json['image'];
    points = json['points'];
    credit = json['credit'];
    token = json['token'];
  }
}
