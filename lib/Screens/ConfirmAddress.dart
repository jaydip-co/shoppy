import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:provider/provider.dart';
import 'package:shoppy/Common/Appbar/CommonAppbar.dart';
import 'package:shoppy/Common/CommomAssets.dart';
import 'package:shoppy/Common/CommonWidget.dart';
import 'package:shoppy/Model/ItemModel.dart';
import 'package:shoppy/Model/OrderModel.dart';
import 'package:shoppy/Screens/LoadingWidget.dart';
import 'package:shoppy/Screens/Registration.dart';
import 'package:shoppy/Services/AuthService.dart';
import 'package:shoppy/Services/DatabaseService.dart';
import 'package:shoppy/TempDatabse.dart';
import 'package:shoppy/validator.dart';

class ConfirmAddress extends StatefulWidget {
  ItemModel oneItem;
  ConfirmAddress({@required this.oneItem});
  @override
  _ConfirmAddressState createState() => _ConfirmAddressState();
}

class _ConfirmAddressState extends State<ConfirmAddress> {
  String houseNo;
  String society;
  String landmark;
  String city;
  int pincode = 0;
  String state;
  String country;
  bool isLoading = false;
  OrderModel model = OrderModel();

  String newAddress = "New Address";
  String savedAddress = "Saved Address";
  String _singleValue = "SavedAddress" ;
  bool isSavedAddress=  true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final database = Provider.of<DatabaseService>(context,listen: false);
    final customer = database.customer;
    TextStyle labelstyle = TextStyle(
        fontSize: 18,
      fontWeight: FontWeight.w300
    );
    TextStyle valueStyle = TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600
    );
    final data = Provider.of<DatabaseService>(context);
    print(data.id);
    return  Scaffold(
      appBar: CommonAppbar(),
      body: isLoading ? LoadingVidget() : Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Quantity : -",style: TextStyle(color: Colors.black,fontSize: 18),),

              QuantityConfirm(oneItem: widget.oneItem,orderModel: model,),
              SizedBox(height: height * 0.01,),
              Text("Select Address",style: TextStyle(color: Colors.black,fontSize: 18),),
              SizedBox(height: height * 0.01,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RadioButton(
                    description: "",
                    value: "SavedAddress",
                    groupValue: _singleValue,
                    onChanged: (value) {
                      setState(() {
                        _singleValue = value;
                        isSavedAddress = true;
                      });
                    }

                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: isSavedAddress ? null : (){
                        setState(() {
                          isSavedAddress = true;
                          _singleValue = "SavedAddress";
                        });
                      },
                      child: Opacity(
                        opacity: isSavedAddress ? 1 : 0.5,
                        child: Card(
                          elevation: isSavedAddress ? 0.5 : 0.2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text("Old Address"),
                                SizedBox(height: height * 0.001,),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        // Text("Saved address",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300),),
                                        SizedBox(height: height * 0.01,),
                                        Text("Flate no:",style: labelstyle,),
                                        SizedBox(height: height * 0.001,),
                                        Text("Society Name",style: labelstyle,),
                                        SizedBox(height: height * 0.001,),
                                        Text("landmark:",style: labelstyle,),
                                        SizedBox(height: height * 0.001,),
                                        Text("Pincoe:",style: labelstyle,),
                                      ],
                                    ),
                                    SizedBox(width: width* 0.01,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        // Text("Saved address",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300),),
                                        SizedBox(height: height * 0.01,),
                                        Text(":",style: labelstyle,),
                                        SizedBox(height: height * 0.001,),
                                        Text(":",style: labelstyle,),
                                        SizedBox(height: height * 0.001,),
                                        Text(":",style: labelstyle,),
                                        SizedBox(height: height * 0.001,),
                                        Text(":",style: labelstyle,),
                                      ],
                                    ),
                                    SizedBox(width: width* 0.01,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        SizedBox(height: height * 0.01,),
                                        Text(customer?.houseNo ?? 0.toString(),style: valueStyle,),
                                        SizedBox(height: height * 0.001,),
                                        Text(customer?.scoietyName ?? "",style: valueStyle,),
                                        SizedBox(height: height * 0.001,),
                                        Text(customer?.landMark ?? "",style: valueStyle,),
                                        SizedBox(height: height * 0.001,),
                                        Text(customer?.pincode.toString() ?? "",style: valueStyle,),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )

            ],
          ),

              SizedBox(height: height * 0.01,),
              Row(
                children: [
                  RadioButton(
                    description: "",
                    value: "NewAddress",
                    groupValue: _singleValue,
                    onChanged: (value) {
                      setState(() {
                        _singleValue = value;
                        isSavedAddress = false;
                      });
                    }

                  ),
                  Expanded(
                    child: Opacity(
                      opacity: isSavedAddress ? 0.5 : 1,
                      child: GestureDetector(
                        onTap:  !isSavedAddress ? null : (){
                          setState(() {
                            isSavedAddress = false;
                            _singleValue = "NewAddress";
                          });
                        },
                        child: Card(
                          elevation: isSavedAddress ? 0.2 : 0.5,
                          child:  Form(
                            key: _key,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                              child: Column(
                                children: [
                                  Text("New Address"),
                                  SizedBox(height: height * 0.02,),
                                  TextFormField(
                                    enabled: !isSavedAddress,
                                    decoration:CommonAssets.de.copyWith(labelText:"house no./ Flat no.",),
                                   onChanged: (val) => houseNo = val,
                                    validator: (val) => val.isEmpty ? "Enter house no" : null,
                                  ),
                                  SizedBox(height: height * 0.02,),
                                  TextFormField(
                                    enabled: !isSavedAddress,
                                    decoration:CommonAssets.de.copyWith(labelText:"Society / Apartment",),
                                    onChanged: (val) => society = val,
                                    validator: (val) => val.isEmpty ? "Enter Society" : null,
                                  ),
                                  SizedBox(height: height * 0.02,),
                                  TextFormField(
                                    enabled: !isSavedAddress,
                                    decoration:CommonAssets.de.copyWith(labelText:"Landmark",),
                                    onChanged: (val) => landmark = val,
                                    validator: (val) => val.isEmpty ? "Enter Landmark" : null,
                                  ),
                                  SizedBox(height: height * 0.02,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(child:   TextFormField(
                                        enabled: !isSavedAddress,
                                        decoration:CommonAssets.de.copyWith(labelText:"City",),
                                        onChanged: (val) => city = val,
                                        validator: (val) => val.isEmpty ? "Enter City" : null,
                                      ),),
                                      SizedBox(width: width * 0.02,),
                                      Expanded(child:   TextFormField(
                                        enabled: !isSavedAddress,
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
                                        enabled: !isSavedAddress,
                                        initialValue: state,
                                        decoration:CommonAssets.de.copyWith(labelText:"State",),
                                        onChanged: (val) => state = val,
                                        validator: (val) => val.isEmpty ? "Enter State" : null,
                                      ),),
                                      SizedBox(width: width * 0.02,),
                                      Expanded(child:   TextFormField(
                                        enabled: !isSavedAddress,
                                        initialValue: country,
                                        decoration:CommonAssets.de.copyWith(labelText:"Country",),
                                        onChanged: (val) => country = val,
                                        validator: (val) => val.isEmpty ? "Enter Country" : null,
                                      ),),

                                    ],
                                  ),
                                  SizedBox(height: height * 0.02,),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )

                ],
              ),
              SizedBox(height: height * 0.02,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  shape: StadiumBorder(),
                    color: Colors.grey,
                    child : Text("cancle",
                      style: TextStyle(
                          color: CommonAssets.buttontextcolor,
                          fontSize: height *0.025
                      ),
                    ),
                  ),

                  CommonWidget.getRaisedButton(text: "Confirm",
                      function: () async {
                    if(!isSavedAddress){
                      if(_key.currentState.validate()){

                      }
                    }
                    else{
                      setState(() {
                        isLoading = true;
                      });


                      model.refId = widget.oneItem.refId;
                      model.sellerId = widget.oneItem.sellerId;
                      model.orderTime = "time";
                      model.customerName = customer.firstNAme + " "+ customer.lastName;
                      model.shopName =  widget.oneItem.shopName;
                      model.status = "status";
                      model.customerId = customer.userId;
                      model.deliveryAddress = customer.houseNo+","+customer.scoietyName+", "+customer.lastName
                          +", "+customer.city+", "+customer.pincode.toString();
                      await database.confirmOrder(model);
                      Navigator.popUntil(context, (route){
                        final routeSetting = route.settings;
                        print(routeSetting.name);
                        if(routeSetting.name == '/')
                          return true;
                        return false;
                      });
                      setState(() {
                        isLoading = false;
                      });
                    }
                      },
                      context: context),
                ],
              ),
    ],
    ),
        ),
      ),
    );
  }
}


