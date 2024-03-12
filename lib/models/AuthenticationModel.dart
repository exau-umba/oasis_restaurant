// To parse this JSON data, do
//
//     final authenticationModel = authenticationModelFromJson(jsonString);

import 'dart:convert';

import 'package:oasis_restaurant/models/UserModel.dart';

AuthenticationModel authenticationModelFromJson(String str) => AuthenticationModel.fromJson(json.decode(str));

String authenticationModelToJson(AuthenticationModel data) => json.encode(data.toJson());

class AuthenticationModel {
  UserModel? user;
  String? accessToken;
  int? status;

  AuthenticationModel({
    this.user,
    this.accessToken,
    this.status,
  });

  factory AuthenticationModel.fromJson(Map<String, dynamic> json) => AuthenticationModel(
    user: json["user"] == null ? null : UserModel.fromJson(json["user"]),
    accessToken: json["access_token"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "user": user?.toJson(),
    "access_token": accessToken,
    "status": status,
  };
}

