
import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppy/Common/CommomAssets.dart';
import 'package:shoppy/Common/CommonWidget.dart';
import 'package:shoppy/Model/ItemModel.dart';
import 'package:shoppy/Screens/ConfirmAddress.dart';
import 'package:shoppy/Screens/Home/Drawer.dart';
import 'package:shoppy/Screens/LoadingWidget.dart';
import 'package:shoppy/Screens/PerticularItemScrenn/PerticularItemScreen.dart';
import 'package:shoppy/Screens/ShowAllProducts.dart';
import 'package:shoppy/Services/DatabaseService.dart';
import 'package:shoppy/Services/ItemFirebaseConfig.dart';
import 'package:shoppy/TempDatabse.dart';
class MainHome extends StatefulWidget {
  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  List<ItemModel> medicines = [];
  List<ItemModel> groceries = [];
  List<ItemModel> cosmetics = [];
  DocumentReference ref;


  @override
  void initState() {
    super.initState();
    // DocumentReference  d =  FirebaseFirestore.instance.doc("documentPath");
    // medicines = TempDatabase.MedicineMap['products'].map((e) => ItemModel.of(e,d)).toList();
    // groceries = TempDatabase.GroceryMap['products'].map((e) => ItemModel.of(e,d)).toList();
    // cosmetics = TempDatabase.CosmeticsMap['products'].map((e) => ItemModel.of(e,d)).toList();
  }
  // Widget listviewlocal(String category,List<ItemModel> list){
  //   final size = MediaQuery.of(context).size;
  //   return Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         Row(
  //           mainAxisSize: MainAxisSize.max,
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Text(
  //               category.toString(),
  //               style: TextStyle(
  //                   color: Colors.black,
  //                   fontSize: size.width * 0.04
  //
  //               ),
  //             ),
  //             Padding(
  //               padding: const EdgeInsets.all(8.0),
  //               child: InkWell(
  //                 // TODO :: routes
  //                 onTap: (){
  //                   Navigator.push(context, MaterialPageRoute(builder: (con) => ShowAllProduct(models: list,Category: category,)));
  //                 },
  //                 child: Text(
  //                   'See All',
  //                   style: TextStyle(
  //                       color: Colors.blue,
  //
  //
  //                   ),
  //                 ),
  //               ),
  //             )
  //           ],
  //         ),
  //
  //         SingleChildScrollView(
  //           scrollDirection: Axis.horizontal,
  //           child: Row(
  //             children: list.map((e) {
  //               return GestureDetector(
  //                 child: Container(
  //                   width: size.width * 0.40,
  //                   child: Card(
  //                       elevation: 6,
  //                       shape: RoundedRectangleBorder(
  //                         borderRadius: BorderRadius.all(Radius.circular(10)) ,
  //                       ),
  //                       shadowColor: Colors.grey,
  //                       child:Padding(
  //                         padding: const EdgeInsets.all(8.0),
  //                         child: Column(
  //                           mainAxisSize: MainAxisSize.min,
  //                           children: [
  //                             GestureDetector(
  //                               onTap: (){
  //                                 print("jay");
  //                                 Navigator.push(context, MaterialPageRoute(builder: (con) => PerticularItemScreen(model: e,)));
  //                               },
  //                               child: Container(
  //                                 // child: Image.asset(e.urls[0]),
  //                                 child: e.urls.length > 0 ? Image.network(e.urls[0],width: size.width * 0.3,height: size.height * 0.2,) : Image.asset("asset/Icon.jpg",height: 10,),
  //                                 // child: Image.network(
  //                                 //     'https://firebasestorage.googleapis.com/v0/b/nitesh-4ed9f.appspot.com/o/51LD7X2VDdL._SL1280_.jpg?alt=media&token=f71bc055-697a-4a38-9e68-72c8c345977b')
  //                               ),
  //                             ),
  //                             SizedBox(height: size.height * 0.008,),
  //                             AutoSizeText(e.productName,maxLines: 1,maxFontSize: 18,minFontSize: 14,overflow: TextOverflow.ellipsis,),
  //                             SizedBox(height: size.height * 0.008,),
  //                             AutoSizeText("${e.sellingPrice.toString()} (${e.unit}) jbjjbjkb njknjk",maxFontSize: 18,minFontSize: 14,overflow: TextOverflow.ellipsis,),
  //                             // Row100000
  //                             // bnm(
  //                             //   mainAxisSize: MainAxisSize.min,
  //                             //   children: [
  //                             //     SizedBox(width: size.height * 0.008,),
  //                             //     Text(e.sellingPrice.toString()),
  //                             //     SizedBox(width: size.height * 0.008,),
  //                             //     AutoSizeText("(${e.unit}) jbjjbjkbnjknnjknjknjnjnjknjk",maxFontSize: 18,minFontSize: 14,overflow: TextOverflow.ellipsis,),
  //                             //   ],
  //                             // ),
  //                             SizedBox(height: size.height * 0.01,),
  //                             Row(
  //                               mainAxisSize: MainAxisSize.min,
  //                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                               children: [
  //                                 Icon(Icons.shopping_cart),
  //                                 Container(
  //                                     width: size.width  * 0.18,
  //                                     height:size.height *0.03,
  //
  //                                     child: RaisedButton(
  //                                       color: Colors.red[200],
  //                                       onPressed: (){
  //                                       },
  //
  //                                       child: Text('Buy'),
  //                                     )
  //                                 ),
  //                               ],
  //                             ),
  //
  //
  //                           ],
  //                         ),
  //                       )
  //                   ),
  //                 ),
  //               );
  //             }).toList(),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget listviewlocal(String category,List<ItemModel> list){
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(

          ),
          height: size.height / 2.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    category.toString(),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: size.width * 0.04

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (con) => ShowAllProduct(models: list,Category: category,)));
                      },
                      child: Text(
                        'See All',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: size.width * 0.04

                        ),
                      ),
                    ),
                  )
                ],
              ),

              Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: list.map((e) {
                    return OneItemOnMain(oneItem: e,);
                  }).toList(),
                ),
              ),
            ],
          )
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    final map =TempDatabase.CosmeticsMap;
    print(map["products"].length);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final database = Provider.of<DatabaseService>(context,listen: false);
    return  SingleChildScrollView(
      child: Container(
        color: Colors.grey[200],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Container(height: height * 0.25,
            //   color: Colors.red,),
            SizedBox(height: 10,),
            if(database.cosmetics.length != 0) StreamBuilder<List<ItemModel>>(
              stream: database.getCosmetics,
              builder: (context, snapshot) {

                if(snapshot.hasData) {
                  print(snapshot.data.length);
                  return listviewlocal('Cosmetics', snapshot.data);


                }
                return Container();
              }
            ),
            SizedBox(height: 10,),
            if(database.medicines.length != 0)StreamBuilder<List<ItemModel>>(
                stream: database.getMedicines,
                builder: (context, snapshot) {

                  if(snapshot.hasData) {
                    print(snapshot.data.length);
                    return listviewlocal('Medicine', snapshot.data);


                  }
                  return Container();
                }
            ),
            SizedBox(height: 10,),
            if(database.groceries.length != 0) StreamBuilder<List<ItemModel>>(
                stream: database.getGrossry,
                builder: (context, snapshot) {

                  if(snapshot.hasData) {
                    print(snapshot.data.length);
                    return listviewlocal('Grocery', snapshot.data);


                  }
                  return Container();
                }
            ),


          ],
        ),
      ),
    );
  }
}

