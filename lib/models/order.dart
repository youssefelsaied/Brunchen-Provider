import 'package:delivery_app/models/address.dart';
import 'package:delivery_app/models/coustomer.dart';
import 'package:delivery_app/models/restaurant.dart';
import 'package:flutter/cupertino.dart';

class Order {
  int id;
  String dayDate;
  String statues;
  String deliveryAt;
  String mealSize;
  String mealName;
  Restaurant resturant;
  Customer customer;
  Address address;
  Order({
    required this.id,
    required this.dayDate,
    required this.statues,
    required this.deliveryAt,
    required this.mealSize,
    required this.mealName,
    required this.resturant,
    required this.customer,
    required this.address,

  });
}
