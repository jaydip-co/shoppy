import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shoppy/Common/Appbar/CommonAppbar.dart';
import 'package:shoppy/Common/CommomAssets.dart';
import 'package:shoppy/CommonAssets/inputForm.dart';
import 'package:shoppy/Screens/Home/Drawer.dart';
import 'package:shoppy/Services/DatabaseService.dart';



class AddCategory extends StatefulWidget {
  @override
  _AddCategoryState createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  final _formkey = GlobalKey<FormState>();
  File _image;
  List<File> _imagefilelist = List();
  int showimageindex = -1;
  String productitle;
  String productsellingtype;
  int sellprice;
  int MRP;
  int available;
  List<String> keywordlist =  List();
  String keyword;


  getimage(ImageSource source) async {
    PickedFile pickfile = await ImagePicker().getImage(source: source);
    setState(() {
      showimageindex = -1;
      _image = File(pickfile.path);
      _imagefilelist.add(_image);
    });
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CommonAppbar(),
      drawer: CommonDrawer(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: size.height * 0.4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: size.width * 0.7,
                          height: size.height * 0.32,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: CommonAssets.shoppytitilecolor,
                                    width: 0.5)),
                            child: showimageindex == -1
                                ? _image == null
                                    ? Center(
                                        child: Text('Select Image'),
                                      )
                                    : Image.file(_image)
                                : Image.file(_imagefilelist[showimageindex]),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RaisedButton(
                              shape: StadiumBorder(),
                              color: CommonAssets.shoppytitilecolor,
                              onPressed: () {
                                getimage(ImageSource.camera);
                              },
                              child: Icon(
                                Icons.camera,
                                color: CommonAssets.buttoncolor,
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.05,
                            ),
                            RaisedButton(
                              shape: StadiumBorder(),
                              color: CommonAssets.shoppytitilecolor,
                              onPressed: () {
                                getimage(ImageSource.gallery);
                              },
                              child: Icon(
                                Icons.folder,
                                color: CommonAssets.buttoncolor,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: CommonAssets.shoppytitilecolor,
                              width: 0.5)),
                      width: size.width * 0.2,
                      child: ListView.builder(
                          itemCount: _imagefilelist.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  showimageindex = index;
                                });
                              },
                              onLongPress: () {
                                setState(() {
                                  print('ss');
                                  showimageindex = -1;
                                  _imagefilelist.removeAt(index);
                                });
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: CommonAssets.shoppytitilecolor,
                                        width: 0.5)),
                                child: Image.file(
                                  _imagefilelist[index],
                                  height: size.height * 0.1,
                                  width: size.width * 0.18,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
              Divider(
                color: CommonAssets.shoppytitilecolor,
                thickness: 1,
              ),
              Row(
                children: [
                  Text(
                    'Details',
                    style: TextStyle(
                        color: Colors.black45,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w600,
                        fontSize: size.height * 0.03),
                  ),
                  SizedBox(width: 10,),
                  Text(
                    ':',
                    style: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.w600,
                        fontSize: size.height * 0.03),
                  ),
                ],
              ),

              SizedBox(
                height: size.height * 0.02,
              ),
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: inputforAppform.copyWith(labelText: 'Product Name'),
                      onChanged: (val)=> productitle = val,
                      validator: (val)=>val.isEmpty?'Enter The Product Title':null,
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    TextFormField(
                      decoration: inputforAppform.copyWith(labelText: "Description",counterText: ""),
                      maxLength: 150,
                      maxLines: 4,
                      minLines: 4,
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            decoration: inputforAppform.copyWith(labelText: 'MRP'),
                            onChanged: (val)=> MRP =int.parse(val),
                            validator: numbervalidtion,
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.05,
                        ),
                        Expanded(
                          child: TextFormField(
                          keyboardType: TextInputType.phone,
                          decoration: inputforAppform.copyWith(labelText: 'Selling Price'),
                          onChanged: (val)=> sellprice =int.parse(val),
                          validator: numbervalidtion,
                        ),

                        )
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(width: 10,),
                        Expanded(
                          child: Text("Unit ",
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 20,
                          ),
                          ),
                        ),

                        Expanded(
                          child: DropdownButtonFormField(
                            decoration: inputforAppform,
                            value: "KG", //// TODO : SELECT VALUE
                            onChanged: (val){
                              setState(() {
                                productsellingtype = val;
                              });
                            },
                            items: <String>['KG','Piece']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                        

                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Row(

                      children: [
                        Expanded(
                          child: Column(

                            children: [
                              // DropdownButtonFormField(
                              //   decoration: inputforAppform,
                              //   value: "KG",
                              //   onChanged: (val){
                              //     setState(() {
                              //       productsellingtype = val;
                              //     });
                              //   },
                              //   items: <String>['KG','Piece']
                              //       .map<DropdownMenuItem<String>>((String value) {
                              //     return DropdownMenuItem<String>(
                              //       value: value,
                              //       child: Text(value),
                              //     );
                              //   }).toList(),
                              // ),

                              // SizedBox(
                              //   height: size.height * 0.05,
                              // ),
                              TextFormField(
                                keyboardType: TextInputType.phone,
                                decoration: inputforAppform.copyWith(labelText: 'Available Quantity'),
                                onChanged: (val)=> available =int.parse(val),
                                validator: numbervalidtion,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: size.width *0.02,),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(5),
                            height: size.height *0.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(
                                color: CommonAssets.shoppytitilecolor,

                              ),

                            ),
                            child: Column(
                              children: [
                                SizedBox(height: 4,),
                                Row(
                                  children: [

                                    Expanded(
                                      child: TextFormField(
                                        decoration: inputforAppform.copyWith(labelText: 'Key Word'),
                                        onChanged: (val)=>keyword = val,
                                        //validator: numbervalidtion,
                                      ),
                                    ),
                                    IconButton(
                                      icon:Icon(Icons.add),
                                      onPressed: (){
                                        keywordlist.add(keyword);
                                        setState(() {
                                        });
                                      },
                                    )
                                  ],
                                ),
                                Expanded(
                                  child: ListView.builder(
                                      itemCount: keywordlist.length,
                                      itemBuilder: (context,indexkeyword){
                                        return Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(keywordlist[indexkeyword]),
                                            IconButton(
                                              onPressed: (){
                                                setState(() {
                                                  keywordlist.removeAt(indexkeyword);
                                                });
                                              },
                                              icon: Icon(Icons.cancel,color: Colors.red[200],),
                                            )
                                          ],
                                        );
                                      }),
                                )
                              ],
                            )
                          ),
                        )
                      ],
                    )

                  ],
                ),
              ),
              SizedBox(
                height: size.height *0.02,
              ),
              Center(
                child: RaisedButton(
                shape: StadiumBorder(),
                  color: CommonAssets.shoppytitilecolor,
                    onPressed: (){
                  DatabaseService().uploadItem(_imagefilelist);
                  // if(_formkey.currentState.validate()){
                  //
                  // }
                },
                  child: Text(
                      'Add Item',
                  style: TextStyle(
                    color: CommonAssets.buttontextcolor,
                    fontSize: size.height *0.02
                  ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  String numbervalidtion(String value){
    Pattern pattern = '^[0-9]+';
    RegExp regExp = new RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return 'Enter The Number Only';
    } else {
      return null;
    }
  }
}
