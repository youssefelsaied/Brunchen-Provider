
import 'package:delivery_app/models/order.dart';
import 'package:delivery_app/models/restaurant.dart';

class RestaurantOrders {
  Restaurant restaurant;
  int ordersCount;
  List<Order> orders;

  RestaurantOrders({
    required this.restaurant,
    required this.orders,
    required this.ordersCount,
  });
}
