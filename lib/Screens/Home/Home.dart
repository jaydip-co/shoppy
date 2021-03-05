
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppy/Common/Appbar/CommonAppbar.dart';
import 'package:shoppy/Notifier/DrawerChangeNotifier.dart';
import 'package:shoppy/Screens/Home/Drawer.dart';
import 'package:shoppy/Screens/Home/Widgets/CartPage.dart';
import 'package:shoppy/Services/DatabaseService.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
    final _drawer = Provider.of<DrawerChangeNotifier>(context);
    return Scaffold(
      appBar: CommonAppbar(),
      drawer: CommonDrawer(),
      body: _drawer.getBody ,
    );
  }
}
