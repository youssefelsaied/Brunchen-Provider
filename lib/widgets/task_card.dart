import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TaskCard extends StatefulWidget {
  Widget leading;
  String title;
  int number;
  void Function()? onTap;
  TaskCard({Key? key,
    required this.leading,
    required this.title,
  required this.number,
  required this.onTap,

  }) : super(key: key);


  @override
  _TaskCardState createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * .045,vertical: height * .01),
      padding: EdgeInsets.symmetric(vertical: height * .01),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xff74CE90),width: 3)
        ),
      child: TextButton(
        onPressed: widget.onTap,
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: width * .03),
          leading: widget.leading,
          minLeadingWidth: width * .1,
          title: Center(
            child: AutoSizeText(widget.title,style: const TextStyle(
                fontSize: 23, fontFamily:"Poppins",), maxLines: 1,),
          ),
          trailing: Container(
            width: width * .1,
            height:  width * .1,

            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Theme.of(context).primaryColor,width: 1)
            ),
            child: AutoSizeText(widget.number.toString(),style: const TextStyle(
              fontSize: 20,
            ),),
          )

        ),
      ),
      );

  }
}
