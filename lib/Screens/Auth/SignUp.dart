import 'package:flutter/material.dart';
import 'package:shoppy/Common/CommomAssets.dart';
import 'package:shoppy/CommonAssets/inputForm.dart';
import 'package:shoppy/Services/AuthService.dart';
import 'package:shoppy/validator.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> _formkey = GlobalKey();
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final _auth = AuthService();
    return  Scaffold(

      body: Container(
        color: Colors.white,
        child: Padding(
          padding:  EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'SHOPPY',
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: size.height *0.04,
                    color:Colors.brown,
                    decoration: TextDecoration.underline,

                    fontWeight: FontWeight.bold
                ),

              ),
              Expanded(
                child: Stack(
                  children: [

                    Image.asset('asset/Icon.jpg'),
                    Align(
                      alignment: Alignment(0.0,0.6),
                      child: Card(
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(

                          //side: BorderSide(color: Colors.black,width: 1),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Container(

                          height:  size.height * 0.5,
                          width: size.width * 0.8,
                          child: Form(
                            key: _formkey,
                            child: Padding(
                              padding:  EdgeInsets.fromLTRB(size.width *0.03, size.height *0.06, size.width *0.03, size.height *0.01),
                              child: Column(
                                children: [
                                  TextFormField(
                                    validator:validator.ValidateEmail,
                                    onChanged: (val)=> email = val,
                                    decoration: inputdecoration.copyWith(labelText: 'Email'),
                                  ),
                                  SizedBox(height: size.height *0.02,),
                                  TextFormField(
                                    validator:(val)=>val.length < 8 ?'Password length must be 8':null,
                                    onChanged: (val)=> password = val,
                                    decoration: inputdecoration.copyWith(labelText: 'Password'),
                                  ),
                                  SizedBox(height: size.height *0.04,),
                                  Container(
                                    width: size.width *0.3,
                                    child: RaisedButton(
                                      padding: EdgeInsets.symmetric(vertical: size.height *0.01,),
                                      color: Colors.black,
                                      shape: StadiumBorder(),
                                      onPressed: () async {
                                        //TODO : method for sign in
                                        if(_formkey.currentState.validate()){
                                          await _auth.SignInWithEmailAndPassword(email, password);
                                        }
                                      },
                                      child: Center(child:
                                      Text(
                                        'Log In',
                                        style: TextStyle(
                                            fontSize: size.height *0.03,
                                            color: CommonAssets.buttontextcolor
                                        ),
                                      )),
                                    ),
                                  ),
                                  SizedBox(height: size.height *0.02,),
                                  InkWell(
                                    child: Text('Forget Password ?',
                                      style: TextStyle(
                                          fontSize: size.height *0.02
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: size.height *0.02,),
                                  InkWell(
                                    child: Text('Create Account',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: size.height *0.025
                                      ),
                                    ),
                                  )
                                  ,                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
