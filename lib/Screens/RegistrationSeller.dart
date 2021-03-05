

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoppy/Common/Appbar/CommonAppbar.dart';
import 'package:shoppy/Common/CommomAssets.dart';
import 'package:shoppy/Screens/Home/Drawer.dart';
class SellerResistration extends StatefulWidget {
  @override
  _SellerResistrationState createState() => _SellerResistrationState();
}

class _SellerResistrationState extends State<SellerResistration> {
  InputDecoration de = InputDecoration(
   fillColor: Colors.white,
    labelStyle: TextStyle(
      backgroundColor: Colors.green,
    ),

    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomRight: Radius.circular(35)),
      borderSide: BorderSide(
          color: Colors.green
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomRight: Radius.circular(35)),
      borderSide: BorderSide(
          color: Colors.green
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomRight: Radius.circular(35)),
      borderSide: BorderSide(
          color: Colors.green
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomRight: Radius.circular(35)),
      borderSide: BorderSide(
          color: Colors.red
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomRight: Radius.circular(35)),
      borderSide: BorderSide(
          color: Colors.red
      ),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              Text("Shop Details",
                style: TextStyle(fontSize: 25,color: Colors.black45),
              ),
              SizedBox(height: 10,),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomRight: Radius.circular(35)),
                ),
                elevation: 2,
                child: TextFormField(
                  decoration: de.copyWith(hintText:"Name ",),
                ),
              ),
              SizedBox(height: 10,),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomRight: Radius.circular(35)),
                ),
                elevation: 2,
                child: TextFormField(
                  decoration: de.copyWith(hintText:"Shop Name",),
                ),
              ),

              SizedBox(height: 10,),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomRight: Radius.circular(35)),
                ),
                elevation: 2,
                child: TextFormField(
                  decoration: de.copyWith(hintText:"Mobile Number",),
                ),
              ),
              SizedBox(height: 10,),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomRight: Radius.circular(35)),
                ),
                elevation: 2,
                child: TextFormField(
                  decoration: de.copyWith(hintText:"Email ",),
                ),
              ),

              SizedBox(height:10 ,),


              Text("Address Details",
              style: TextStyle(fontSize: 25,color: Colors.black45),
              ),
              SizedBox(height: 10,),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomRight: Radius.circular(35)),
                ),
                elevation: 2,
                child: TextFormField(
                  decoration: de.copyWith(hintText:"Shop no. ",),
                ),
              ),
              SizedBox(height: 10,),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomRight: Radius.circular(35)),
                ),
                elevation: 2,
                child: TextFormField(
                  decoration: de.copyWith(hintText:"Complex Name ",),
                ),
              ),
              SizedBox(height: 10,),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomRight: Radius.circular(35)),
                ),
                elevation: 2,
                child: TextFormField(
                  decoration: de.copyWith(hintText:"Landmark",),
                ),
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomRight: Radius.circular(35)),
                      ),
                      elevation: 2,
                      child: TextFormField(
                        decoration: de.copyWith(hintText:"City ",),
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomRight: Radius.circular(35)),
                      ),
                      elevation: 2,
                      child: TextFormField(
                        decoration: de.copyWith(hintText:"Pincode ",),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomRight: Radius.circular(35)),
                      ),
                      elevation: 2,
                      child: TextFormField(
                        decoration: de.copyWith(hintText:"State ",),
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomRight: Radius.circular(35)),
                      ),
                      elevation: 2,
                      child: TextFormField(
                        decoration: de.copyWith(hintText:"Country ",),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Text("Account Details",
                style: TextStyle(fontSize: 25,color: Colors.black45),
              ),
              SizedBox(height: 10,),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomRight: Radius.circular(35)),
                ),
                elevation: 2,
                child: TextFormField(
                  decoration: de.copyWith(hintText:"Account Name ",),
                ),
              ),
              SizedBox(height: 10,),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomRight: Radius.circular(35)),
                ),
                elevation: 2,
                child: TextFormField(
                  decoration: de.copyWith(hintText:"Account Number ",),
                ),
              ),
              SizedBox(height: 10,),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomRight: Radius.circular(35)),
                ),
                elevation: 2,
                child: TextFormField(
                  decoration: de.copyWith(hintText:"IFSC Code ",),
                ),
              ),
              SizedBox(height: 10,),
              Align(
                alignment: Alignment.center,
                child: RaisedButton(
                  elevation: 2,
                  shape: StadiumBorder(),
                  color: CommonAssets.shoppytitilecolor,
                  onPressed: (){
                    // DatabaseService().uploadItem(_imagefilelist);
                    // if(_formkey.currentState.validate()){
                    //
                    // }
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(
                        color: CommonAssets.buttontextcolor,
                        fontSize: MediaQuery.of(context).size.height *0.02
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,)

            ],
          ),
        ),
      )
    );
  }
}
