import 'package:doctor_scheduler/modules/auth.dart';
import 'package:doctor_scheduler/signin.dart';
import 'package:flutter/material.dart';


class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final  _formkey = GlobalKey<FormState>();


  TextEditingController _emailController = TextEditingController();
  TextEditingController _firstnameController = TextEditingController();
  TextEditingController _lastnameController = TextEditingController();
  TextEditingController _idController = TextEditingController();
  TextEditingController _postalAddressController = TextEditingController();
  TextEditingController _postalCodeController = TextEditingController();
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
                    height: 32.0,
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
                    height: 32.0,
                  ),

                  TextFormField(
                    validator: (input) {
                      if(input.isEmpty) {
                        return 'firstname is required';
                      }

                      return null;
                    },
                    controller: _firstnameController,
                    decoration: InputDecoration(
                      hintText: 'Firstname',
                      contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0)
                    ),
                  ),

                  SizedBox(
                    height: 16.0,
                  ),

                  TextFormField(
                    validator: (input) {
                      if(input.isEmpty) {
                        return 'lastname is required';
                      }

                      return null;
                    },
                    controller: _lastnameController,
                    decoration: InputDecoration(
                      hintText: 'Lastname',
                      contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0)
                    ),
                  ),

                  SizedBox(
                    height: 16.0,
                  ),

                  TextFormField(
                    validator: (input) {
                      if(input.isEmpty) {
                        return 'id must have atleast 13 characters';
                      }

                      return null;
                    },
                    controller: _idController,
                    decoration: InputDecoration(
                      hintText: 'ID number',
                      contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0)
                    ),
                  ),

                  SizedBox(
                    height: 16.0,
                  ),


                  TextFormField(
                    validator: (input) {
                      if(input.isEmpty) {
                        return 'address is required';
                      }

                      return null;
                    },
                    controller: _postalAddressController,
                    decoration: InputDecoration(
                      hintText: 'Postal Address',
                      contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0)
                    ),
                  ),

                  SizedBox(
                    height: 16.0,
                  ),

                  TextFormField(
                    validator: (input) {
                      if(input.isEmpty) {
                        return 'postal Code required';
                      }

                      return null;
                    },
                    controller: _postalCodeController,
                    decoration: InputDecoration(
                      hintText: 'Postal Code',
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
                              builder: (BuildContext context) => SignInScreen()
                            )
                          );
                        },
                        child: Text(
                          'already have an account?',
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
                        onTap: () {
                          _signUp();
                        },
                          child: Container(
                          width: _screenSize.width * 0.4,
                          height: 50.0,
                          child: Material(
                            color: Colors.indigo,
                            borderRadius: BorderRadius.all(Radius.circular(25.0)),
                            child: Center(
                              child: Text(
                                'Sign up',
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

  _signUp() async {
    var _auth = BaseAuth();
    if(_formkey.currentState.validate()) {
      await _auth.signUp(
        _emailController.text,
        _pwdController.text
      );
    }
  }
}