import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:provider/provider.dart';
import 'package:shoppy/Common/CommomAssets.dart';
import 'package:shoppy/Common/CommonWidget.dart';
import 'package:shoppy/Model/OrderModel.dart';
import 'package:shoppy/Services/DatabaseService.dart';
import 'package:shoppy/validator.dart';

class ConfirmCartOrder extends StatefulWidget {
  List<OrderModel> ordermodel;

  ConfirmCartOrder({this.ordermodel});

  @override
  _ConfirmCartOrderState createState() => _ConfirmCartOrderState();
}

class _ConfirmCartOrderState extends State<ConfirmCartOrder> {
  String houseNo;
  String society;
  String landmark;
  String city;
  int pincode = 0;
  String state;
  String country;
  bool isLoading = false;
  List<OrderModel> orders = [];

  String newAddress = "New Address";
  String savedAddress = "Saved Address";
  String _singleValue = "SavedAddress";

  bool isSavedAddress = true;
  TextStyle labelstyle = TextStyle(fontSize: 18, fontWeight: FontWeight.w300);
  TextStyle valueStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.w600);
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final database = Provider.of<DatabaseService>(context, listen: false);
    final customer = database.customer;
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 60, bottom: 10, right: 50, left: 50),
              child: Column(
                children: [
                  Text(
                    "Total",
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          ...widget.ordermodel.map((e) {
                            return SizedBox(
                                width: width * 0.5,
                                child: Text(e.productName ?? ""));
                          }).toList()
                        ],
                      ),
                      Column(
                        children: [
                          ...widget.ordermodel.map((e) {
                            return Text(e.quantity.toString() ?? "");
                          }).toList()
                        ],
                      ),
                      Column(
                        children: [
                          ...widget.ordermodel.map((e) {
                            return Text(e.unit ?? "");
                          }).toList()
                        ],
                      ),
                      SizedBox(
                        width: width * 0.04,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...widget.ordermodel.map((e) {
                            return Text(e.amount.toString() ?? "");
                          }).toList()
                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: width * 0.5, child: Text("")),
                  Divider(
                    height: 10,
                    thickness: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total"),
                      SizedBox(width: width * 0.2),
                      Text("500"),
                    ],
                  ),

                ],
              ),
            ),
            Text(
              "Select Address",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: width * .13,
                  child: RadioButton(
                      description: "",
                      value: "SavedAddress",
                      groupValue: _singleValue,
                      onChanged: (value) {
                        setState(() {
                          _singleValue = value;
                          isSavedAddress = true;
                        });
                      }),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: isSavedAddress
                        ? null
                        : () {
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
                              SizedBox(
                                height: height * 0.001,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      // Text("Saved address",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300),),
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      Text(
                                        "Flate no:",
                                        style: labelstyle,
                                      ),
                                      SizedBox(
                                        height: height * 0.001,
                                      ),
                                      Text(
                                        "Society Name",
                                        style: labelstyle,
                                      ),
                                      SizedBox(
                                        height: height * 0.001,
                                      ),
                                      Text(
                                        "landmark:",
                                        style: labelstyle,
                                      ),
                                      SizedBox(
                                        height: height * 0.001,
                                      ),
                                      Text(
                                        "Pincoe:",
                                        style: labelstyle,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: width * 0.01,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      // Text("Saved address",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300),),
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      Text(
                                        ":",
                                        style: labelstyle,
                                      ),
                                      SizedBox(
                                        height: height * 0.001,
                                      ),
                                      Text(
                                        ":",
                                        style: labelstyle,
                                      ),
                                      SizedBox(
                                        height: height * 0.001,
                                      ),
                                      Text(
                                        ":",
                                        style: labelstyle,
                                      ),
                                      SizedBox(
                                        height: height * 0.001,
                                      ),
                                      Text(
                                        ":",
                                        style: labelstyle,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: width * 0.01,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      Text(
                                        customer?.houseNo ?? 0.toString(),
                                        style: valueStyle,
                                      ),
                                      SizedBox(
                                        height: height * 0.001,
                                      ),
                                      Text(
                                        customer?.scoietyName ?? "",
                                        style: valueStyle,
                                      ),
                                      SizedBox(
                                        height: height * 0.001,
                                      ),
                                      Text(
                                        customer?.landMark ?? "",
                                        style: valueStyle,
                                      ),
                                      SizedBox(
                                        height: height * 0.001,
                                      ),
                                      Text(
                                        customer?.pincode.toString() ?? "",
                                        style: valueStyle,
                                      ),
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
            SizedBox(
              height: height * 0.01,
            ),
            Row(
              children: [
                SizedBox(
                  width: width * .13,
                  child: RadioButton(
                      description: "",
                      value: "NewAddress",
                      groupValue: _singleValue,
                      onChanged: (value) {
                        setState(() {
                          _singleValue = value;
                          isSavedAddress = false;
                        });
                      }),
                ),
                Expanded(
                  child: Opacity(
                    opacity: isSavedAddress ? 0.5 : 1,
                    child: GestureDetector(
                      onTap: !isSavedAddress
                          ? null
                          : () {
                        setState(() {
                          isSavedAddress = false;
                          _singleValue = "NewAddress";
                        });
                      },
                      child: Card(
                        elevation: isSavedAddress ? 0.2 : 0.5,
                        child: Form(
                          key: _key,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: Column(
                              children: [
                                Text("New Address"),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                TextFormField(
                                  enabled: !isSavedAddress,
                                  decoration: CommonAssets.de.copyWith(
                                    labelText: "house no./ Flat no.",
                                  ),
                                  onChanged: (val) => houseNo = val,
                                  validator: (val) =>
                                  val.isEmpty ? "Enter house no" : null,
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                TextFormField(
                                  enabled: !isSavedAddress,
                                  decoration: CommonAssets.de.copyWith(
                                    labelText: "Society / Apartment",
                                  ),
                                  onChanged: (val) => society = val,
                                  validator: (val) =>
                                  val.isEmpty ? "Enter Society" : null,
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                TextFormField(
                                  enabled: !isSavedAddress,
                                  decoration: CommonAssets.de.copyWith(
                                    labelText: "Landmark",
                                  ),
                                  onChanged: (val) => landmark = val,
                                  validator: (val) =>
                                  val.isEmpty ? "Enter Landmark" : null,
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        enabled: !isSavedAddress,
                                        decoration:
                                        CommonAssets.de.copyWith(
                                          labelText: "City",
                                        ),
                                        onChanged: (val) => city = val,
                                        validator: (val) => val.isEmpty
                                            ? "Enter City"
                                            : null,
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.02,
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        enabled: !isSavedAddress,
                                        initialValue: pincode.toString(),
                                        keyboardType: TextInputType.number,
                                        decoration:
                                        CommonAssets.de.copyWith(
                                          labelText: "Pincode",
                                        ),
                                        onChanged: (val) =>
                                        pincode = int.parse(val),
                                        validator: validator.varifyPincode,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        enabled: !isSavedAddress,
                                        initialValue: state,
                                        decoration:
                                        CommonAssets.de.copyWith(
                                          labelText: "State",
                                        ),
                                        onChanged: (val) => state = val,
                                        validator: (val) => val.isEmpty
                                            ? "Enter State"
                                            : null,
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.02,
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        enabled: !isSavedAddress,
                                        initialValue: country,
                                        decoration:
                                        CommonAssets.de.copyWith(
                                          labelText: "Country",
                                        ),
                                        onChanged: (val) => country = val,
                                        validator: (val) => val.isEmpty
                                            ? "Enter Country"
                                            : null,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
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
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  shape: StadiumBorder(),
                  color: Colors.grey,
                  child: Text(
                    "cancle",
                    style: TextStyle(
                        color: CommonAssets.buttontextcolor,
                        fontSize: height * 0.025),
                  ),
                ),
                CommonWidget.getRaisedButton(
                    text: "Confirm",
                    function: () async {
                      if(!isSavedAddress){
                        if(_key.currentState.validate()){

                        }
                      }
                      else{
                        setState(() {
                          isLoading = true;
                        });
                        for(OrderModel o in widget.ordermodel){
                          o.deliveryAddress = customer.houseNo+","+customer.scoietyName+", "+customer.lastName
                              +", "+customer.city+", "+customer.pincode.toString();
                          await database.confirmOrder(o);
                        }

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
    ));
  }
}
