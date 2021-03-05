
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoppy/Services/ItemFirebaseConfig.dart';

class ItemModel {
  List<File> imagesToUpload;
  String productCode;
  String productName;
  String description;
  String unit;
  int availableQuantity;
  double mrp;
  double sellingPrice;
  String productType;
  List<String> keyWords;
  List<String> urls;
  DocumentReference refId;
  String shopName;
  String sellerId;
  String sellingType;
  int quantityAsPrice;
  ItemModel({this.imagesToUpload,this.productName,this.description,this.unit,
    this.availableQuantity,this.keyWords,this.mrp,this.productType,this.sellingPrice,
    this.productCode,this.urls,this.refId,this.shopName,this.sellerId,this.sellingType,this.quantityAsPrice,
  });
  factory ItemModel.of(Map<String,dynamic> map,DocumentReference ref){
    // print(map);
    return ItemModel(
      urls: List.of(map[iImages]).map((e) => e.toString()).toList(),
      productName: map[iProductName] ?? "",
      productType: map[iProductType] ?? "",
      sellingPrice: map[iSellingPrice].toDouble() ?? 0.toDouble(),
      productCode: map[iProductCode] ?? "",
      description: map[iDescription] ?? "",
      unit: map[iUnit] ?? "",
      availableQuantity: map[iAvailableQuantity] ?? 0,
      mrp: map[iMRP].toDouble() ?? 0.toDouble(),
      shopName: map[iShopName],
      sellerId: map[iSellerId],
      sellingType: map[iSellingType] ?? "",
      quantityAsPrice:  map[iQuantityAsPrice] ?? 0,
      refId: ref,
    );
  }
  copyFromSub(Map<String,dynamic> map){
    urls = List.of(map[iImages]).map((e) => e.toString()).toList();
    productName =  map[iProductName] ?? "";
    productType =  map[iProductType] ?? "";
    sellingPrice =  map[iSellingPrice].toDouble() ?? 0.toDouble();
    productCode =  map[iProductCode] ?? "";
    description =  map[iDescription] ?? "";
    unit =  map[iUnit] ?? "";
    availableQuantity = map[iAvailableQuantity] ?? 0;
    mrp = map[iMRP].toDouble() ?? 0.toDouble();
    shopName = map[iShopName];
    sellerId =  map[iSellerId];
    sellingType = map[iSellingType] ?? "";
    quantityAsPrice =  map[iQuantityAsPrice] ?? 0;
  }
}