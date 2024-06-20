// To parse this JSON data, do
//
//     final categorieModel = categorieModelFromJson(jsonString);

import 'dart:convert';

Categorie categorieModelFromJson(String str) => Categorie.fromJson(json.decode(str));

String categorieModelToJson(Categorie data) => json.encode(data.toJson());

class Categorie {
  int id;
  String name;
  int isActive;

  Categorie({
    required this.id,
    required this.name,
    required this.isActive,
  });

  factory Categorie.fromJson(Map<String, dynamic> json) => Categorie(
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
