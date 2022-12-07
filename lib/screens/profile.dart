import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:delivery_app/providers/auth.dart';
import 'package:delivery_app/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'app_drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Profile extends StatefulWidget {
  String image;
  Profile({Key? key, required this.image}) : super(key: key);
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context, listen: true);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).backgroundColor,
      drawer: AppDrawer(height),
      body: SafeArea(
        child: SizedBox(
          height: height,
          width: width,
          child: Column(
            children: [
              SizedBox(
                height: height * .07,
                width: width,
                child: ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: width * .001),
                  leading: TextButton(
                    onPressed: () {
                      _scaffoldKey.currentState!.openDrawer();
                    },
                    child: SvgPicture.asset(
                      "assets/images/menu.svg",
                    ),
                  ),
                  title: Center(
                    child: AutoSizeText(
                      AppLocalizations.of(context)!.profile,
                      style:
                          const TextStyle(fontSize: 20, fontFamily: "Poppins"),
                    ),
                  ),
                  trailing: SizedBox(
                    width: width * .18,
                    // child: SvgPicture.asset(
                    //   "assets/images/edit.svg",
                    // ),
                  ),
                ),
              ),
              Container(
                height: height * .8,
                width: width,
                padding: EdgeInsets.symmetric(horizontal: width * .05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: AutoSizeText(
                            AppLocalizations.of(context)!.profile_picture,
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: "Poppins",
                                color: Theme.of(context).buttonColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: auth.theUser!.image == null ||
                                    auth.theUser!.image == ''
                                ? SvgPicture.asset(
                                    "assets/images/person.svg",
                                    width: height * .08,
                                    height: height * .08,
                                    // alignment: Alignment.center,
                                    color: Colors.black54,
                                  )
                                : CachedNetworkImage(
                                    width: height * .15,
                                    height: height * .15,
                                    imageUrl: auth.theUser!.image!,
                                    placeholder: (context, url) =>
                                        PlaceHolder(),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                    fit: BoxFit.cover,
                                    fadeInCurve: Curves.easeInOut,
                                    fadeInDuration: Duration(milliseconds: 200),
                                  ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: height * .02),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: AutoSizeText(
                              AppLocalizations.of(context)!.full_name,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: "Poppins",
                                  color: Theme.of(context).buttonColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: AutoSizeText(
                              auth.theUser!.name!,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: "Poppins",
                                  color: Theme.of(context).canvasColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: height * .02),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: AutoSizeText(
                              AppLocalizations.of(context)!.phone,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: "Poppins",
                                  color: Theme.of(context).buttonColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: AutoSizeText(
                              auth.theUser!.phoneNumber!,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: "Poppins",
                                  color: Theme.of(context).canvasColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: height * .02),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: AutoSizeText(
                              AppLocalizations.of(context)!.e_mail,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: "Poppins",
                                  color: Theme.of(context).buttonColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: AutoSizeText(
                              auth.theUser!.email!,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: "Poppins",
                                  color: Theme.of(context).canvasColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
