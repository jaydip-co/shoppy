
import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shoppy/Model/CartModel.dart';
import 'package:shoppy/Model/CustomerModel.dart';
import 'package:shoppy/Model/ItemModel.dart';
import 'package:shoppy/Model/OrderModel.dart';
import 'package:shoppy/Model/Shop.dart';
import 'package:shoppy/Services/OrderFirebaseConfig.dart';
import 'package:shoppy/Services/SellerFirebaseConfig.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'CustomerFirebaseConfig.dart';

const String fCustomer = "Customer";
const String fSeller = "Seller";
const String fMedicine = "Medicines";
const String fGroceries = "Groceries";
const String fOrder ="Orders";
const String fCosmetics = "Cosmetics";
const String fPendingOrder = "PendingOrders";
const String fConfirmedOrder = "ConfirmedOrder";
const String fCancelOrder = "CancelOrder";
const String fAll = "All";
const String fAllOrders = "AllOrders";
const String sOrders = "orders";


class DatabaseService{
  final _ref = FirebaseFirestore.instance;
  final _sellerRef = FirebaseFirestore.instance.collection("Seller");
  String id;
  CustomerModel customer;
  List<ItemModel> medicines = [];
  List<ItemModel> groceries = [];
  List<ItemModel> cosmetics = [];
  List<CartModel> carts = [];
  final _custRef = FirebaseFirestore.instance.collection(fCustomer);
  DocumentReference _userRef;
  final _orderRef =  FirebaseFirestore.instance.collection(fAllOrders);
  final _medicineRef = FirebaseFirestore.instance.collection(fMedicine);
  final _grosseryRef = FirebaseFirestore.instance.collection(fGroceries);
  final _cosmeticsRef = FirebaseFirestore.instance.collection(fCosmetics);
  StreamController<List<ItemModel>> _medicalItemsController = BehaviorSubject<List<ItemModel>>();
  Stream<List<ItemModel>> get getMedicines => _medicalItemsController.stream;
  StreamController<List<ItemModel>> _grosseryItemController = BehaviorSubject<List<ItemModel>>();
  Stream<List<ItemModel>> get getGrossry => _grosseryItemController.stream;
  StreamController<List<ItemModel>> _cosmeticController = BehaviorSubject<List<ItemModel>>();
  Stream<List<ItemModel>> get getCosmetics => _cosmeticController.stream;
  StreamController<List<CartModel>> _cartController = BehaviorSubject<List<CartModel>>();
  Stream<List<CartModel>> get getCartItems => _cartController.stream;

  Future loadInitial() async {
    id = FirebaseAuth.instance.currentUser.uid;
    _userRef = FirebaseFirestore.instance.collection(fCustomer).doc(id);
    final doc = await _custRef.doc(id).get();
    if (doc.data() != null) {
      customer = CustomerModel.of(doc);
      print(customer.toString());
      await loadInitialItems();
      await loadCart();

    }
  }
  Future loadCart()async{
    carts = [];
    final doc = await _userRef.get();
    if(doc.data() != null){
      List<DocumentReference> refs = List.from(doc.data()[cCart]).map((e) => e as DocumentReference).toList();
      print("lennnnr" + refs.length.toString());
      for(DocumentReference ref in refs){
       final dc =  await ref.get();
       if(dc.data() != null){
         CartModel single = CartModel(dc.data());
         single.refId = ref;
         single.tempUnit = single.unit;
        if(single.sellingType == "Weight"){
          single.totalAmount = single.sellingPrice;
          single.quantity = single.quantityAsPrice.toDouble();
        }
        else{
          single.totalAmount = single.sellingPrice;
          single.quantity = 1;
        }
         carts.add(single);
       }
      }
      _cartController.sink.add(carts);
    }
  }

  void dispose(){
    _medicalItemsController.close();
    _cartController.close();
    _grosseryItemController.close();
    _cosmeticController.close();

  }

