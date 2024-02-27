
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

Widget defaultTextFormFiled ({
  bool readOnly =false,
  Color color =Colors.white,
  String? labelText ,
  TextInputType keyBoard =TextInputType.emailAddress,
  TextEditingController? controller,
  Function(String)? onChanged ,
  //Function(String)? validate,
  Function()? onEditingComplete,
  Widget? suffixIcon ,
  Widget? prefixIcon,
  double radius = 20,
  TextStyle? labelStyle,
  bool obscureText = false,
  Function()? onTap,
  Function()? onTap1,
  AutovalidateMode autovalidateMode = AutovalidateMode.always,
}) =>
    TextFormField(
      readOnly: readOnly,
      onEditingComplete: onEditingComplete,
      keyboardType: keyBoard,
      controller: controller,
      onChanged:onChanged,
      obscureText: obscureText,
     onTap: onTap,
     // validator: validate,
      autovalidateMode: autovalidateMode,
      decoration: InputDecoration(
          filled: true,
          fillColor: color,
          labelText: labelText,
          suffixIcon: suffixIcon != null ? InkWell(
              onTap: onTap1,
              child: suffixIcon ) :
          suffixIcon,
          prefixIcon: prefixIcon,
          labelStyle: labelStyle,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius))
      ),
    );

Widget text ({
  required String text ,
  double fontSize = 20,
  FontWeight fontWeight = FontWeight.bold,
  Color color = Colors.white,

}) =>Text(text,
  style: TextStyle(
       fontSize: fontSize,
    fontWeight: fontWeight,color: color
   ),);

void navigateTo (context ,widget) => Navigator.push(context, MaterialPageRoute(builder: (context) => widget,),);
void navigateAndFinish (context ,widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
        builder:(context) => widget,
    ), (route) => false);


