//import 'package:doctor_scheduler/signup.dart';
import 'package:doctor_scheduler/signin.dart';
import 'package:flutter/material.dart';
import 'package:doctor_scheduler/home.dart';
//import 'package:firebase/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';


void main() => runApp(
  MyApp()
);




class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.indigoAccent,
        primarySwatch: Colors.indigo
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            FirebaseUser _user = snapshot.data;
            if (_user == null) {
              return SignInScreen();
            } else {
              return Home(uid: _user.uid);
            }
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(backgroundColor: Colors.blueAccent,)
            ),
          );
        },
      )
    );
  }
}