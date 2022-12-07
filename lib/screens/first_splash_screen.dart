import 'package:flutter/material.dart';

class FirstSplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).buttonColor,
        ),

      child: Center(
        child:   Image.asset('assets/images/logo.png',color: Colors.white,scale: 2,),
      ),
      ),
    );
  }
}
