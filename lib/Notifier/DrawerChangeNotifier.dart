import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoppy/Screens/Home/Widgets/CartPage.dart';
import 'package:shoppy/Screens/Home/Widgets/MainHome.dart';


class DrawerChangeNotifier extends ChangeNotifier{
  static String MainHomeDesc = "main_home";
  static String cartDesc = "cart_desc";
  Widget _body = MainHome();

  Widget _productDescc;

  Widget get getBody => _body;

  void setBody(String s){
    switch(s){
      case "main_home" : {
        // if(_productDescc == null){
        //   print("null");
        //   _productDescc = ProductDecs();
        // }
        _body = MainHome();
        notifyListeners();
        break;
      }
      case "cart_desc":{
        _body = CartPage();
        notifyListeners();
        break;
      }
    }
  }

}