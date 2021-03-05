import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoppy/Model/ItemModel.dart';

class CartModel extends ItemModel{
  double quantity;
  String tempUnit;
  double totalAmount = 0;
  bool selected = false;
  CartModel(Map<String,dynamic> map) {
    super.copyFromSub(map);
  }

  @override
  String toString() {
    return 'CartModel{quantity: $quantity, tempUnit: $tempUnit, totalAmount: $totalAmount}';
  }
}