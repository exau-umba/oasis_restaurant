// To parse this JSON data, do
//
//     final categorieModel = categorieModelFromJson(jsonString);

import 'dart:convert';

CategorieModel categorieModelFromJson(String str) => CategorieModel.fromJson(json.decode(str));

String categorieModelToJson(CategorieModel data) => json.encode(data.toJson());

class CategorieModel {
  int id;
  String name;
  int isActive;

  CategorieModel({
    required this.id,
    required this.name,
    required this.isActive,
  });

  factory CategorieModel.fromJson(Map<String, dynamic> json) => CategorieModel(
    id: json["id"],
    name: json["name"],
    isActive: json["is_active"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "is_active": isActive,
  };
}
