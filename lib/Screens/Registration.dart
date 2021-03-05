
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:shoppy/Common/Appbar/CommonAppbar.dart';
import 'package:shoppy/Common/CommomAssets.dart';
import 'package:shoppy/Common/CommonWidget.dart';
import 'package:shoppy/Model/CustomerModel.dart';
import 'package:shoppy/Screens/LoadingWidget.dart';
import 'package:shoppy/Services/AuthService.dart';
import 'package:shoppy/Services/DatabaseService.dart';
import 'package:shoppy/Wrapper.dart';
import 'package:shoppy/main.dart';
import 'package:shoppy/validator.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _key = GlobalKey<FormState>();
  CustomerModel model = CustomerModel();
  int index  = 0;
  Widget getBody(){
    switch(index){
      case 0 :
        return NameDetail(continueFunction: (){
          index ++;
          setState(() {

          });
        },
        model: model,);
      case 1:
        return AddressDetail(backFuntion: (){
          index--;
          setState(() {

          });
        },
        model: model,);
    }
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CommonAppbar(),
      body: getBody(),
    );
  }
}

class NameDetail extends StatefulWidget {
  Function continueFunction;
  CustomerModel model;
  NameDetail({this.continueFunction,this.model});

  @override
  _NameDetailState createState() => _NameDetailState();
}

class _NameDetailState extends State<NameDetail> {
  final _key = GlobalKey<FormState>();

  String firstName;
  String countryCode ="+91";

  String lastName;
  int mobileNumber;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _key,
          child: Column(
            children: [
              SizedBox(height: height * 0.04,),
              Container(
                child: Image.asset("asset/name_detail.png",
                  height: height * 0.3,),
              ),
              SizedBox(height: height * 0.05,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  initialValue: firstName,
                  decoration:CommonAssets.de.copyWith(labelText:"First Name",),
                  onChanged: (val) => firstName = val,
                  validator: (val) => val.isEmpty ? "Enter Shop Name" : null,
                ),
              ),
              SizedBox(height: height * 0.02,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  initialValue: lastName,
                  decoration:CommonAssets.de.copyWith(labelText:"Last Name",),
                  onChanged: (val) => lastName = val,
                  validator: (val) => val.isEmpty ? "Enter Shop Name" : null,
                ),
              ),
              SizedBox(height: height * 0.02,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Flexible(
                      flex: 2,
                      child: TextFormField(
                        initialValue: "+91",
                        keyboardType: TextInputType.numberWithOptions(signed: true),
                        decoration:CommonAssets.de.copyWith(),
                        onChanged: (val) =>  countryCode = val,

                        validator: (val) => val.isEmpty ? "Code" : null,
                      ),
                    ),
                    SizedBox(width: width* 0.02,),
                    Flexible(
                      flex: 8,
                      child: TextFormField(
                        initialValue: mobileNumber != null ? mobileNumber.toString() : "",
                        keyboardType: TextInputType.number,
                        decoration:CommonAssets.de.copyWith(labelText:"Mobile Number",),
                        onChanged: (val) => mobileNumber = int.parse(val),
                        validator: validator.varifyMobile,

                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.02,),
              CommonWidget.getRaisedButton(text: "Continue",function: (){
                if(_key.currentState.validate()){
                  widget.model.firstNAme = firstName;
                  widget.model.lastName = lastName;
                  widget.model.mobileNumber = countryCode+mobileNumber.toString();
                  widget.continueFunction();
                }


              },context: context),
              SizedBox(height: height * 0.02,),
              CommonWidget.getRaisedButton(text: "Log Out",function: (){
               AuthService().signOut();
              },context: context),
              SizedBox(height: height * 0.02,),

            ],
          ),
        ),
      ),
    );
  }
}

class AddressDetail extends StatefulWidget {
  Function backFuntion;
  CustomerModel model;
  AddressDetail({this.backFuntion,this.model});
  @override
  _AddressDetailState createState() => _AddressDetailState();
}

