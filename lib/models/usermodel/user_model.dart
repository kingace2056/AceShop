// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.token,
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.address,
    required this.type,
    required this.cart,
  });

  final String token;
  final String id;
  final String name;
  final String email;
  final String password;
  final String address;
  final String type;
  final List<dynamic> cart;

  factory User.fromJson(Map<String, dynamic> json) => User(
        token: json["token"],
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        address: json["address"],
        type: json["type"],
        cart: List<dynamic>.from(json["cart"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "_id": id,
        "name": name,
        "email": email,
        "password": password,
        "address": address,
        "type": type,
        "cart": List<dynamic>.from(cart.map((x) => x)),
      };
}
