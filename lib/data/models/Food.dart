// To parse this JSON data, do
//
//     final repasModel = repasModelFromJson(jsonString);

import 'dart:convert';

import 'package:oasis_restaurant/models/CategorieModel.dart';

Food foodFromJson(String str) => Food.fromJson(json.decode(str));

String foodToJson(Food data) => json.encode(data.toJson());

class Food {
  int? id;
  String? name;
  int? price;
  int? amount;
  String? description;
  String? fileImg;
  int? isActive;
  Categorie? categoryFood;

  Food({
    this.id,
    this.name,
    this.price,
    this.amount,
    this.description,
    this.fileImg,
    this.isActive,
    this.categoryFood,
  });

  factory Food.fromJson(Map<String, dynamic> json) => Food(
    id: json["id"],
    name: json["name"],
    price: json["price"],
    amount: json["amount"],
    description: json["description"],
    fileImg: json["file_img"],
    isActive: json["is_active"],
    categoryFood: json["category_food"] == null ? null : Categorie.fromJson(json["category_food"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "amount": amount,
    "description": description,
    "file_img": fileImg,
    "is_active": isActive,
    "category_food": categoryFood?.toJson(),
  };
}