class _AddressDetailState extends State<AddressDetail> {
  String houseNo;
  String society;
  String landmark;
  String city;
  int pincode = 0;
  String state;
  String country;
  bool isLoading;
  @override
  void initState() {
    super.initState();
    setInitilData();
    // askForPermision();
  }
  Future<Position> _determinePosition() async {
    try {
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
          // askForPermision();
        }
      }



    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation);
    }
    catch(e){
    isLoading = false;
    setState(() {

    });
    }
  }
  Future askForPermision() async {
    print("other");
    if(await Permission.location.request().isGranted){
      print("granted");
      setState(() {
        isLoading = true;
      });
      return;
    }
    final p = Permission.location.status;
    if(await p.isUndetermined  || await p.isDenied){

    }
    print("other");
  }
  void setInitilData()async{

    setState(() {
      isLoading = true;
    });
    final position = await  _determinePosition();
    List<Placemark> plcasemarks = await  placemarkFromCoordinates(position.latitude,position.longitude);
    if(plcasemarks.isNotEmpty) {
      try {
        Placemark placemark = plcasemarks[0];
        // for(Placemark placemark in plcasemarks) {
        //   print(placemark.locality + "/////" +plcasemarks.indexOf(placemark).toString());
        //   print(placemark.name);
        // }
        // widget.model.longitute = position.longitude;
        // widget.model.latitute = position.latitude;
        setState(() {
          state = placemark.administrativeArea;
          print(placemark.postalCode);

          country = placemark.country;
          if (placemark.postalCode != null) {
            pincode = int.parse(placemark.postalCode);
          }
          isLoading = false;
        });
      }
      catch(e){
        setState(() {
          isLoading = false;
        });
      }
    }
    else{
      setState(() {
        isLoading = false;
      });
    }

  }


  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    DatabaseService service = Provider.of<DatabaseService>(context,listen: false);
    if(isLoading){
      return LoadingVidget();
    }
    return SingleChildScrollView(
      child: Form(
        key: _key,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () async {
                    setState(() {
                      isLoading = true;
                    });
                    await service.setInitilDataWithoutAddress(widget.model);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (con) => MyApp()));
                    setState(() {
                      isLoading = false;
                    });

                  },
                  child: InkWell(
                    child: Text("Skip",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.grey),),
                  ),
                ),
              ),
              SizedBox(height: height * 0.04,),
              Container(
                child: Image.asset("asset/address.png",
                  height: height * 0.3,),
              ),
              SizedBox(height: height * 0.02,),
              TextFormField(
                decoration:CommonAssets.de.copyWith(labelText:"house no./ Flat no.",),
                onChanged: (val) => houseNo = val,
                validator: (val) => val.isEmpty ? "Enter house no" : null,
              ),
              SizedBox(height: height * 0.02,),
              TextFormField(
                decoration:CommonAssets.de.copyWith(labelText:"Society / Apartment",),
                onChanged: (val) => society = val,
                validator: (val) => val.isEmpty ? "Enter Society" : null,
              ),
              SizedBox(height: height * 0.02,),
              TextFormField(
                decoration:CommonAssets.de.copyWith(labelText:"Landmark",),
                onChanged: (val) => landmark = val,
                validator: (val) => val.isEmpty ? "Enter Landmark" : null,
              ),
              SizedBox(height: height * 0.02,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child:   TextFormField(
                    decoration:CommonAssets.de.copyWith(labelText:"City",),
                    onChanged: (val) => city = val,
                    validator: (val) => val.isEmpty ? "Enter City" : null,
                  ),),
                  SizedBox(width: width * 0.02,),
                  Expanded(child:   TextFormField(
                    initialValue: pincode.toString(),
                    keyboardType: TextInputType.number,
                    decoration:CommonAssets.de.copyWith(labelText:"Pincode",),
                    onChanged: (val) => pincode = int.parse(val),
                    validator: validator.varifyPincode,
                  ),),

                ],
              ),
              SizedBox(height: height * 0.02,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child:   TextFormField(
                    initialValue: state,
                    decoration:CommonAssets.de.copyWith(labelText:"State",),
                    onChanged: (val) => state = val,
                    validator: (val) => val.isEmpty ? "Enter State" : null,
                  ),),
                  SizedBox(width: width * 0.02,),
                  Expanded(child:   TextFormField(
                    initialValue: country,
                    decoration:CommonAssets.de.copyWith(labelText:"Country",),
                    onChanged: (val) => country = val,
                    validator: (val) => val.isEmpty ? "Enter Country" : null,
                  ),),

                ],
              ),
              SizedBox(height: height * 0.02,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(onPressed: (){
                    widget.backFuntion();
                  },
                  child: Icon(Icons.arrow_back,color: Colors.white,size: 40,),),
                  SizedBox(width: width * 0.02,),
                  CommonWidget.getRaisedButton(text: "Save",function: () async {
                    if(_key.currentState.validate()){
                      widget.model.houseNo = houseNo;
                      widget.model.scoietyName = society;
                      widget.model.landMark = landmark;
                      widget.model.city = city;
                      widget.model.pincode = pincode;
                      widget.model.state = state;
                      widget.model.country = country;
                      widget.model.emailId = FirebaseAuth.instance.currentUser.email;
                      setState(() {
                        isLoading = true;
                      });
                      await service.setInitilData(widget.model);
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (con) => MyApp()));
                      setState(() {
                        isLoading = false;
                      });

                    }
                  },context: context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

