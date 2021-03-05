import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shoppy/Common/Appbar/CommonAppbar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:shoppy/Common/CommomAssets.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:shoppy/Model/ItemModel.dart';
import 'package:shoppy/Screens/ConfirmAddress.dart';
import 'package:shoppy/Screens/PerticularItemScrenn/Widget/ReviewChart.dart';
import 'package:shoppy/Services/DatabaseService.dart';


class PerticularItemScreen extends StatefulWidget {
  ItemModel model;
  PerticularItemScreen({this.model});
  @override
  _PerticularItemScreenState createState() => _PerticularItemScreenState();
}

class _PerticularItemScreenState extends State<PerticularItemScreen> {
  List<charts.Series<dynamic,dynamic>> series  = [charts.Series(id: "jay", data: ["jay","dip"], domainFn: null, measureFn: null)];
  @override
  Widget build(BuildContext context) {
    final model = widget.model;
    final widht = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    print(widget.model.sellerId);
    return Scaffold(
      appBar: CommonAppbar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 0.5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 20,),
                    Padding(
                      padding: EdgeInsets.only(left: 30),
                        child: Text(
                          model.productName,
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),
                        )),
                    SizedBox(height: height * 0.02,),
                    Container(
                      height: height * 0.4,
                      child: Center(child: Image.network(model.urls[0])),
                    ),
                    SizedBox(height: height * 0.02,),
                    Row(
                      children: [
                        Text("₹"+model.sellingPrice.toString(),style: TextStyle(fontSize: 20,),),
                        SizedBox(width: widht * 0.01,),
                        Text("₹"+model.mrp.toString(),style: TextStyle(decoration: TextDecoration.lineThrough,color: Colors.red),),
                        SizedBox(width: widht * 0.01,),
                        Text("/ "+model.unit)
                      ],
                    ),
                    SizedBox(height: height * 0.02,),
                    // AutoSizeText(
                    //   "Description is good Description is good Description is good Description is good  is Description is good ",
                    //   maxLines: 4,
                    //   maxFontSize: 20,
                    //   overflow: TextOverflow.ellipsis,
                    //   minFontSize: 16,
                    // ),
                    Container(
                      color: Colors.grey[300],
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                           mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.local_shipping_outlined),
                            SizedBox(width: widht * 0.01,),
                            Text("Free Ship"),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.01,),
                    Container(
                      color: Colors.grey[300],
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.calendar_today),
                            SizedBox(width: widht * 0.01,),
                            Text("Delivery in 24 hour"),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
            Card(
              elevation: 0.5,
              child:  Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Detail",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600)),
                    SizedBox(height: height * 0.01,),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Shop : "),
                        Text(model.shopName,style: TextStyle(fontSize: 20),),
                      ],
                    ),
                    SizedBox(height: height * 0.01,),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Category : "),
                      Text(model.productType,style: TextStyle(fontSize: 20),),
                    ],
                  ),
                    SizedBox(height: height * 0.01,),
                  AutoSizeText(
                    "Description is good Description is good Description is good Description is good  is Description is good ",
                    maxLines: 4,
                    maxFontSize: 20,
                    overflow: TextOverflow.ellipsis,
                    minFontSize: 16,
                  ),
                  ],
                )
              ),
            ),
            Card(
              elevation: 0.5,
              child:  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text("Payment Methods",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600)),
                      SizedBox(height: height * 0.02,),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Icon(Icons.monetization_on_outlined,size: 50,color: CommonAssets.shoppytitilecolor,),
                              Text(" Free Case \n on Delivery"),
                            ],
                          ),
                          SizedBox(width: widht * 0.02,),
                          Column(
                            children: [
                              Icon(Icons.watch_later_outlined,size: 50,color: CommonAssets.shoppytitilecolor,),
                              Text("24 hour Return"),
                            ],
                          ),
                          SizedBox(width: widht * 0.02,),
                          Column(
                            children: [
                              Icon(Icons.home,size: 50,color: CommonAssets.shoppytitilecolor,),
                              Text("Home Delivery"),
                            ],
                          ),
                          // Text("medic",style: TextStyle(fontSize: 20),),
                        ],
                      ),
                      SizedBox(height: height * 0.01,),

                    ],
                  )
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Previous Rating",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                    SizedBox(height: height * 0.02,),
                    RatingChart(),
                  ],
                ),
              ),
            ),
            Container(height: height*0.1,),
          ],
        ),
      ),
       bottomNavigationBar: Container(
         height: height * 0.08,

         child: Row(
           crossAxisAlignment: CrossAxisAlignment.stretch,
           children: [
             Expanded(child: Container(

               child: GestureDetector(
                 onTap: () async {
                   print("Add to cart");
                   await Provider.of<DatabaseService>(context,listen: false).AddItemToCart(model.refId);
                   Fluttertoast.showToast(msg: "Added To Cart");
                 },
                 child: Center(
                     child: Row(
                       mainAxisSize: MainAxisSize.min,
                       children: [
                         Icon(Icons.shopping_cart),
                         SizedBox(width: widht * 0.01,),
                         Text("ADD TO CART"),
                       ],
                     ),
                 ),
               ),
             ),
             ),
             Expanded(child:
             GestureDetector(
               onTap: (){
                 // print("Buy Now");
                 Navigator.push(context,MaterialPageRoute(builder: (con) => ConfirmAddress(oneItem: widget.model,)));
               },
               child: Container(
                 color: CommonAssets.shoppytitilecolor,
                 child: Center(
                   child: Row(
                     mainAxisSize: MainAxisSize.min,
                     children: [
                       Icon(Icons.shopping_bag_outlined,color: Colors.white,),
                       SizedBox(width: widht * 0.01,),
                       Text("BUY NOW",style: TextStyle(color: Colors.white),),
                     ],
                   ),
                 ),
               ),
             ),
             )
           ],
         ),
       ) ,
    );
  }
}