  ////////////////to fetch data/////////////////
  Future loadInitialItems() async {
    final docs = await _medicineRef.limit(5).get();
    print("lenght "+ docs.docs.length.toString());
    // docs.docs.map((e) => medicines.add(ItemModel.of(e.data())));
   for(QueryDocumentSnapshot d in docs.docs){
     print(d.data());
     medicines.add(ItemModel.of(d.data(),d.reference));
   }
    print("length" + medicines.length.toString());
    _medicalItemsController.sink.add(medicines);


    final grocDoc = await _grosseryRef.limit(5).get();
    print("lenght "+ grocDoc.docs.length.toString());
    // docs.docs.map((e) => medicines.add(ItemModel.of(e.data())));
    for(QueryDocumentSnapshot d in grocDoc.docs){
      print(d.data());
      groceries.add(ItemModel.of(d.data(),d.reference));
    }
    print("length" + medicines.length.toString());
    _grosseryItemController.sink.add(groceries);
    final cosmeticDoc = await _cosmeticsRef.limit(5).get();
    print("lenght "+ cosmeticDoc.docs.length.toString());
    // docs.docs.map((e) => medicines.add(ItemModel.of(e.data())));
    for(QueryDocumentSnapshot d in cosmeticDoc.docs){
      print(d.data());
      cosmetics.add(ItemModel.of(d.data(),d.reference));
    }
    print("length" + cosmetics.length.toString());
    _cosmeticController.sink.add(cosmetics);
   //  DocumentReference d = FirebaseFirestore.instance.collection("Customer").doc("1");
   //  final medicines = TempDatabase.MedicineMap['products'].map((e) => ItemModel.of(e,d)).toList();
   //  final groceries = TempDatabase.GroceryMap['products'].map((e) => ItemModel.of(e,d)).toList();
   //  final cosmetics = TempDatabase.CosmeticsMap['products'].map((e) => ItemModel.of(e,d)).toList();
   //  print(medicines.length);
   //  _medicalItemsController.sink.add(medicines);
   //  _grosseryItemController.sink.add(groceries);
   //  _cosmeticController.sink.add(cosmetics);
  }

  Future refressCart()async{
    await loadCart();
  }


  //////////////////////////////test///////////////////////////////////
  Future setLocation(double latitude,double longitude){
    _ref.collection("Test").doc(id).set({
      "loc": latitude.toString() + "/" + longitude.toString()
    })  ;
  }



  Future<List<Shop>> getShops(int picode) async {
    final res =  await _ref.collection(fSeller).where(sPincode,isEqualTo: picode).get();
    final lDoc = res.docs;
    List<Shop> s = lDoc.map((e){
      return Shop.of(e);
    }).toList();
    //TODO : sort by Distance
    // s.sort((a,b){
    //   final des = Geolocator.distanceBetween(a, startLongitude, endLatitude, endLongitude)
    // });
    return s;
  }
  Future uploadItem(List<File> files) async {
    firebase_storage.Reference reference = firebase_storage.FirebaseStorage.instance.ref("/image").child("image/");
    for(File f in files){
      print(f.path);
      final res = await reference.child("image"+files.indexOf(f).toString()).putFile(f);
      print(files.indexOf(f).toString() + "   /////   "+await res.ref.getDownloadURL());

    }
  }

  //////////////////to Store Data///////////////////////
  Future AddItemToCart (DocumentReference ref)async{
    await _userRef.update({
      cCart : FieldValue.arrayUnion([ref]),
    });
  }

  Future setInitilData (CustomerModel model) async {
    await _custRef.doc(id).set({
      cCity : model.city,
      cEmail_id : model.emailId,
      cFirstNAme: model.firstNAme,
      cLast_Name: model.lastName,
      cPincode: model.pincode,
      cState : model.state,
      cUser_id: id,
      cHouseNo: model.houseNo,
      cSocietyName : model.scoietyName,
      cLandmark: model.landMark,
      cCountry: model.country,
      cMobileNumber: model.mobileNumber,
      cMy_order : [],
      cCart :[],
    });
    return;
  }
  Future setInitilDataWithoutAddress(CustomerModel model) async {
    await _custRef.doc(id).set({
      cEmail_id : model.emailId,
      cFirstNAme: model.firstNAme,
      cLast_Name: model.lastName,
      cUser_id:id,
      cMobileNumber: model.mobileNumber,
    });
    return;
  }

  Future confirmOrder(OrderModel model) async {
    String orderid = getUniqueOrderId();
    await _orderRef.doc(orderid).set({
      oCustomerId : customer.userId,
      oShopName:model.shopName,
      oStatus: model.status,
      oCustomerName :model.customerName,
      oOrderTime : model.orderTime,
      oProductId : model.refId,
      oSellerId : model.sellerId,
      oDeliveryAddress : model.deliveryAddress,
      oAmount : model.amount,
      oQuantity : model.quantity,
      oUnit : model.unit,
      oProductName : model.productName,
    });
    await _sellerRef.doc(model.sellerId).update({
      sOrders : FieldValue.arrayUnion([orderid]),
    });
    await _custRef.doc(id).update({
      cMy_order : FieldValue.arrayUnion([orderid]),
    });
    await _custRef.doc(id).update({
      cCart : FieldValue.arrayRemove([model.refId]),
    });
    refressCart();

  }
  String getUniqueOrderId(){
    final date = DateTime.now();
    return date.day.toString()+date.month.toString()+date.year.toString()+date.hour.toString()+
        date.minute.toString()+date.second.toString()+date.millisecond.toString()+date.microsecond.toString();
  }


  ////////////////////////method for check first time///////////////////////////////////
  Future<bool> chechForShopRegistration() async {
    final doc = await _custRef.doc(id).get();
    if(doc.data() == null){
      print("yes");
      return true;
    }
    return false;
  }
  
  
}