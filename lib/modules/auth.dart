import 'package:firebase_auth/firebase_auth.dart';


abstract class Authentication {
  Future<void> signUp(email,password);
  Future<void> signIn(email,password);
  Future<void> signOut();
}

class BaseAuth implements Authentication {

  //signUp with email and password
  Future<void> signUp(email,password) async {
    try {
      FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print(e.message);
    }
  }

  //signIn with email and password
  Future<void> signIn(email,password) async {
    try {
      FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print(e.message);
    }
  }

  //signOut
  Future<void> signOut() async {

    try {
      FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e.message);
    }

  }
}
