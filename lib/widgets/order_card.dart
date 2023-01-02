import 'dart:io';
import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:delivery_app/data/order.dart';
import 'package:delivery_app/models/order.dart';
import 'package:delivery_app/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/map_util.dart';
import '../providers/auth.dart';

class OrderCard extends StatefulWidget {
  final OrderElement order;
  const OrderCard({Key? key, required this.order}) : super(key: key);

  @override
  _OrderCardState createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  bool extended = false;
  openwhatsapp(number) async {
    var whatsapp = "+2${number}";
    var whatsappURl_android =
        "whatsapp://send?phone=" + whatsapp + "&text=hello";
    var whatappURL_ios = "https://wa.me/$whatsapp?text=${Uri.parse("hello")}";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunchUrl(Uri.parse(whatappURL_ios))) {
        // ignore: deprecated_member_use
        await launchUrl(Uri.parse(whatappURL_ios),
            mode: LaunchMode.externalApplication);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: new Text("whatsapp no installed")));
      }
    } else {
      // android , web
      if (await canLaunchUrl(Uri.parse(whatsappURl_android))) {
        await launchUrl(Uri.parse(whatsappURl_android),
            mode: LaunchMode.externalApplication);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: new Text("whatsapp no installed")));
      }
    }
  }

  bool _loading = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final cardHeight = height * .3;
    final auth = Provider.of<Auth>(context, listen: true);

    final extendedCardHeight = height * .7;
    final innerWidth = width - width * .07;
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: width * .035, vertical: height * .01),
      // padding: EdgeInsets.only(bottom: height * .01),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xff74CE90), width: 1.5)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            // height: extendedCardHeight,
            // margin: EdgeInsets.symmetric(
            //     horizontal: width * .035, vertical: height * .01),
            // padding: EdgeInsets.only(bottom: height * .01),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: const Color(0xff74CE90), width: 1.5)),
            child: Column(
              children: [
                // Container(
                //   // height: cardHeight * .4,
                //   margin: EdgeInsets.symmetric(vertical: width * .025),

                //   child: Row(
                //     children: [
                //       Container(
                //         width: innerWidth * .13,
                //         height: innerWidth * .13,
                //         margin: EdgeInsets.symmetric(
                //             horizontal: innerWidth * .025, vertical: width * .0),
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(50),
                //           border: Border.all(
                //               color: Theme.of(context).accentColor, width: 1.5),
                //         ),
                //         child: ClipRRect(
                //           borderRadius: BorderRadius.circular(50),
                //           child: CachedNetworkImage(
                //             imageUrl: auth.theUser!.image,
                //             placeholder: (context, url) => PlaceHolder(),
                //             errorWidget: (context, url, error) => Icon(Icons.error),
                //             fit: BoxFit.cover,
                //             fadeInCurve: Curves.easeInOut,
                //             fadeInDuration: Duration(milliseconds: 200),
                //           ),

                //           // Image.network(
                //           //   widget.meal.image,
                //           //   fit: BoxFit.cover,
                //           // ),
                //         ),
                //       ),
                //       Container(
                //           width: innerWidth * .5,
                //           // height: cardHeight * .4,
                //           // alignment: Alignment.center,
                //           // margin: EdgeInsets.symmetric(horizontal: width * .025,vertical: width * .025),

                //           child: Column(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               Container(
                //                 height: cardHeight * .15,
                //                 child: SizedBox(
                //                   // height: cardHeight * .2,
                //                   child: AutoSizeText(
                //                     auth.theUser!.name,
                //                     style: TextStyle(
                //                         fontSize: 20,
                //                         fontFamily: "Poppins",
                //                         color: Theme.of(context).buttonColor),
                //                     textAlign: TextAlign.center,
                //                   ),
                //                 ),
                //               ),
                //               // TextButton(
                //               //   onPressed: () {},
                //               //   child: SizedBox(
                //               //     width: innerWidth * .7,
                //               //     child: AutoSizeText(
                //               //       " ${widget.order.resturant.address}",
                //               //       style:  TextStyle(fontSize: 20, fontFamily: "Poppins",color: Theme.of(context).canvasColor),
                //               //       maxLines: 1,
                //               //
                //               //     ),
                //               //   ),
                //               // )
                //             ],
                //           )),
                //     ],
                //   ),
                // ),

                Container(
                  height: cardHeight * .1,
                  width: width,
                  decoration: BoxDecoration(
                    color: Theme.of(context).buttonColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5.5),
                        topRight: Radius.circular(5.5)),
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: innerWidth * .025, vertical: height * .0025),
                  child: AutoSizeText(
                    AppLocalizations.of(context)!.order_summary,
                    style: TextStyle(
                        fontSize: 17,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).highlightColor),
                    maxLines: 1,
                  ),
                ),
                Container(
                  height: cardHeight * .08 * 4,
                  padding: EdgeInsets.symmetric(
                    horizontal: innerWidth * .025,
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: cardHeight * .08,
                        width: width,
                        child: AutoSizeText(
                          "${AppLocalizations.of(context)!.order_id} : ${widget.order.id}",
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: "Poppins",
                              color: Theme.of(context).buttonColor),
                          maxLines: 1,
                        ),
                      ),
                      Container(
                        height: cardHeight * .08,
                        width: width,
                        child: AutoSizeText(
                          "${AppLocalizations.of(context)!.date} : ${widget.order.dayDate!.toString().substring(0, 10)}",
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: "Poppins",
                              color: Theme.of(context).buttonColor),
                          maxLines: 1,
                        ),
                      ),
                      Container(
                        height: cardHeight * .08,
                        width: width,
                        child: AutoSizeText(
                          "${AppLocalizations.of(context)!.delivery_time} : ${widget.order.deliveryAt}",
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: "Poppins",
                              color: Theme.of(context).buttonColor),
                          maxLines: 1,
                        ),
                      ),
                      Container(
                        height: cardHeight * .08,
                        width: width,
                        child: AutoSizeText(
                          "${AppLocalizations.of(context)!.order_status}  : ${widget.order.status}",
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: "Poppins",
                              color: Theme.of(context).buttonColor),
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: cardHeight * .1,
                  width: width,
                  color: Theme.of(context).buttonColor,
                  padding: EdgeInsets.symmetric(
                      horizontal: innerWidth * .025, vertical: height * .0025),
                  child: AutoSizeText(
                    AppLocalizations.of(context)!.order_info,
                    style: TextStyle(
                        fontSize: 17,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).highlightColor),
                    maxLines: 1,
                  ),
                ),
                SizedBox(
                  // height: cardHeight * .3,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: innerWidth * .13,
                        height: innerWidth * .13,
                        margin: EdgeInsets.symmetric(
                            horizontal: innerWidth * .025,
                            vertical: width * .015),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                              color: Theme.of(context).accentColor, width: 1.5),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: CachedNetworkImage(
                            imageUrl: widget.order.mealDetails!.meal!.image,
                            placeholder: (context, url) => PlaceHolder(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                            fit: BoxFit.cover,
                            fadeInCurve: Curves.easeInOut,
                            fadeInDuration: Duration(milliseconds: 200),
                          ),

                          // Image.network(
                          //   widget.meal.image,
                          //   fit: BoxFit.cover,
                          // ),
                        ),
                      ),
                      Container(
                          width: innerWidth * .5,
                          // height: cardHeight * .4,
                          // alignment: Alignment.center,
                          // margin: EdgeInsets.symmetric(horizontal: width * .025,vertical: width * .025),

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // height: cardHeight * .15,
                                child: SizedBox(
                                  // height: cardHeight * .2,
                                  child: AutoSizeText(
                                    widget.order.mealDetails!.meal!.name,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: "Poppins",
                                        color: Theme.of(context).buttonColor),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              // TextButton(
                              //   onPressed: () {},
                              //   child: SizedBox(
                              //     width: innerWidth * .7,
                              //     child: AutoSizeText(
                              //       " ${widget.order.resturant.address}",
                              //       style:  TextStyle(fontSize: 20, fontFamily: "Poppins",color: Theme.of(context).canvasColor),
                              //       maxLines: 1,
                              //
                              //     ),
                              //   ),
                              // )
                            ],
                          )),
                      SizedBox(
                        width: innerWidth * .2,
                      )
                    ],
                  ),
                ),
                Divider(
                  color: Colors.grey,
                ),
                Container(
                  // height: cardHeight * .08 * 2,
                  padding: EdgeInsets.symmetric(
                    horizontal: innerWidth * .025,
                  ),
                  child: Column(
                    children: [
                      Container(
                        // height: cardHeight * .08,
                        width: width,
                        child: AutoSizeText(
                          "${AppLocalizations.of(context)!.meal_details} : ${widget.order.mealDetails!.meal!.description}",
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: "Poppins",
                              color: Theme.of(context).buttonColor),
                          // maxLines: 2,
                        ),
                      ),
                      Container(
                        height: cardHeight * .08,
                        width: width,
                        child: AutoSizeText(
                          "${AppLocalizations.of(context)!.size} : ${widget.order.mealDetails!.size}",
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: "Poppins",
                              color: Theme.of(context).buttonColor),
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  height: cardHeight * .1,
                  width: width,
                  color: Theme.of(context).buttonColor,
                  padding: EdgeInsets.symmetric(
                      horizontal: innerWidth * .025, vertical: height * .0025),
                  child: AutoSizeText(
                    AppLocalizations.of(context)!.delivery_address,
                    style: TextStyle(
                        fontSize: 17,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).highlightColor),
                    maxLines: 1,
                  ),
                ),
                widget.order.deliveryBoy == null
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            AppLocalizations.of(context)!.no_delivery,
                            style: TextStyle(
                                fontSize: 17,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).buttonColor),
                          ),
                        ),
                      )
                    : Column(
                        children: [
                          SizedBox(
                            // height: cardHeight * .3,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: innerWidth * .13,
                                  height: innerWidth * .13,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: innerWidth * .025,
                                      vertical: width * .015),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                        color: Theme.of(context).accentColor,
                                        width: 1.5),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: CachedNetworkImage(
                                      imageUrl: widget.order.deliveryBoy!.image,
                                      placeholder: (context, url) =>
                                          PlaceHolder(),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                      fit: BoxFit.cover,
                                      fadeInCurve: Curves.easeInOut,
                                      fadeInDuration:
                                          Duration(milliseconds: 200),
                                    ),

                                    // Image.network(
                                    //   widget.meal.image,
                                    //   fit: BoxFit.cover,
                                    // ),
                                  ),
                                ),
                                Container(
                                    width: innerWidth * .5,
                                    // height: cardHeight * .4,
                                    // alignment: Alignment.center,
                                    // margin: EdgeInsets.symmetric(horizontal: width * .025,vertical: width * .025),

                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          // height: cardHeight * .15,
                                          child: SizedBox(
                                            // height: cardHeight * .2,
                                            child: AutoSizeText(
                                              widget.order.deliveryBoy!.name,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontFamily: "Poppins",
                                                  color: Theme.of(context)
                                                      .buttonColor),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                        // TextButton(
                                        //   onPressed: () {},
                                        //   child: SizedBox(
                                        //     width: innerWidth * .7,
                                        //     child: AutoSizeText(
                                        //       " ${widget.order.resturant.address}",
                                        //       style:  TextStyle(fontSize: 20, fontFamily: "Poppins",color: Theme.of(context).canvasColor),
                                        //       maxLines: 1,
                                        //
                                        //     ),
                                        //   ),
                                        // )
                                      ],
                                    )),
                                Container(
                                    width: innerWidth * .2,
                                    // height: cardHeight * .4,
                                    alignment: Alignment.center,
                                    // margin: EdgeInsets.symmetric(horizontal: width * .025,vertical: width * .025),

                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                            // height: cardHeight * .15,
                                            child: IconButton(
                                          icon: Icon(
                                            Icons.call,
                                            color:
                                                Theme.of(context).buttonColor,
                                          ),
                                          onPressed: () {
                                            final Uri launchUri = Uri(
                                              scheme: 'tel',
                                              path: widget.order.deliveryBoy!
                                                  .phoneNumber,
                                            );
                                            launchUrl(launchUri);
                                          },
                                        )),
                                        // TextButton(
                                        //   onPressed: () {},
                                        //   child: SizedBox(
                                        //     width: innerWidth * .7,
                                        //     child: AutoSizeText(
                                        //       " ${widget.order.resturant.address}",
                                        //       style:  TextStyle(fontSize: 20, fontFamily: "Poppins",color: Theme.of(context).canvasColor),
                                        //       maxLines: 1,
                                        //
                                        //     ),
                                        //   ),
                                        // )
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),

                // Container(
                //   padding: EdgeInsets.symmetric(
                //       horizontal: innerWidth * .025, vertical: height * .01),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Row(
                //         children: [
                //           IconButton(
                //             // height: cardHeight*.12,
                //             icon: Icon(
                //               Icons.location_on_outlined,
                //               color: Theme.of(context).buttonColor,
                //             ),
                //             onPressed: () {
                //               // MapUtils.openMap(widget.order.address.latitude,
                //               //     widget.order.address.longitude);
                //             },
                //           ),
                //           IconButton(
                //             // height: cardHeight*.12,
                //             icon: Icon(
                //               Icons.chat,
                //               color: Theme.of(context).buttonColor,
                //             ),
                //             onPressed: () {
                //               // openwhatsapp(widget.order.customer.phoneNumber);
                //             },
                //           ),
                //           IconButton(
                //             // height: cardHeight*.12,
                //             icon: Icon(
                //               Icons.phone,
                //               color: Theme.of(context).buttonColor,
                //             ),
                //             onPressed: () {
                // final Uri launchUri = Uri(
                //   scheme: 'tel',
                //   path: widget.order.customer.phoneNumber,
                // );
                // launchUrl(launchUri);
                //             },
                //           ),
                //         ],
                //       ),
                //       Container(
                //         decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(20),
                //             border:
                //                 Border.all(color: const Color(0xff74CE90), width: 1)),
                //         height: cardHeight * .12,
                //         child: TextButton(
                //           onPressed: () {
                //             setState(() {
                //               extended = false;
                //             });
                //           },
                //           child: SizedBox(
                //             height: cardHeight * .12,
                //             child: AutoSizeText(
                //               AppLocalizations.of(context)!.less_details,
                //               style: TextStyle(color: Theme.of(context).buttonColor),
                //               maxLines: 1,
                //             ),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
          // (widget.order.dayDate!.day == DateTime.now().day &&
          //             widget.order.dayDate!.month == DateTime.now().month &&
          //             widget.order.dayDate!.year == DateTime.now().year) &&
          (widget.order.status == "INPROGRESS" ||
                  widget.order.status == "READY")
              ? Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: width * .035,
                  ),
                  padding: EdgeInsets.only(bottom: height * .005),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        // height: loginBtnHeight,
                        // width: width * .9,
                        child: _loading
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: Theme.of(context).primaryColor,
                                ),
                              )
                            : TextButton(
                                style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                        const EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 15)),
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Theme.of(context).buttonColor),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ))),
                                onPressed: () async {
                                  showDialog(
                                    barrierColor: Colors.black38,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 8, sigmaY: 8),
                                        child: AlertDialog(
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20.0))),
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: width * .12,
                                              vertical: height * .05),
                                          actionsAlignment:
                                              MainAxisAlignment.center,
                                          backgroundColor: Colors.white,
                                          content: Text(
                                            AppLocalizations.of(context)!
                                                .change_statues,
                                            // "Invalid UserName Or Password",
                                            style: const TextStyle(
                                                color: Color(0xff707070),
                                                fontFamily: "Poppins",
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          ),
                                          actions: [
                                            SizedBox(
                                              width: width * .27,
                                              child: TextButton(
                                                style: ButtonStyle(
                                                  shape:
                                                      MaterialStateProperty.all<
                                                          RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                      side: BorderSide(
                                                          color:
                                                              Theme.of(context)
                                                                  .buttonColor),
                                                    ),
                                                  ),
                                                  // padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: width *.04))
                                                ),
                                                child: Text(
                                                  AppLocalizations.of(context)!
                                                      .confirm,
                                                  style: TextStyle(
                                                      color: Theme.of(context)
                                                          .buttonColor),
                                                ),
                                                onPressed: () async {
                                                  final result = await Provider
                                                          .of<Auth>(context,
                                                              listen: false)
                                                      .changeOrderStatus(
                                                          widget.order.id!,
                                                          widget.order.status ==
                                                                  "INPROGRESS"
                                                              ? 2
                                                              : widget.order
                                                                          .status ==
                                                                      "READY"
                                                                  ? 3
                                                                  : 4);
                                                  // ignore: use_build_context_synchronously
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ),
                                            SizedBox(
                                              width: width * .27,
                                              child: TextButton(
                                                style: ButtonStyle(
                                                  shape:
                                                      MaterialStateProperty.all<
                                                          RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                      side: BorderSide(
                                                          color:
                                                              Theme.of(context)
                                                                  .buttonColor),
                                                    ),
                                                  ),
                                                  // padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: width *.04))
                                                ),
                                                child: Text(
                                                  AppLocalizations.of(context)!
                                                      .no,
                                                  // "No",
                                                  style: TextStyle(
                                                      color: Theme.of(context)
                                                          .buttonColor),
                                                ),
                                                onPressed: () async {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: AutoSizeText(
                                  widget.order.status == "INPROGRESS"
                                      ? AppLocalizations.of(context)!.ready
                                      : widget.order.status == "READY"
                                          ? AppLocalizations.of(context)!
                                              .on_the_way
                                          : AppLocalizations.of(context)!
                                              .delivered,
                                  style: TextStyle(fontSize: 17),
                                ),
                              ),
                      ),
                    ],
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
