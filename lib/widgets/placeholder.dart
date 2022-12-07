import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PlaceHolder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final h = size.height;
    final height = size.height;
    final width = size.width;
    return Container(
        width: double.infinity,
        padding: EdgeInsets.all(4),
        height: height * .15,
        child: CircularProgressIndicator(color: Colors.green,),

      );


    // child: Center(child: CircularProgressIndicator()),
  }
}
