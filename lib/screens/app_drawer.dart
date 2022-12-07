import 'dart:io';
import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:delivery_app/screens/language.dart';
import 'package:delivery_app/screens/main_screen.dart';
import 'package:delivery_app/screens/profile.dart';
import 'package:delivery_app/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import '../Wrappers/wrapper_auth.dart';
import '../screens/auth_screen.dart';
import '../providers/auth.dart';
// import '../providers/main_screen_provider.dart';
// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../helpers/custom_route.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppDrawer extends StatefulWidget {
  // PageController controller;
  double h;
  AppDrawer(this.h);
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    final height = widget.h;
    final width = MediaQuery.of(context).size.width;
    final drawerHeight = height * .96;
    final tileHeight = drawerHeight * .08;
    final auth = Provider.of<Auth>(context, listen: true);
    print(width);
    // final mainProvider = Provider.of<MainScreenProvider>(context);
    print('app drawer builted');
    return Container(
      color: Theme.of(context).backgroundColor,
      width: width * .75,
      child: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              height: height * .2,
              width: width * .75,
              padding: EdgeInsets.symmetric(
                  horizontal: width * .05, vertical: height * .02),
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color(0xff4ACD86),
                    Color(0xff1B9352),
                  ])),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child:
                        auth.theUser!.image == null || auth.theUser!.image == ''
                            ? SvgPicture.asset(
                                "assets/images/person.svg",
                                width: height * .08,
                                height: height * .08,
                                alignment: Alignment.center,
                                color: Colors.white60,
                              )
                            : CachedNetworkImage(
                                width: height * .08,
                                height: height * .08,
                                imageUrl: auth.theUser!.image!,
                                placeholder: (context, url) => PlaceHolder(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                                fit: BoxFit.cover,
                                fadeInCurve: Curves.easeInOut,
                                fadeInDuration: Duration(milliseconds: 200),
                              ),
                  ),
                  Container(
                    child: AutoSizeText(
                      auth.theUser!.name!,
                      style: const TextStyle(
                          fontSize: 20,
                          fontFamily: "Poppins",
                          color: Colors.white70),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: height * .8,
              width: width * .75,
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
              ),
              child: Column(
                children: [
                  Container(
                    alignment:
                        AppLocalizations.of(context)!.language == "Language"
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                    // width: width * .75,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => MainScreen()),
                        );
                      },
                      child: Container(
                        width: width * .75,
                        child: AutoSizeText(
                          AppLocalizations.of(context)!.home,
                          style: const TextStyle(
                              fontSize: 20,
                              fontFamily: "Poppins",
                              color: Colors.black),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment:
                        AppLocalizations.of(context)!.language == "Language"
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                    width: width * .75,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Profile(
                                    image: auth.theUser!.image!,
                                  )),
                        );
                      },
                      child: Container(
                        width: width * .75,
                        child: AutoSizeText(
                          AppLocalizations.of(context)!.profile,
                          style: const TextStyle(
                              fontSize: 20,
                              fontFamily: "Poppins",
                              color: Colors.black),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                  ),
                  // Container(
                  //   alignment:
                  //       AppLocalizations.of(context)!.language == "Language"
                  //           ? Alignment.centerLeft
                  //           : Alignment.centerRight,
                  //   width: width * .75,
                  //   child: TextButton(
                  //     onPressed: () {},
                  //     child: Row(
                  //       children: [
                  //         AutoSizeText(
                  //           AppLocalizations.of(context)!.wallet,
                  //           style: const TextStyle(
                  //               fontSize: 20,
                  //               fontFamily: "Poppins",
                  //               color: Colors.black),
                  //           textAlign: TextAlign.start,
                  //         ),
                  //         AutoSizeText(
                  //           "   (600 SAR)",
                  //           style: TextStyle(
                  //               fontSize: 20,
                  //               fontFamily: "Poppins",
                  //               color: Theme.of(context).buttonColor),
                  //           textAlign: TextAlign.start,
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  Container(
                    alignment:
                        AppLocalizations.of(context)!.language == "Language"
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                    width: width * .75,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Language()),
                        );
                      },
                      child: Container(
                        width: width * .75,
                        child: AutoSizeText(
                          AppLocalizations.of(context)!.language,
                          style: const TextStyle(
                              fontSize: 20,
                              fontFamily: "Poppins",
                              color: Colors.black),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                  ),
                  // Container(
                  //   alignment:
                  //       AppLocalizations.of(context)!.language == "Language"
                  //           ? Alignment.centerLeft
                  //           : Alignment.centerRight,
                  //   width: width * .75,
                  //   child: TextButton(
                  //     onPressed: () {},
                  //     child: SizedBox(
                  //       width: width * .75,
                  //       child: AutoSizeText(
                  //         AppLocalizations.of(context)!.privacy,
                  //         style: const TextStyle(
                  //             fontSize: 20,
                  //             fontFamily: "Poppins",
                  //             color: Colors.black),
                  //         textAlign: TextAlign.start,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Container(
                    alignment:
                        AppLocalizations.of(context)!.language == "Language"
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                    width: width * .75,
                    child: TextButton(
                      onPressed: () {
                        showDialog(
                          barrierColor: Colors.black38,
                          context: context,
                          builder: (BuildContext context) {
                            return BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                              child: AlertDialog(
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0))),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: width * .12,
                                    vertical: height * .05),
                                actionsAlignment: MainAxisAlignment.center,
                                backgroundColor: Colors.white,
                                content: Text(
                                  AppLocalizations.of(context)!.logout_text,
                                  style: TextStyle(
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
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            side: BorderSide(
                                                color: Theme.of(context)
                                                    .buttonColor),
                                          ),
                                        ),
                                        // padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: width *.04))
                                      ),
                                      child: Text(
                                        AppLocalizations.of(context)!.yes,
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).buttonColor),
                                      ),
                                      onPressed: () async {
                                        await Provider.of<Auth>(context,
                                                listen: false)
                                            .logout();
                                        Navigator.of(context)
                                            .pushReplacementNamed(
                                                WrapperAuth.routeName);
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * .27,
                                    child: TextButton(
                                      style: ButtonStyle(
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                          ),
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Theme.of(context)
                                                      .buttonColor)),
                                      child: Text(
                                        AppLocalizations.of(context)!.no,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: SizedBox(
                        width: width * .75,
                        child: AutoSizeText(
                          AppLocalizations.of(context)!.logout,
                          style: const TextStyle(
                              fontSize: 20,
                              fontFamily: "Poppins",
                              color: Colors.black87),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
