import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';
// import '../screens/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../helpers/custom_route.dart';

class WrapperFirstTime extends StatefulWidget {
  const WrapperFirstTime({Key? key}) : super(key: key);

  @override
  _WrapperFirstTimeState createState() => _WrapperFirstTimeState();
}

class _WrapperFirstTimeState extends State<WrapperFirstTime> with AfterLayoutMixin<WrapperFirstTime>{
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      // Navigator.of(context).pushReplacement(
      //     CustomRoute(builder: (context) =>  WrapperAuth()));
    } else {
      await prefs.setBool('seen', true);
      // Navigator.of(context).pushReplacement(
      //     CustomRoute(builder: (context) =>  OnboardingScreen()));
    }
  }

  @override
  void afterFirstLayout(BuildContext context) => checkFirstSeen();
}
