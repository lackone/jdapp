class UserModel {
  String? id;
  String? name;
  String? token;
  String? phone;

  UserModel({this.id, this.name, this.token, this.phone});

  // 从json数据中创建模型
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"] ?? "",
      name: json["name"] ?? "",
      token: json["token"] ?? "",
      phone: json["phone"] ?? "",
    );
  }

  // 转换为json数据
  Map<String, dynamic> toJson() {
    return {"id": id, "name": name, "token": token, "phone": phone};
  }
}
