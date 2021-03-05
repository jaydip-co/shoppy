import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:shoppy/Model/CustomerModel.dart';
import 'package:shoppy/Services/DatabaseService.dart';
import 'package:status_alert/status_alert.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  GlobalKey key = GlobalKey();



  Future askForPermision() async {
    // print("other");
    if(await Permission.location.request().isGranted){
      print("granted");
    }
    final p = Permission.location.status;
    if(await p.isUndetermined  || await p.isDenied){

    }
    print("other");
  }

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    // if (permission == LocationPermission.deniedForever) {
    //   return Future.error(
    //       'Location permissions are permantly denied, we cannot request permissions.');
    // }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        return Future.error(
            'Location permissions are denied (actual value: $permission).');
      }
    }

    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation);
  }

  @override
  Widget build(BuildContext context) {
    askForPermision();
  String uid = FirebaseAuth.instance.currentUser.uid;
  DatabaseService databaseService = Provider.of<DatabaseService>(context);
  print(uid);
    return Container(
      child: Scaffold(
        key: key,
        appBar: AppBar(
          // title: StreamBuilder<CustomerModel>(
          //   stream: service.getData,
          //   builder: (con,data){
          //   if(data.hasData){
          //     return Text(data.data.FirstNAme+"  // " + data.data.Wishlist[0]);
          //   }
          //   return Text("");
          //   },
          // ),
          centerTitle: true,
        ),
        body: Builder(
          builder: (con) => Center(
            child: RaisedButton(
              onPressed: () async {
                SnackBar s = SnackBar(content: Text("Wait"));
                Scaffold.of(con).showSnackBar(s);

               Position p  =  await _determinePosition();
               // print(p.latitude.toString() + "    //  " + p.longitude.toString());
               // databaseService.setLocation(p.latitude, p.longitude);
               //
               // s = SnackBar(content: Text("done"));
               // Scaffold.of(con).showSnackBar(s);
               //
               // print(Geolocator.distanceBetween(21.2262, 72.9228, 21.2153, 72.8888));

                // List<Placemark> plcasemarks = await placemarkFromCoordinates(21.2695, 72.9577);
                // print(plcasemarks.length);
                // Placemark placemark = plcasemarks[1];
                // for(Placemark placemark in plcasemarks) {
                //   print(placemark.postalCode + "/////" +plcasemarks.indexOf(placemark).toString());
                //   print(placemark.name);
                // }
                final result = await FirebaseFirestore.instance.collection("Test").doc("2").get();

                if(result.data() != null){
                  final data = result.data();
                  print(data['jay']);
                  final res = await data["jay"].get();
                  print(res.data()['jay']);
                  print(res.data()['jay']);
                }


              },
              child: Text("Button"),
            ),
          ),
        ),
      )
    );
  }

  @override
  void initState() {

  }
}