class OneItemOnMain extends StatefulWidget {
  ItemModel oneItem;
  OneItemOnMain({this.oneItem});
  @override
  _OneItemOnMainState createState() => _OneItemOnMainState();
}

class _OneItemOnMainState extends State<OneItemOnMain> {
  bool isAddingToCart = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return  GestureDetector(

      child: Container(
        width: size.width / 2.5,
        child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)) ,
            ),
            shadowColor: Colors.grey,
            child:Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      print("jay");
                      Navigator.push(context, MaterialPageRoute(builder: (con) => PerticularItemScreen(model: widget.oneItem,)));
                    },
                    child: Container(
                      height: size.height* 0.18,
                      // child: Image.asset(e.urls[0]),
                      child: widget.oneItem.urls.length > 0 ? Image.network(widget.oneItem.urls[0]) : Image.asset("asset/Icon.jpg"),
                      // child: Image.network(
                      //     'https://firebasestorage.googleapis.com/v0/b/nitesh-4ed9f.appspot.com/o/51LD7X2VDdL._SL1280_.jpg?alt=media&token=f71bc055-697a-4a38-9e68-72c8c345977b')
                    ),
                  ),
                  SizedBox(height: size.height * 0.008,),
                  AutoSizeText(widget.oneItem.productName,maxLines: 1,maxFontSize: 18,minFontSize: 14,overflow: TextOverflow.ellipsis,),
                  SizedBox(height: size.height * 0.008,),

                  Row(
                    children: [
                      SizedBox(width: size.height * 0.008,),
                      Text(widget.oneItem.sellingPrice.toString()),
                      SizedBox(width: size.height * 0.008,),
                      Text("(${widget.oneItem.unit})"),
                    ],
                  ),
                  SizedBox(height: size.height * 0.01,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                          onTap: (){
                            setState(() {
                              isAddingToCart = !isAddingToCart;
                            });
                          },
                          child: isAddingToCart ? Icon(Icons.done) :  Icon(Icons.shopping_cart)),
                      Container(
                          width: size.width  * 0.18,
                          height:size.height *0.03,

                          child: RaisedButton(
                            color: Colors.red[200],
                            onPressed: (){
                              Navigator.push(context,MaterialPageRoute(builder: (con) => ConfirmAddress(oneItem: widget.oneItem,)));
                            },

                            child: Text('Buy'),
                          )
                      ),
                    ],
                  ),


                ],
              ),
            )
        ),
      ),
    );
  }
}
