import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoppy/Common/CommomAssets.dart';
import 'package:shoppy/CommonAssets/inputForm.dart';
import 'package:shoppy/Screens/Auth/SignUp.dart';
import 'package:shoppy/Screens/LoadingWidget.dart';
import 'package:shoppy/Services/AuthService.dart';
import 'package:shoppy/Services/LogInAndSignIn.dart';
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
  }
  final _formkey = GlobalKey<FormState>();
  AuthService _auth = AuthService();
  String email;
  String password;
  String passwordAgain;
  bool isSignUp = false;
 bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;


    return Scaffold(

      body: isLoading ? LoadingVidget() :  Builder(
        builder: (con) => Container(
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
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextFormField(
                                      validator:validation,
                                      onChanged: (val)=> email = val,
                                      decoration: inputdecoration.copyWith(labelText: 'Email'),
                                    ),
                                    SizedBox(height: size.height *0.02,),
                                    TextFormField(
                                      validator:(val)=>val.length < 8 ?'Password length must be 8':null,
                                      onChanged: (val)=> password = val,
                                      decoration: inputdecoration.copyWith(labelText: 'Password'),
                                    ),
                                    SizedBox(height: size.height *0.02,),
                                    if(isSignUp) TextFormField(
                                      validator:(val)=> password != passwordAgain ?'Password does not match':null,
                                      onChanged: (val)=> passwordAgain = val,
                                      decoration: inputdecoration.copyWith(labelText: 'Password Again'),
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
                                            setState(() {
                                              isLoading = true;
                                            });
                                            if(isSignUp){

                                              final user = await _auth.SignUpWithaEmailAndPassword(email, password);
                                              if(user != null){
                                                SnackBar s = SnackBar(content: Text(user));
                                                Scaffold.of(con).showSnackBar(s);
                                              }
                                            }
                                            else{
                                              final user = await _auth
                                                  .SignInWithEmailAndPassword(
                                                  email, password);
                                              if(user != null){
                                                SnackBar s = SnackBar(content: Text(user));
                                                Scaffold.of(con).showSnackBar(s);
                                              }
                                            }
                                            setState(() {
                                              isLoading = false;
                                            });
                                          }
                                        },
                                        child: Center(child:
                                        Text(
                                          isSignUp ? 'Sign up' : 'Log In',
                                          style: TextStyle(
                                              fontSize: size.height *0.03,
                                              color: CommonAssets.buttontextcolor
                                          ),
                                        )),
                                      ),
                                    ),
                                    SizedBox(height: size.height *0.02,),
                                    isSignUp ? Container() : InkWell(
                                      child: Text('Forget Password ?',
                                        style: TextStyle(
                                            fontSize: size.height *0.02
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: size.height *0.02,),
                                   GestureDetector(
                                      onTap: (){
                                       setState(() {
                                         isSignUp = !isSignUp;
                                       });
                                      },
                                      child: InkWell(
                                        child: Text( isSignUp ? 'Sign In' :'Create Account',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: size.height *0.025
                                          ),
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
      ),
    );

  }
  String validation(String value){
    Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!(regex.hasMatch(value)))
      return "Invalid Email";
  }
}