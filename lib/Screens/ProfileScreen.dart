import 'package:flutter/material.dart';
import 'package:shoppy/Common/Appbar/CommonAppbar.dart';
import 'package:shoppy/Common/CommomAssets.dart';
class VendorProfile extends StatefulWidget {
  @override
  _VendorProfileState createState() => _VendorProfileState();
}

class _VendorProfileState extends State<VendorProfile> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CommonAppbar(),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                Center(
                  child: CircleAvatar(
                    radius:size.width*0.2 ,
                    backgroundColor: Theme.of(context).primaryColor,
                    child: Text('Profile'),
                  ),
                ),




            Text(
                'Shop Details',
              style: TextStyle(
                fontSize: size.height *0.025,
                fontWeight: FontWeight.bold
              ),
            ),
            Divider(color: Theme.of(context).primaryColor.withOpacity(0.5),thickness: 2,),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('ShoppyID',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: size.height *0.02,
                  ),
                ),

                Expanded(
                  child: Text(
                    '123',
                    textAlign: TextAlign.right,
                    style: TextStyle(

                      fontSize: size.height *0.02,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: size.height *0.01,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Shop Name',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: size.height *0.02,
                ),
                ),

                Expanded(
                  child: Text(
                    'Shop',
                    textAlign: TextAlign.right,
                    style: TextStyle(

                      fontSize: size.height *0.02,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: size.height *0.01,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Shop Address',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: size.height *0.02,
                  ),
                ),

                Expanded(
                  child: Text(
                    '132-vijaynagar 2 yogi chowk puna gam   surat',
                    textAlign: TextAlign.right,
                    style: TextStyle(

                      fontSize: size.height *0.02,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: size.height *0.01,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('UPI',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: size.height *0.02,
                  ),
                ),

                Expanded(
                  child: Text(
                    'UPI Id',
                    textAlign: TextAlign.right,
                    style: TextStyle(

                      fontSize: size.height *0.02,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: size.height *0.01,),
            Text(
                'Personal Information',
              style: TextStyle(
                  fontSize: size.height *0.025,
                  fontWeight: FontWeight.bold
              ),
            ),
            Divider(color: Theme.of(context).primaryColor.withOpacity(0.5),thickness: 2,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Owner Name',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: size.height *0.02,
                  ),
                ),

                Expanded(
                  child: Text(
                    'xyz',
                    textAlign: TextAlign.right,
                    style: TextStyle(

                      fontSize: size.height *0.02,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: size.height *0.01,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Owner Number',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: size.height *0.02,
                  ),
                ),

                Expanded(
                  child: Text(
                    '1234567890 b',
                    textAlign: TextAlign.right,
                    style: TextStyle(

                      fontSize: size.height *0.02,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: size.height *0.01,),
            Center(child:
            RaisedButton.icon(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 2
                )
              ),
              color: CommonAssets.shoppytitilecolor,
                onPressed: (){
                  print('Add kar'
                  );
                  },
                icon:Icon(Icons.edit), label: Text(''
                'Edit Profile',

            )))
          ],
        ),
      ),

    );
  }
}
