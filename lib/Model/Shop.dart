

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoppy/Services/SellerFirebaseConfig.dart';

class Shop{
  String Name;
  String Address;
  int pincode;
  String currentLocation;
  List<dynamic> products;

  Shop({
    this.Name,
    this.Address,
    this.currentLocation,
    this.pincode,
    this.products
});
  factory Shop.of(DocumentSnapshot d){
    final data = d.data();
    return Shop(
      Name: d[sShop_Name],
      Address: d[sAddress],
      pincode: d[sPincode],
      currentLocation: d[sCurrent_location],
      products: List.from(d[sProduct]),
    );
  }
}