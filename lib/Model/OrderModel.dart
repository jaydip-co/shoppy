

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:shoppy/Model/CartModel.dart';
import 'package:shoppy/Model/ItemModel.dart';

class OrderModel {
  String shopName;
  String productName;
  String customerName;
  String customerId;
  String sellerId;
  DocumentReference refId;
  String status;
  String expectedTime;
  String reasonForCancel;
  String orderTime;
  String deliveryTime;
  String deliveryAddress;
  double quantity;
  String unit;
  double amount;


  OrderModel({
      this.shopName,
      this.customerName,
      this.customerId,
      this.sellerId,
      this.refId,
      this.status,
      this.expectedTime,
      this.reasonForCancel,
      this.orderTime,
      this.deliveryTime,
      this.deliveryAddress,
      this.quantity,
      this.unit,
      this.amount,
  this.productName});
  factory OrderModel.fromItem(CartModel cart){
    return OrderModel(
      shopName: cart.shopName,
      sellerId: cart.sellerId,
      quantity: cart.quantity,
      unit: cart.tempUnit,
      amount:  cart.totalAmount,
      refId:  cart.refId,
      productName: cart.productName,
    );
  }

  // factory OrderModel.of(Map<String,dynamic> maps){
  //   return OrderModel(customerId: )
  //
  // }

}