// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  String status;
  List<Categories> data;

  CategoryModel({
    required this.status,
    required this.data,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    status: json["status"],
    data: List<Categories>.from(json["data"].map((x) => Categories.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Categories {
  int categoryId;
  String categoryName;

  Categories({
    required this.categoryId,
    required this.categoryName,
  });

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
    categoryId: json["category_id"],
    categoryName: json["category_name"],
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "category_name": categoryName,
  };
}
