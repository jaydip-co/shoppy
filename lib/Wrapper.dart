import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppy/Notifier/DrawerChangeNotifier.dart';
import 'package:shoppy/Screens/Auth/LogIn.dart';
import 'file:///E:/jay/flutter/shoppy/lib/Screens/Home/Home.dart';
import 'package:shoppy/Screens/Home/Widgets/MainHome.dart';
import 'package:shoppy/Screens/LoadingWidget.dart';
import 'package:shoppy/Screens/Registration.dart';
import 'package:shoppy/Screens/RegistrationSeller.dart';
import 'package:shoppy/Screens/SplashScreen.dart';
import 'package:shoppy/Services/DatabaseService.dart';
import 'package:shoppy/pages/AddCategory.dart';





import 'Screens/HomeScreen.dart';


class AuthWrapper extends StatefulWidget {
  @override
  //
  _AuthWrapperState createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  @override
  Widget build(BuildContext context) {
    // return ChangeNotifierProvider<BottomNavigationProvider>.value(
    //     value: BottomNavigationProvider(),
    //     child: HomeScreen()
    // );
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context,AsyncSnapshot<User> snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting)
          return CircularProgressIndicator();
        if(!snapshot.hasData || snapshot.data == null)
        {
          return Login();
        }
        else{
          print(snapshot.data.uid);
          return HomeWrapper(service: Provider.of<DatabaseService>(context,listen: false),);
          //
          // _service = DatabaseService(id: snapshot.data.uid);
          // return FutureBuilder<bool>(
          //   future: _service.chechForShopRegistration(),
          //     builder:(context,data){
          //   if(!data.hasData){
          //     return LoadingVidget();
          //   }
          //   else if(data.data){
          //       return Registration();
          //     }
          //   return ChangeNotifierProvider<DrawerChangeNotifier>.value(
          //       value: DrawerChangeNotifier(),
          //       child: Home(databaseService: ,));
          // }
          // );
          // return ChangeNotifierProvider<BottomNavigationProvider>.value(
          //     value: BottomNavigationProvider(),
          //     child: HomeScreen()
          // );
        }
      },
    );
  }
}

class HomeWrapper extends StatefulWidget {
  DatabaseService service;
  HomeWrapper({this.service});
  @override
  _HomeWrapperState createState() => _HomeWrapperState();
}

class _HomeWrapperState extends State<HomeWrapper> {
  bool isSplash = false;
  @override
  void initState() {

    super.initState();
    loadDatabase();
  }
  loadDatabase() async {
    setState(() {
      isSplash = true;
    });
    await widget.service.loadInitial();
    setState(() {
      isSplash = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(isSplash)
      return SplashSreen();
    if(widget.service.customer == null){
      return Registration();
    }
    return ChangeNotifierProvider<DrawerChangeNotifier>.value(
        value: DrawerChangeNotifier(),
        child: Home()
    );
  }
}
