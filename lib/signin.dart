import 'package:doctor_scheduler/signup.dart';
import 'package:flutter/material.dart';

import 'package:doctor_scheduler/modules/auth.dart';


class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  final  _formkey = GlobalKey<FormState>();


  TextEditingController _emailController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: _screenSize.width * .8,
            child: Form(
              key: _formkey,
              child: Column(
                children: <Widget>[


                  SizedBox(
                    height: 200.0,
                  ),

                  TextFormField(
                    validator: (input) {
                      if(input.isEmpty) {
                        return 'email is required';
                      }

                      return null;
                    },
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0)
                    ),
                  ),

                  SizedBox(
                    height: 16.0,
                  ),

                  TextFormField(
                    validator: (input) {
                      if(input.isEmpty) {
                        return 'password must have atleast 8 characters';
                      }

                      return null;
                    },
                    controller: _pwdController,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0)
                    ),
                  ),

                  SizedBox(
                    height: 32.0,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => SignUpScreen()
                            )
                          );
                        },
                        child: Text(
                          'create an account?',
                          style: TextStyle(
                            color: Colors.indigo
                          ),
                        ),
                      )
                    ],
                  ),

                  SizedBox(
                    height: 32.0,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        onTap: () async {
                          try {
                            await _signIn();
                          } catch (e) {
                            print(e.message);
                          }
                          print(_emailController.text);
                        },
                          child: Container(
                          width: _screenSize.width * 0.4,
                          height: 50.0,
                          child: Material(
                            color: Colors.indigo,
                            borderRadius: BorderRadius.all(Radius.circular(25.0)),
                            child: Center(
                              child: Text(
                                'Sign in',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _signIn() async {
    var _auth = BaseAuth();
    if(_formkey.currentState.validate()) {
      await _auth.signIn(
        _emailController.text,
        _pwdController.text
      );
    }
  }
}