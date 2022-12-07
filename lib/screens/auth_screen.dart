import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery_app/Wrappers/wrapper_auth.dart';
import 'package:delivery_app/providers/auth.dart';
import 'package:delivery_app/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool obscure = true;
  bool _loading = false;
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context, listen: false);
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final widht = size.width;
    final imgHeight = height * .2;
    final boldTextHeight = height * .09;
    final normalTextHeight = height * .08;
    final textHeight = height * .075;
    final forgetPasswordBtnHeight = height * .05;
    final loginBtnHeight = height * .075;
    final dontHaveAccountBtnHeight = height * .06;

    final paddingHeight = height * .005;
    final paddingWidth = widht * .05;
    final paddingTextHeight = height * .005;
    final paddingTextWidth = widht * .05;
    final imgPaddingHeight = height * .01;

    return Scaffold(
      // backgroundColor: Color(0xffc5ece9),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Color(0xffFFFFFF),
                Color(0xffB5E3E0),
              ])),
          height: height,
          width: widht,
          padding: EdgeInsets.symmetric(
              vertical: paddingHeight, horizontal: paddingWidth),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: imgPaddingHeight),
                    height: imgHeight,
                    width: widht,
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/images/logo.png",
                      color: Theme.of(context).buttonColor,
                      scale: 2,
                    ),
                  ),
                  Container(
                    height: boldTextHeight,
                    padding: EdgeInsets.symmetric(vertical: height * .005),
                    width: widht,
                    child: AutoSizeText(
                      AppLocalizations.of(context)!.welcome_back,
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 30,
                        color: Theme.of(context).canvasColor,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    height: normalTextHeight,
                    width: widht,
                    child: AutoSizeText(
                      AppLocalizations.of(context)!.lorem,
                      style: TextStyle(fontFamily: "Poppins", fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    height: textHeight,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Theme.of(context).backgroundColor,
                        borderRadius: BorderRadius.circular(50)),
                    margin: EdgeInsets.symmetric(
                      vertical: paddingTextHeight,
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: paddingTextHeight,
                      horizontal: paddingTextWidth,
                    ),
                    child: TextFormField(
                      style: TextStyle(color: Theme.of(context).canvasColor),

                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        icon: SvgPicture.asset(
                          "assets/images/person.svg",
                          color: Theme.of(context).primaryColor,
                        ),

                        // labelText: 'Full Name',
                        hintStyle: TextStyle(color: Colors.grey),
                        hintText: AppLocalizations.of(context)!.email +
                            " " +
                            AppLocalizations.of(context)!.or +
                            " " +
                            AppLocalizations.of(context)!.phone,
                      ),
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                      // controller: auth.fullNameController,
                      // onSaved: (value) {
                      //   _authData['fullName'] = value;
                      // },
                      // validator: _authMode == AuthMode.Signup
                      //     ? (value) {
                      //   if (value.length < 2) {
                      //     return 'Too small name!';
                      //   } else
                      //     return null;
                      // }
                      //     : null,
                    ),
                  ),
                  Container(
                    height: textHeight,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Theme.of(context).backgroundColor,
                        borderRadius: BorderRadius.circular(50)),
                    margin: EdgeInsets.symmetric(
                      vertical: paddingTextHeight,
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: paddingTextHeight,
                      horizontal: paddingTextWidth,
                    ),
                    child: TextFormField(
                      cursorColor: Theme.of(context).primaryColor,
                      style: TextStyle(color: Theme.of(context).canvasColor),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        // alignLabelWithHint: true,
                        fillColor: Theme.of(context).primaryColor,
                        suffixIcon: IconButton(
                          color: Theme.of(context).primaryColor,
                          icon: Icon(obscure
                              ? Icons.visibility_off
                              : Icons.remove_red_eye_outlined),
                          onPressed: () {
                            setState(() {
                              obscure = !obscure;
                            });
                          },
                        ),
                        icon: SvgPicture.asset(
                          "assets/images/lock.svg",
                          color: Theme.of(context).primaryColor,
                        ),
                        hintText: AppLocalizations.of(context)!.password,
                        hintStyle: TextStyle(color: Colors.grey),
                        // labelStyle:
                        //     TextStyle(color: Colors.deepOrange),
                        // labelText: 'Password'
                        // hintText: 'hintText',
                      ),
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                      obscureText: obscure,
                      // controller: auth.passwordController,
                      validator: (value) {
                        if (value!.isEmpty || value.length < 5) {
                          return 'Password is too short!';
                        } else
                          return null;
                      },
                      // onSaved: (value) {
                      //   _authData['password'] = value;
                      // },
                    ),
                  ),
                  Container(
                    height: forgetPasswordBtnHeight,
                    width: widht,
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(vertical: 5, horizontal: 15)),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => PhoneVerifyScreen()),
                        // );
                      },
                      child: AutoSizeText(
                        AppLocalizations.of(context)!.i_forget_my_password,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Poppins",
                          color: Theme.of(context).canvasColor,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: loginBtnHeight,
                    width: widht * .9,
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
                                  borderRadius: BorderRadius.circular(18.0),
                                ))),
                            onPressed: () async {
                              setState(() {
                                _loading = true;
                              });
                              try {
                                bool ok = await auth.signIn(email, password);
                                if (ok) {
                                  // ignore: use_build_context_synchronously
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => WrapperAuth()),
                                  );
                                } else {
                                  // print("no valid user or password");
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
                                              horizontal: widht * .12,
                                              vertical: height * .05),
                                          actionsAlignment:
                                              MainAxisAlignment.center,
                                          backgroundColor: Colors.white,
                                          content: Text(
                                            AppLocalizations.of(context)!
                                                .wrong_auth,
                                            // "Invalid UserName Or Password",
                                            style: TextStyle(
                                                color: Color(0xff707070),
                                                fontFamily: "Poppins",
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          ),
                                          actions: [
                                            SizedBox(
                                              width: widht * .27,
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
                                                  // AppLocalizations.of(context)!
                                                  //     .ok,
                                                  "ok",
                                                  style: TextStyle(
                                                      color: Theme.of(context)
                                                          .buttonColor),
                                                ),
                                                onPressed: () async {
                                                  await Provider.of<Auth>(
                                                          context,
                                                          listen: false)
                                                      .logout();
                                                  Navigator.of(context)
                                                      .pushReplacementNamed(
                                                          WrapperAuth
                                                              .routeName);
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                }
                              } catch (e) {
                                setState(() {
                                  _loading = false;
                                });
                              }
                              setState(() {
                                _loading = false;
                              });
                            },
                            child: AutoSizeText(
                              AppLocalizations.of(context)!.login,
                              style: TextStyle(fontSize: 25),
                            ),
                          ),
                  ),
                ],
              ),
              Container(
                height: dontHaveAccountBtnHeight,
                width: widht,
                // child: TextButton(
                //   style: ButtonStyle(
                //     padding: MaterialStateProperty.all(
                //         EdgeInsets.symmetric(vertical: 5, horizontal: 15)),
                //     foregroundColor:
                //     MaterialStateProperty.all<Color>(Colors.white),
                //   ),
                //   onPressed: () {
                //     // auth.changeAuthScreenNumber(3);
                //   },
                //   child: AutoSizeText(
                //     AppLocalizations.of(context)!.dont_have_account,
                //     style: TextStyle(
                //       fontSize: 18,
                //       fontFamily: "Poppins",
                //       color: Theme.of(context).canvasColor,
                //     ),
                //   ),
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
