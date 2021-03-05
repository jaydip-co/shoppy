import 'package:flutter/material.dart';
import 'package:shoppy/Common/CommomAssets.dart';

class CommonWidget {
  static AppBar getCommonWidget (){
    return AppBar(
      backgroundColor: Colors.red,
      elevation: 0,
    );
  }
  static RaisedButton getRaisedButton({String text,Function function,BuildContext context}){
    final height = MediaQuery.of(context).size.height;
    return RaisedButton(
      shape: StadiumBorder(),
      color: CommonAssets.shoppytitilecolor,
      onPressed: (){
        function();
      },

      child: Text(
        text,
        style: TextStyle(
            color: CommonAssets.buttontextcolor,
            fontSize: height *0.025
        ),
      ),
    );
  }
}