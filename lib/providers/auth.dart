// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
import 'dart:async';
import 'dart:io';
import 'package:collection/collection.dart'; // You have to add this manually, for some reason it cannot be added automatically
import 'package:delivery_app/data/user.dart' as us;

import 'package:delivery_app/data/order.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth with ChangeNotifier {
  Timer authTimer = Timer(const Duration(seconds: 5), () {});
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  us.UserClass? theUser;
  List<OrderElement> todayOrders = [];
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  bool get isAuth {
    // print(theUser!.token != null);
    return theUser != null;
  }

  Future<bool> signIn(String emailOrPhone, String password) async {
    final deviceToken = await _firebaseMessaging.getToken();
    var url = Uri.https(
        'ksa.brunchenapp.com', '/api/dashboard/login', {'q': '{https}'});
    try {
      final response = await http.post(url,
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
          },
          body: json.encode({
            "username": emailOrPhone,
            "device_token": deviceToken.toString(),
            "password": password,
          }));

      // return true;
      final responseData = json.decode(response.body);
      print(responseData);
      if (responseData['errors'] != null) {
        throw HttpException(responseData['message']);
      }
      if (responseData['success'] == false) {
        return false;
      }
      theUser = us.User.fromJson(responseData).data!.user!;
      notifyListeners();
      final prefs = await _prefs;

      if (responseData['success']) {
        print(theUser!.name);
        prefs.setStringList("userData", [
          theUser!.id,
          theUser!.name,
          theUser!.phoneNumber,
          theUser!.email,
          theUser!.userType.toString(),
          theUser!.image,
          theUser!.language,
          theUser!.address,
          theUser!.latitude,
          theUser!.longitude,
          theUser!.active.toString(),
          theUser!.token,
        ]);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      // print("e is $e");
      rethrow;
    }
  }

  Future<bool> fetchTodayOrders() async {
    final deviceToken = await _firebaseMessaging.getToken();
    var url = Uri.https('ksa.brunchenapp.com', '/api/orders', {'q': '{https}'});
    try {
      final response = await http.get(
        url,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${theUser!.token}',
        },
      );

      // return true;
      final responseData = json.decode(response.body);
      print(responseData);
      if (responseData['errors'] != null) {
        throw HttpException(responseData['message']);
      }
      if (responseData['success'] == false) {
        return false;
      }
      todayOrders = Order.fromJson(responseData).data!.orders;
      notifyListeners();
      if (responseData['success']) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      // print("e is $e");
      rethrow;
    }
  }

  Future<bool> tryAutoLogin() async {
    print("try autologin");

    final SharedPreferences prefs = await _prefs;

    if (!prefs.containsKey('userData')) {
      print("yes here no data");
      return false;
    }
    final extractedUserData = prefs.getStringList("userData");

    if (extractedUserData!.isNotEmpty) {
      us.UserClass user = us.UserClass(
          id: extractedUserData[0],
          name: extractedUserData[1],
          phoneNumber: extractedUserData[2],
          email: extractedUserData[3],
          userType: double.parse(extractedUserData[4]).toInt(),
          image: extractedUserData[5],
          language: extractedUserData[6],
          address: extractedUserData[7],
          latitude: extractedUserData[8],
          longitude: extractedUserData[9],
          active: extractedUserData[10] == "true" ? true : false,
          token: extractedUserData[11]);

      theUser = user;
      notifyListeners();
      // _autoLogout();
      await fetchTodayOrders();
      return true;
    } else {
      return false;
    }
  }

  Future<void> logout() async {
    theUser = null;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('userData');
//     prefs.clear();
  }

  // void _autoLogout() {
  //   if (authTimer.isActive) {
  //     authTimer.cancel();
  //   }
  //   final timeToExpiry =
  //       theUser.expiryDate.difference(DateTime.now()).inSeconds;
  //   authTimer = Timer(Duration(seconds: timeToExpiry), logout);
  // }

  // Future<void> getTodayOrders() async {
  //   if (isAuth) {
  //     // print(token);
  //     print("get Orders  ........");
  //     var url = Uri.https('ose.bwi.mybluehost.me', '/api/delivery/today/orders',
  //         {'q': '{https}'});
  //     try {
  //       final response = await http.get(
  //         url,
  //         headers: {
  //           'Content-type': 'application/json',
  //           'Accept': 'application/json',
  //           'Authorization': 'Bearer ${theUser.token}',
  //         },
  //       );
  //       final responseData = json.decode(response.body);
  //       print("order response ..  $responseData");
  //       if (responseData != null) {
  //         List<Order> userOrders = [];
  //
  //         List<dynamic> orders = responseData['data']["orders"];
  //         // print("adresses response ..  $addresses");
  //
  //         for (var order in orders) {
  //           print("adresses response ..  $order");
  //           Order add = Order(
  //               id: order["id"],
  //               dayDate: order["day_date"],
  //               statues: order["status"],
  //               deliveryAt: order["delivery_at"],
  //               mealSize: order["mealSize"],
  //               mealName: order["mealName"],
  //               resturant: Restaurant(
  //                 name: order["resturantAddress"]["name"],
  //                 phoneNumber: order["resturantAddress"]["phone_number"],
  //                 image: order["resturantAddress"]["image"],
  //                 address: order["resturantAddress"]["address"],
  //                 latitude: double.parse(order["resturantAddress"]["latitude"]),
  //                 longitude: double.parse(order["resturantAddress"]["longitude"]),
  //               ),
  //               customer: Customer(
  //                 id: order["user"]["id"],
  //                 name: order["user"]["name"],
  //                 phoneNumber: order["user"]["phone_number"],
  //                 email: order["user"]["email"],
  //                 image: order["user"]["image"],
  //               ),
  //               address: Address(
  //                 id: order["address"]["id"],
  //                 title: order["address"]["title"],
  //                 latitude: order["address"]["latitude"],
  //                 longitude: order["address"]["longitude"],
  //                 address: order["address"]["address"],
  //                 cityId: order["address"]["city_id"],
  //                 cityTitle: order["address"]["city_title"],
  //                 areaId: order["address"]["area_id"],
  //                 areaTitle: order["address"]["area_title"],
  //                 aDefault: true,
  //               )
  //           );
  //           if(add.statues=="INPROGRESS") {
  //             theUser.inProgressOrders.add(add);
  //             theUser.allOrders.add(add);
  //           }else if(add.statues=="READY") {
  //             theUser.readyOrders.add(add);
  //             theUser.allOrders.add(add);
  //           }
  //         }
  //
  //         notifyListeners();
  //       }
  //     } catch (e) {
  //       throw e;
  //     }
  //     return;
  //   } else
  //     return;
  // }

}
