// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:delivery_app/models/order.dart';
// import 'package:delivery_app/models/restaurant_orders.dart';
// import 'package:delivery_app/providers/auth.dart';
// import 'package:delivery_app/widgets/order_card.dart';
// import 'package:delivery_app/widgets/placeholder.dart';
// import 'package:delivery_app/widgets/restaurant_card.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:provider/provider.dart';

// import 'app_drawer.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// class RestaurantOrdersScreen extends StatefulWidget {
//   List<RestaurantOrders> restaurantOrders = [];
//   String title;
//   RestaurantOrdersScreen({
//     Key? key,
//     required this.restaurantOrders,
//     required this.title,
//   }) : super(key: key);

//   @override
//   _RestaurantOrdersScreenState createState() => _RestaurantOrdersScreenState();
// }

// class _RestaurantOrdersScreenState extends State<RestaurantOrdersScreen> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   Widget build(BuildContext context) {
//     final height =
//         MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
//     final width = MediaQuery.of(context).size.width;
//     final auth = Provider.of<Auth>(context, listen: false);
//     return Scaffold(
//       key: _scaffoldKey,
//       backgroundColor: Theme.of(context).backgroundColor,
//       drawer: AppDrawer(height),
//       body: SafeArea(
//         child: SizedBox(
//           height: height,
//           width: width,
//           child: Column(
//             children: [
//               SizedBox(
//                 height: height * .07,
//                 width: width,
//                 child: ListTile(
//                   contentPadding:
//                       EdgeInsets.symmetric(horizontal: width * .001),
//                   leading: TextButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       child: Icon(
//                         Icons.arrow_back_ios,
//                         color: Theme.of(context).canvasColor,
//                       )),
//                   title: Center(
//                     child: AutoSizeText(
//                       widget.title,
//                       style:
//                           const TextStyle(fontSize: 20, fontFamily: "Poppins"),
//                     ),
//                   ),
//                   trailing: SizedBox(
//                     width: width * .18,
//                   ),
//                 ),
//               ),
//               Container(
//                 height: height * .88,
//                 width: width,
//                 // padding: EdgeInsets.symmetric(horizontal: width *.05),
//                 child: ListView.builder(
//                   itemBuilder: (context, index) {
//                     return RestaurantCard(
//                       restaurant: widget.restaurantOrders[index],
//                     );
//                   },
//                   itemCount: widget.restaurantOrders.length,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
