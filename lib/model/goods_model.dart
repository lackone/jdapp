class GoodsModel {
  String? id;
  String? title;
  String? image;
  String? price;
  int? num;
  String? attr;
  bool? isChecked;

  GoodsModel({this.id, this.title, this.image, this.price, this.num, this.attr, this.isChecked});

  // 从json数据中创建模型
  factory GoodsModel.fromJson(Map<String, dynamic> json) {
    return GoodsModel(
      id: json["id"] ?? "",
      title: json["title"] ?? "",
      image: json["image"] ?? "",
      price: json["price"] ?? "",
      num: json["num"] ?? 0,
      attr: json["attr"] ?? "",
      isChecked: json["isChecked"] ?? false,
    );
  }

  // 转换为json数据
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "image": image,
      "price": price,
      "num": num,
      "attr": attr,
      "isChecked": isChecked,
    };
  }
}
