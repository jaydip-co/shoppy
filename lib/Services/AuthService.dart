

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future SignInWithEmailAndPassword(String Email,String Password) async {
    try {
      final user = await _auth.signInWithEmailAndPassword(
          email: Email, password: Password);
      print(user.user.email);
      return null;
    }
    catch(e){
      switch(e.code){
        case 'invalid-email':
          return "invalid -email";
        case 'user-not-found':
          return "User does not exists";
        case 'wrong-password':
          return "Wrong password";
      }
    }
    // _auth.createUserWithEmailAndPassword(email: null, password: null)
  }
  Future<String> SignUpWithaEmailAndPassword(String email,String password) async {
    try {
      final user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if(user!= null){
        return null;
      }
    }
    catch(e){
      switch(e.code){
        case 'email-already-in-use':{
          return "User with that Email already Exist";
        }
      }
    }
  }

  Future signOut() async {
    await _auth.signOut();
  }
}