class QuantityConfirm extends StatefulWidget {

  ItemModel oneItem;
  OrderModel orderModel;
  QuantityConfirm({@required this.oneItem,@required this.orderModel});
  @override
  _QuantityConfirmState createState() => _QuantityConfirmState();
}

class _QuantityConfirmState extends State<QuantityConfirm> {
  double qty = 1.0;
  String unit;
  double def = 0.5;
  double inValue = 1;
  double price = 0;
  int pcket = 1;
  String  currentUnit = "";
  calculatePriceForWeight(){
    if(unit == widget.oneItem.unit){
      price = qty * widget.oneItem.sellingPrice / widget.oneItem.quantityAsPrice;
      widget.orderModel.quantity = qty;
      widget.orderModel.unit = unit;
      widget.orderModel.amount = price;
    }
    else{
      double factor = TempDatabase.factor[widget.oneItem.unit+'-'+unit];
      price = factor * widget.oneItem.sellingPrice * qty / widget.oneItem.quantityAsPrice;
      widget.orderModel.quantity = qty;
      widget.orderModel.unit = unit;
      widget.orderModel.amount = price;
    }
  }
  calculatePriceForPacket(){
    price = pcket * widget.oneItem.sellingPrice;
    widget.orderModel.quantity = pcket.toDouble();
    widget.orderModel.unit = unit;
    widget.orderModel.amount = price;
  }
  @override
  void initState() {

    price = widget.oneItem.sellingPrice;
    unit = widget.oneItem.unit;
    qty = widget.oneItem.quantityAsPrice.toDouble();
    if(widget.oneItem.unit == "g"){
      def = 50;
    }
        super.initState();

  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if(widget.oneItem.sellingType == "Weight")
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text("Quantity : -",style: TextStyle(color: Colors.black,fontSize: 18),),
        Row(
          children: [
            // Text("Quantity :-"),
            SizedBox(width: width * 0.06,),

            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(
                    color: Theme.of(context).primaryColor
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  IconButton(icon: Icon(Icons.remove), onPressed: (){
                    if(qty > 0)
                    setState(() {

                        qty= qty - def;
                        calculatePriceForWeight();
                    });
                  }),
                  Text(qty.toDouble().toString()),
                  IconButton(

                      icon: Icon(Icons.add ), onPressed: (){

                      setState(() {
                        qty = qty + def;
                        calculatePriceForWeight();
                      });

                  }),

                ],
              ),
            ),
            SizedBox(width: width * 0.02,),

            Expanded(
              child: DropdownButtonFormField(
                hint: Text("Category"),
                decoration: CommonAssets.de,
                value: widget.oneItem.unit,
                validator: (val) => val == null ? "Select unit" : null,
                onChanged: (val){
                  unit = val;
                  if(val == 'g'){
                    qty = 100;
                      def = 50;
                      if(widget.oneItem.unit == "g"){
                        qty = widget.oneItem.quantityAsPrice.toDouble();
                      }
                      calculatePriceForWeight();
                      setState(() { });
                  }
                  else{

                      qty = 1;
                      def = 0.5;
                      if(widget.oneItem.unit == "kg"){
                        qty = widget.oneItem.quantityAsPrice.toDouble();
                      }
                      calculatePriceForWeight();
                      setState(() { });
                  }
                },
                ///TODO : attach category
                items: TempDatabase
                    .unitType[widget.oneItem.sellingType]
                    .map((e) => DropdownMenuItem<String>(
                  child: Text(e),
                  value: e,
                ))
                    .toList(),
              ),
            ),
            // Expanded(child: Container()),
            SizedBox(width: width * 0.2,)
          ],
        ),
        SizedBox(height: width * 0.02,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("price you have to pay : -"),
            SizedBox(width: width * 0.02,),
            Text("₹$price",style: TextStyle(fontSize: 20),)
          ],
        ),


      ],
    );
    if(widget.oneItem.sellingType == "Pack")
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text("Quantity : -",style: TextStyle(color: Colors.black,fontSize: 18),),
          Row(
            children: [
              // Text("Quantity :-"),
              SizedBox(width: width * 0.06,),

              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(
                      color: Theme.of(context).primaryColor
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    IconButton(icon: Icon(Icons.remove), onPressed: (){
                      if(pcket > 0)


                          pcket= pcket - 1;
                      calculatePriceForPacket();
                      setState(() { });
                    }),
                    Text(pcket.toString()),
                    IconButton(

                        icon: Icon(Icons.add ), onPressed: (){


                        pcket= pcket + 1;
                        calculatePriceForPacket();
                        setState(() {});

                    }),

                  ],
                ),
              ),
              SizedBox(width: width * 0.02,),

              Text("Packet"),
              SizedBox(width: width * 0.02,),
              Text("(${widget.oneItem.quantityAsPrice}  ${widget.oneItem.unit})"),
            ],
          ),
          SizedBox(height: width * 0.02,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("price you have to pay : -"),
              SizedBox(width: width * 0.02,),
              Text("₹$price",style: TextStyle(fontSize: 20),)
            ],
          ),


        ],
      );
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text("Quantity : -",style: TextStyle(color: Colors.black,fontSize: 18),),
        Row(
          children: [
            // Text("Quantity :-"),
            SizedBox(width: width * 0.06,),

            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(
                    color: Theme.of(context).primaryColor
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  IconButton(icon: Icon(Icons.remove), onPressed: (){
                    if(pcket > 0)


                      pcket= pcket - 1;
                    calculatePriceForPacket();
                    setState(() { });
                  }),
                  Text(pcket.toString()),
                  IconButton(

                      icon: Icon(Icons.add ), onPressed: (){


                    pcket= pcket + 1;
                    calculatePriceForPacket();
                    setState(() {});

                  }),

                ],
              ),
            ),
            SizedBox(width: width * 0.02,),

            Text("Peace"),
            SizedBox(width: width * 0.02,),
          ],
        ),
        SizedBox(height: width * 0.02,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("price you have to pay : -"),
            SizedBox(width: width * 0.02,),
            Text("₹$price",style: TextStyle(fontSize: 20),)
          ],
        ),


      ],
    );
  }
}

