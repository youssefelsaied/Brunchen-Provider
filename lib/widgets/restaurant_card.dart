// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:delivery_app/models/order.dart';
// import 'package:delivery_app/models/restaurant_orders.dart';
// import 'package:delivery_app/screens/orders_screen.dart';
// import 'package:delivery_app/widgets/placeholder.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class RestaurantCard extends StatefulWidget {
//   final RestaurantOrders restaurant;
//   const RestaurantCard({Key? key, required this.restaurant}) : super(key: key);

//   @override
//   _RestaurantCardState createState() => _RestaurantCardState();
// }

// class _RestaurantCardState extends State<RestaurantCard> {
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//     final cardHeight = height * .3;
//     final extendedCardHeight = height * .7;
//     final innerWidth = width - width * .07;
//     return GestureDetector(
//       onTap: () {
//         if (widget.restaurant.ordersCount > 0) {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => OrdersScreen(
//                       orders: widget.restaurant.orders,
//                       title: widget.restaurant.restaurant.name,
//                     )),
//           );
//         }
//       },
//       child: Container(
//         // height: cardHeight,
//         margin: EdgeInsets.symmetric(
//             horizontal: width * .035, vertical: height * .01),
//         // padding: EdgeInsets.symmetric(vertical: height * .01),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             border: Border.all(color: const Color(0xff74CE90), width: 3)),
//         child: Column(
//           children: [
//             Container(
//               height: cardHeight * .4,
//               child: Row(
//                 children: [
//                   Container(
//                     width: innerWidth * .13,
//                     height: innerWidth * .13,
//                     margin: EdgeInsets.symmetric(
//                         horizontal: innerWidth * .025, vertical: width * .025),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(50),
//                       border: Border.all(
//                           color: Theme.of(context).accentColor, width: 1.5),
//                     ),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(50),
//                       child: CachedNetworkImage(
//                         imageUrl: widget.restaurant.restaurant.image,
//                         placeholder: (context, url) => PlaceHolder(),
//                         errorWidget: (context, url, error) => Icon(Icons.error),
//                         fit: BoxFit.cover,
//                         fadeInCurve: Curves.easeInOut,
//                         fadeInDuration: Duration(milliseconds: 200),
//                       ),

//                       // Image.network(
//                       //   widget.meal.image,
//                       //   fit: BoxFit.cover,
//                       // ),
//                     ),
//                   ),
//                   Container(
//                       width: innerWidth * .6,
//                       height: cardHeight * .4,
//                       alignment: Alignment.center,
//                       // margin: EdgeInsets.symmetric(horizontal: width * .025,vertical: width * .025),

//                       child: Container(
//                         height: cardHeight * .15,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             SizedBox(
//                               // height: cardHeight * .2,
//                               child: AutoSizeText(
//                                 widget.restaurant.restaurant.name,
//                                 style: TextStyle(
//                                     fontSize: 20,
//                                     fontFamily: "Poppins",
//                                     color: Theme.of(context).buttonColor),
//                               ),
//                             ),
//                             IconButton(
//                               // height: cardHeight*.12,
//                               icon: Icon(
//                                 Icons.location_on_outlined,
//                                 color: Theme.of(context).buttonColor,
//                               ),
//                               onPressed: () {},
//                             ),
//                           ],
//                         ),
//                       )),
//                   // Container(
//                   //   width: innerWidth * .2,
//                   //     height: cardHeight * .4,
//                   //     // margin: EdgeInsets.symmetric(horizontal: width * .025,vertical: width * .025),
//                   //
//                   //     alignment: Alignment.center,
//                   //     child: Container(
//                   //       height: cardHeight * .15,
//                   //       child: SizedBox(
//                   //         // height: cardHeight * .2,
//                   //         child: AutoSizeText(widget.restaurant.ordersCount.toString(),
//                   //           style: TextStyle(fontSize: 20, fontFamily: "Poppins",color: Theme.of(context).buttonColor),
//                   //         ),
//                   //       ),
//                   //     )),
//                   Container(
//                     width: innerWidth * .15,
//                     height: innerWidth * .15,
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(50),
//                         border: Border.all(
//                             color: Theme.of(context).buttonColor, width: 2)),
//                     child: AutoSizeText(
//                       widget.restaurant.ordersCount.toString(),
//                       style: const TextStyle(
//                         fontSize: 20,
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
