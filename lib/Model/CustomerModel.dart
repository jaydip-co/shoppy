


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoppy/Services/CustomerFirebaseConfig.dart';

class CustomerModel {
  String city;
  String password;
  String currentLocation ;
  String emailId;

  String firstNAme;
  String lastName ;
  String mobileNumber ;
  List<dynamic> myOrder;
  int pincode ;
  String state;
  String userId ;
  String userName;
  List<dynamic> wishlist;
  String houseNo;
  String scoietyName;
  String landMark;
  String country;
  CustomerModel({
    this.city = "",
    this.password ="",
    this.currentLocation = "",
    this.emailId = "",
    this.firstNAme = "",
    this.lastName ="",
    this.mobileNumber = "",
    this.myOrder ,
    this.pincode =0 ,
    this.state = "",
    this.userId= "",
    this.userName ="",
    this.wishlist ,
    this.country = "",
    this.landMark = "",
    this.scoietyName ="",
    this.houseNo = "",
  });

 factory CustomerModel.of(DocumentSnapshot snapshot){
   final data = snapshot.data();
   return CustomerModel(
     city: data[cCity],
     password: data[cPassword],
     currentLocation: data[cCurrentLocation],
     emailId: data[cEmail_id],
     firstNAme: data[cFirstNAme],
     lastName: data[cLast_Name],
     myOrder: List.from(data[cMy_order] ?? []) ,
     pincode: data[cPincode],
     state: data[cState],
     userId: data[cUser_id],
     userName: data[cUser_name],
     wishlist: List.from(data[cCart] ?? []),
     houseNo: data[cHouseNo],
     scoietyName: data[cSocietyName],
     landMark:  data[cLandmark],
     country: data[cCountry],
     mobileNumber: data[cMobileNumber],

   );
 }

  @override
  String toString() {
    return 'CustomerModel{city: $city, password: $password, currentLocation: $currentLocation, emailId: $emailId, firstNAme: $firstNAme, lastName: $lastName, mobileNumber: $mobileNumber, myOrder: $myOrder, pincode: $pincode, state: $state, userId: $userId, userName: $userName, wishlist: $wishlist, houseNo: $houseNo, scoietyName: $scoietyName, landMark: $landMark, country: $country}';
  }
}