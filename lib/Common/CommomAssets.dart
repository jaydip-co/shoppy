import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonAssets{
  static  Color appbacolor = Colors.white;
  static  Color appbatextcolor =Colors.black;
  static Color buttontextcolor = Colors.white;
  static Color shoppytitilecolor = Colors.red;
  static  Color appbardrawercolor =Colors.black;
  static Color textFormFeildColor = Colors.grey[200];

  //category
  static Color buttoncolor = Colors.white;

  static  InputDecoration de = InputDecoration(
    fillColor: Colors.white,
    labelStyle: TextStyle(
      fontWeight: FontWeight.w500
    ),

    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomRight: Radius.circular(35)),
      borderSide: BorderSide(
          color: textFormFeildColor
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomRight: Radius.circular(35)),
      borderSide: BorderSide(
          color: textFormFeildColor
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomRight: Radius.circular(35)),
      borderSide: BorderSide(
          color: textFormFeildColor
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomRight: Radius.circular(35)),
      borderSide: BorderSide(
          color: Colors.red
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomRight: Radius.circular(35)),
      borderSide: BorderSide(
          color: Colors.red
      ),
    ),
  );
}