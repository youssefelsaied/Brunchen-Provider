// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Order orderFromJson(String str) => Order.fromJson(json.decode(str));

class Order {
  Order({
    required this.success,
    required this.data,
    required this.message,
  });

  bool? success;
  Data? data;
  String? message;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        success: json["success"] == null ? null : json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"] == null ? null : json["message"],
      );
}

class Data {
  Data({
    required this.orders,
  });

  List<OrderElement> orders;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        orders: json["orders"] == null
            ? []
            : List<OrderElement>.from(
                json["orders"].map((x) => OrderElement.fromJson(x))),
      );
}

class OrderElement {
  OrderElement({
    required this.id,
    required this.dayDate,
    required this.status,
    required this.deliveryAt,
    required this.mealDetails,
    required this.user,
    required this.address,
    required this.deliveryBoy,
  });

  int? id;
  DateTime? dayDate;
  String? status;
  String? deliveryAt;
  MealDetails? mealDetails;
  User? user;
  Address? address;
  DeliveryBoyClass? deliveryBoy;

  factory OrderElement.fromJson(Map<String, dynamic> json) => OrderElement(
        id: json["id"] == null ? null : json["id"],
        dayDate:
            json["day_date"] == null ? null : DateTime.parse(json["day_date"]),
        status: json["status"] == null ? null : json["status"],
        deliveryAt: json["delivery_at"] == null ? null : json["delivery_at"],
        mealDetails: json["mealDetails"] == null
            ? null
            : MealDetails.fromJson(json["mealDetails"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        address:
            json["address"] == null ? null : Address.fromJson(json["address"]),
        deliveryBoy: json["deliveryBoy"] == null || json["deliveryBoy"] == ""
            ? null
            : DeliveryBoyClass.fromJson(json["deliveryBoy"]),
      );
}

class Address {
  Address({
    required this.id,
    required this.title,
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.cityId,
    required this.cityTitle,
    required this.areaId,
    required this.areaTitle,
    required this.addressDefault,
    required this.building,
    required this.floor,
    required this.door,
  });

  int id;
  String title;
  String latitude;
  String longitude;
  String address;
  int cityId;
  String cityTitle;
  int areaId;
  String areaTitle;
  bool addressDefault;
  String building;
  String floor;
  String door;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        latitude: json["latitude"] == null ? null : json["latitude"],
        longitude: json["longitude"] == null ? null : json["longitude"],
        address: json["address"] == null ? null : json["address"],
        cityId: json["city_id"] == null ? null : json["city_id"],
        cityTitle: json["city_title"] == null ? null : json["city_title"],
        areaId: json["area_id"] == null ? null : json["area_id"],
        areaTitle: json["area_title"] == null ? null : json["area_title"],
        addressDefault: json["default"] == null ? null : json["default"],
        building: json["building"] == null ? null : json["building"],
        floor: json["floor"] == null ? null : json["floor"],
        door: json["door"] == null ? null : json["door"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
        "address": address == null ? null : address,
        "city_id": cityId == null ? null : cityId,
        "city_title": cityTitle == null ? null : cityTitle,
        "area_id": areaId == null ? null : areaId,
        "area_title": areaTitle == null ? null : areaTitle,
        "default": addressDefault == null ? null : addressDefault,
        "building": building == null ? null : building,
        "floor": floor == null ? null : floor,
        "door": door == null ? null : door,
      };
}

class DeliveryBoyClass {
  DeliveryBoyClass({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.address,
    required this.image,
    required this.available,
    required this.note,
  });

  String id;
  String name;
  String phoneNumber;
  String email;
  String address;
  String image;
  bool available;
  String note;

  factory DeliveryBoyClass.fromJson(Map<String, dynamic> json) =>
      DeliveryBoyClass(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        phoneNumber: json["phone_number"] == null ? null : json["phone_number"],
        email: json["email"] == null ? null : json["email"],
        address: json["address"] == null ? null : json["address"],
        image: json["image"] == null ? null : json["image"],
        available: json["available"] == null ? null : json["available"],
        note: json["note"] == null ? null : json["note"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "phone_number": phoneNumber == null ? null : phoneNumber,
        "email": email == null ? null : email,
        "address": address == null ? null : address,
        "image": image == null ? null : image,
        "available": available == null ? null : available,
        "note": note == null ? null : note,
      };
}

class MealDetails {
  MealDetails({
    required this.id,
    required this.size,
    required this.carb,
    required this.fats,
    required this.calories,
    required this.protein,
    required this.meal,
  });

  int id;
  String size;
  String carb;
  String fats;
  String calories;
  String protein;
  Meal? meal;

  factory MealDetails.fromJson(Map<String, dynamic> json) => MealDetails(
        id: json["id"] == null ? null : json["id"],
        size: json["size"] == null ? null : json["size"],
        carb: json["carb"] == null ? null : json["carb"],
        fats: json["fats"] == null ? null : json["fats"],
        calories: json["calories"] == null ? null : json["calories"],
        protein: json["protein"] == null ? null : json["protein"],
        meal: json["meal"] == null ? null : Meal.fromJson(json["meal"]),
      );
}

class Meal {
  Meal({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
  });

  int id;
  String name;
  String image;
  String description;

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        image: json["image"] == null ? null : json["image"],
        description: json["description"] == null ? null : json["description"],
      );
}

class User {
  User({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.image,
  });

  String id;
  String name;
  String phoneNumber;
  String email;
  String image;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        phoneNumber: json["phone_number"] == null ? null : json["phone_number"],
        email: json["email"] == null ? null : json["email"],
        image: json["image"] == null ? null : json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "phone_number": phoneNumber == null ? null : phoneNumber,
        "email": email == null ? null : email,
        "image": image == null ? null : image,
      };
}
