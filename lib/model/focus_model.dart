class FocusModel {
  String? sId;
  String? title;
  String? status;
  String? pic;
  String? url;

  FocusModel({this.sId, this.title, this.status, this.pic, this.url});

  // 从json数据中创建模型
  factory FocusModel.fromJson(Map<String, dynamic> json) {
    return FocusModel(
      sId: json["sId"] ?? "",
      title: json["title"] ?? "",
      status: json["status"] ?? "",
      pic: json["pic"] ?? "",
      url: json["url"] ?? "",
    );
  }
}
