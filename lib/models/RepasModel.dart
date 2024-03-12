// To parse this JSON data, do
//
//     final repasModel = repasModelFromJson(jsonString);

import 'dart:convert';

import 'package:oasis_restaurant/models/CategorieModel.dart';

RepasModel repasModelFromJson(String str) => RepasModel.fromJson(json.decode(str));

String repasModelToJson(RepasModel data) => json.encode(data.toJson());

class RepasModel {
  int id;
  String name;
  double price;
  int amount;
  int isActive;
  CategorieModel categoryFood;

  RepasModel({
    required this.id,
    required this.name,
    required this.price,
    required this.amount,
    required this.isActive,
    required this.categoryFood,
  });

  factory RepasModel.fromJson(Map<String, dynamic> json) => RepasModel(
    id: json["id"],
    name: json["name"],
    price: json["price"]?.toDouble(),
    amount: json["amount"],
    isActive: json["is_active"],
    categoryFood: CategorieModel.fromJson(json["category_food"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "amount": amount,
    "is_active": isActive,
    "category_food": categoryFood.toJson(),
  };
}
