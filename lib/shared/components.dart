
import 'package:flutter/material.dart';

Widget defaultBottom ({
  double width = double.infinity,
  double height = 45,
  Color color = Colors.blueAccent,
  double radius = 18,
  required String text ,
  required Function() onPressed,
  TextStyle? style ,
}) => Container(
  width: width,
  height: height,
  decoration: BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(radius),
  ),
  child: TextButton(
    onPressed: onPressed,
    child: Text( text,style: style,),
  ),
);

Widget text ({
  required String text ,
  double fontSize =20,
  FontWeight fontWeight = FontWeight.bold,
  Color color = Colors.white,

}) =>Text(text,
  style: TextStyle(
       fontSize: fontSize,
    fontWeight: FontWeight.w500,color: Colors.white
   ),);

