import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shoppy/Common/Appbar/CommonAppbar.dart';
import 'package:shoppy/Common/CommomAssets.dart';
import 'package:shoppy/Screens/Auth/LogIn.dart';
import 'package:shoppy/Screens/HomeScreen.dart';
import 'package:shoppy/Services/AuthService.dart';
import 'package:shoppy/Services/DatabaseService.dart';
import 'package:shoppy/Wrapper.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<DatabaseService>.value(
      value: DatabaseService(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          // primaryColor: Colors.green,
          accentColor: CommonAssets.shoppytitilecolor,
          primarySwatch: CommonAssets.shoppytitilecolor,
          // primaryColor: Colors.brown[500],
          // primarySwatch: Colors.brown[500],
          // secondaryHeaderColor: Colors.blue,
          textTheme: TextTheme(
            headline1: TextStyle(color: Colors.green),

          ),
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {
          '/' : (con) => AuthWrapper(),
        },
        // home: Provider<AuthService>(
        //   create: (con) => AuthService(),
        //     child: AuthWrapper()
        // ),
      ),
    );
  }
}

