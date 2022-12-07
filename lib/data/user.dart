// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

class User {
  User({
    required this.success,
    required this.data,
    required this.message,
  });

  bool? success;
  Data? data;
  String? message;

  factory User.fromJson(Map<String, dynamic> json) => User(
        success: json["success"] == null ? null : json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"] == null ? null : json["message"],
      );
}

class Data {
  Data({
    required this.user,
  });

  UserClass? user;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: json["user"] == null ? null : UserClass.fromJson(json["user"]),
      );
}

class UserClass {
  UserClass({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.userType,
    required this.image,
    required this.language,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.active,
    required this.token,
  });

  String id;
  String name;
  String phoneNumber;
  String email;
  int userType;
  String image;
  String language;
  String address;
  String latitude;
  String longitude;
  bool active;
  String token;

  factory UserClass.fromJson(Map<String, dynamic> json) => UserClass(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        phoneNumber: json["phone_number"] == null ? null : json["phone_number"],
        email: json["email"] == null ? null : json["email"],
        userType: json["user_type"] == null ? null : json["user_type"],
        image: json["image"] == null ? null : json["image"],
        language: json["language"] == null ? null : json["language"],
        address: json["address"] == null ? null : json["address"],
        latitude: json["latitude"] == null ? null : json["latitude"],
        longitude: json["longitude"] == null ? null : json["longitude"],
        active: json["active"] == null ? null : json["active"],
        token: json["token"] == null ? null : json["token"],
      );
}
