import 'dart:convert';

MenusModel productModelFromJson(String str) => MenusModel.fromJson(json.decode(str));

String productModelToJson(MenusModel data) => json.encode(data.toJson());

class MenusModel {
  String status;
  List<Menus> data;

  MenusModel({
    required this.status,
    required this.data,
  });

  factory MenusModel.fromJson(Map<String, dynamic> json) => MenusModel(
    status: json["status"],
    data: List<Menus>.from(json["data"].map((x) => Menus.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Menus {
  int productId;
  String productName;
  String productPrice;
  String? productImage;
  String productCategory;
  int productCategoryId;
  int quantity;

  Menus({
    required this.productId,
    required this.productName,
    required this.productPrice,
    this.productImage,
    required this.productCategory,
    required this.productCategoryId,
    this.quantity = 0,
  });

  factory Menus.fromJson(Map<String, dynamic> json) => Menus(
    productId: json["product_id"],
    productName: json["product_name"],
    productPrice: json["product_price"],
    productImage: json["product_image"],
    productCategory: json["product_category"],
    productCategoryId: json["product_category_id"]
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "product_name": productName,
    "product_price": productPrice,
    "product_image": productImage,
    "product_category": productCategory,
    "product_category_id": productCategoryId,

  };
}
