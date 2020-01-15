import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_scheduler/modules/appointment.dart';
import 'package:doctor_scheduler/modules/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
  


class Home extends StatefulWidget {
  final String uid;
  Home({this.uid});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _searchController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top:16.0, left: 16.0, right: 16.0),
                    child: Text(
                      'Search doctor',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w600,

                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (BuildContext context) => MyAppointmentScreen(uid: widget.uid,)
                          ));
                        },

                        icon: Icon(Icons.person),
                      ),
                      SizedBox(width: 10.0,),
                      IconButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (BuildContext context) => Settings()
                          ));
                        },

                        icon: Icon(Icons.settings),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    color: Colors.blue[200]
                  ),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'search',
                      hintStyle: TextStyle(
                        fontSize: 22.0,
                        color: Colors.blueAccent
                      ),
                      prefixIcon: Icon(Icons.search),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 15.0, 20.0)
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  'Your recent doctors',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.blueAccent
                  ),
                ),
              ),

              Container(
                height: 140,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context, 
                              MaterialPageRoute(
                                builder: (BuildContext context) => Specializaion()
                              )
                            );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [BoxShadow(
                              color: Colors.grey[200],
                              offset: Offset(1.0, 3.0)
                            )],
                            color: Colors.white,
                          ),
                          
                          height: 140,
                          width: 140.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Colors.blueAccent,
                                radius: 25.0,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text(
                                    'Name',
                                    style: TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.w600
                                    ),
                                  ),
                                  Text(
                                    'Child specialist',
                                    style: TextStyle(
                                      color: Colors.grey
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[

                        //----
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context, 
                              MaterialPageRoute(
                                builder: (BuildContext context) => Doctors()
                              )
                            );
                          },
                          child: Container(
                            height: 150,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  width: 120,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                    color: Colors.white,
                                    boxShadow: [BoxShadow(
                                      color: Colors.grey[200],
                                      offset: Offset(0.0, 3.0)
                                    )],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    width: 100,
                                    child: Text(
                                      'General Practitioner',
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.grey
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),

                        //----
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context, 
                              MaterialPageRoute(
                                builder: (BuildContext context) => Doctors()
                              )
                            );
                          },
                          child: Container(
                            height: 150,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  width: 120,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                    color: Colors.white,
                                    boxShadow: [BoxShadow(
                                      color: Colors.grey[200],
                                      offset: Offset(0.0, 3.0)
                                    )],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    width: 100,
                                    child: Text(
                                      'Obsterics gynocologist',
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.grey
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),

                        //----
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context, 
                              MaterialPageRoute(
                                builder: (BuildContext context) => Doctors()
                              )
                            );
                          },
                          child: Container(
                            height: 150,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  width: 120,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                    color: Colors.white,
                                    boxShadow: [BoxShadow(
                                      color: Colors.grey[200],
                                      offset: Offset(0.0, 3.0)
                                    )],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    width: 100,
                                    child: Text(
                                      'Child specialist',
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.grey
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),

                        
                        
                      ],
                    ),

                    //-------

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[

                        //----
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context, 
                              MaterialPageRoute(
                                builder: (BuildContext context) => Doctors()
                              )
                            );
                          },
                          child: Container(
                            height: 150,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  width: 120,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                    color: Colors.white,
                                    boxShadow: [BoxShadow(
                                      color: Colors.grey[200],
                                      offset: Offset(0.0, 3.0)
                                    )],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    width: 100,
                                    child: Text(
                                      'Internal Medicine',
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.grey
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),

                        //----
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context, 
                              MaterialPageRoute(
                                builder: (BuildContext context) => Doctors()
                              )
                            );
                          },
                          child: Container(
                            height: 150,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  width: 120,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                    color: Colors.white,
                                    boxShadow: [BoxShadow(
                                      color: Colors.grey[200],
                                      offset: Offset(0.0, 3.0)
                                    )],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    width: 100,
                                    child: Text(
                                      'Dentist',
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.grey
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),

                        //----
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context, 
                              MaterialPageRoute(
                                builder: (BuildContext context) => Doctors()
                              )
                            );
                          },
                          child: Container(
                            height: 150,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  width: 120,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                    color: Colors.white,
                                    boxShadow: [BoxShadow(
                                      color: Colors.grey[200],
                                      offset: Offset(0.0, 3.0)
                                    )],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    width: 100,
                                    child: Text(
                                      'Surgeon',
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.grey
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),

                        
                        
                      ],
                    ),

                    //-----

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[

                        //----
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context, 
                              MaterialPageRoute(
                                builder: (BuildContext context) => Doctors()
                              )
                            );
                          },
                          child: Container(
                            height: 150,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  width: 120,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                    color: Colors.white,
                                    boxShadow: [BoxShadow(
                                      color: Colors.grey[200],
                                      offset: Offset(0.0, 3.0)
                                    )],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    width: 100,
                                    child: Text(
                                      'Neurologist',
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.grey
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),

                        //----
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context, 
                              MaterialPageRoute(
                                builder: (BuildContext context) => Doctors()
                              )
                            );
                          },
                          child: Container(
                            height: 150,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  width: 120,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                    color: Colors.white,
                                    boxShadow: [BoxShadow(
                                      color: Colors.grey[200],
                                      offset: Offset(0.0, 3.0)
                                    )],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    width: 100,
                                    child: Text(
                                      'Cardiologist',
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.grey
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),

                        //----
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context, 
                              MaterialPageRoute(
                                builder: (BuildContext context) => Doctors()
                              )
                            );
                          },
                          child: Container(
                            height: 150,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  width: 120,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                    color: Colors.white,
                                    boxShadow: [BoxShadow(
                                      color: Colors.grey[200],
                                      offset: Offset(0.0, 3.0)
                                    )],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    width: 100,
                                    child: Text(
                                      'Eye specialist',
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.grey
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),

                        
                        
                      ],
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



class Doctors extends StatefulWidget {
  @override
  _DoctorsState createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Specialization',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black
          )
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.keyboard_arrow_left),
          color: Colors.black87,
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            color: Colors.black87,
          )
        ],
      ),

      body: ListView.builder(
        itemCount: 50,
        itemBuilder: (BuildContext context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (BuildContext context) => Specializaion()
                  )
                );
              },
              child: Container(
                height: 100.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: Colors.white,
                  boxShadow: [BoxShadow(
                    color: Colors.grey[200],
                    offset: Offset(0.0, 3.0)
                  )],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            SizedBox(width: 20.0,),
                            CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.blue,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Name',
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w600
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  'specialization',
                                  style: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  'Hospital',
                                  style: TextStyle(
                                    color: Colors.grey
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        
                        
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        VerticalDivider(
                          color: Colors.blueAccent,
                          width: 1.0,
                        ),
                        SizedBox(width: 20.0,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(Icons.favorite,color: Colors.grey,),
                                SizedBox(width: 10.0,),
                                Text(
                                  '88%',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                    
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 5.0,),
                            Row(
                              
                              children: <Widget>[
                                Icon(Icons.work,color: Colors.grey,),
                                SizedBox(width: 10.0,),
                                Text(
                                  '10 years',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                    
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(width: 20.0,)
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


class Specializaion extends StatefulWidget {
  @override
  _SpecializaionState createState() => _SpecializaionState();
}

class _SpecializaionState extends State<Specializaion> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text(
            'Doctor',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold
            )
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.keyboard_arrow_left,color: Colors.black87,),
          ),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(
                    color: Colors.grey[200],
                    offset: Offset(0.0, 3.0)
                  )],
                ),
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Colors.blueAccent,
                            radius: 60.0,
                          ),
                          Container(
                            width: 200,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Name',
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87
                                  ),
                                ),
                                SizedBox(height: 5.0,),
                                Text(
                                  'Specialization',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black54
                                  ),
                                ),
                                SizedBox(height: 5.0,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Icon(Icons.favorite,color: Colors.grey,),
                                        SizedBox(width: 5,),
                                        Text(
                                          '88%',
                                          style: TextStyle(
                                            color: Colors.grey,

                                          ),
                                        ),

                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Icon(Icons.work,color: Colors.grey,),
                                        SizedBox(width: 5,),
                                        Text(
                                          '5 years',
                                          style: TextStyle(
                                            color: Colors.grey,

                                          ),
                                        ),

                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                    color: Colors.blue[100],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.email),
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                    color: Colors.blue[100],
                                  ),
                                  
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.phone),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 200,
                            child: MaterialButton(
                              color: Colors.blueAccent,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) => BookingScreen()
                                  )
                                );
                              },
                              height: 40.0,
                              child: Center(
                                child: Text(
                                  'Make a booking',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600
                                  )
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

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 350,
                child: DoctorLocationMap(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DoctorLocationMap extends StatefulWidget {
  @override
  State<DoctorLocationMap> createState() => _DoctorLocationMapState();
}

class _DoctorLocationMapState extends State<DoctorLocationMap> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.complete();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}


class BookingScreen extends StatefulWidget {
  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {

  final _formKey = GlobalKey<FormState>();

  TextEditingController _timeController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  
  List _appointmentTypes = ['Check up', 'Test', 'Treatment'];
  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _currentAppointmentTypeValue;

  @override
  void initState() {
    // TODO: implement initState
    _dropDownMenuItems = getDropDownMenuItems();
    //_currentAppointmentTypeValue = _dropDownMenuItems[0].value;
    super.initState();
    

  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = List();

    _appointmentTypes.forEach((_appointmentType) {
      items.add(
        DropdownMenuItem(
          value: _appointmentType,
          child: Text(
            _appointmentType,
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w500,
              fontSize: 18.0
            ),
          ),
        )
      );
    });

    return items;

  }


  DateTime appointmentDate;
  DateTime appointmentTime;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text(
            'Booking',
            style: TextStyle(
              color: Colors.black87
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.keyboard_arrow_left,color: Colors.black87,),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 200,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          DropdownButton(
                            hint: Text('Select appointment type'),
                            value: _currentAppointmentTypeValue,
                            items: _dropDownMenuItems,
                            onChanged: changedDropDownMenuItems,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .5,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: _dateController,
                          onTap: () {
                              DatePicker.showDatePicker(
                                context,
                                showTitleActions: true,
                                minTime: DateTime.now(),
                                maxTime: DateTime(2021, 12, 31), onChanged: (date) {
                                  
                                  print('change $date');
                                },
                                onConfirm: (date) {
                                  setState(() {

                                    
                                    appointmentDate = date;
                                    var day = (appointmentDate.day < 10 ) ? '0${appointmentDate.day}': appointmentDate.day;
                                    var month = (appointmentDate.month < 10 ) ? '0${appointmentDate.month}': appointmentDate.month;
                                    _dateController.text = '$day $month ${appointmentDate.year}';
                                  });
                                  print('confirm $date');
                                },
                                currentTime: DateTime.now(), locale: LocaleType.en
                            );
                          },
                          decoration: InputDecoration(
                            hintText: 'Select date'

                          ),
                        ),
                        TextFormField(
                          controller: _timeController,
                          onTap: () {
                              DatePicker.showTimePicker(
                                context,
                                showTitleActions: true,
                                //currentTime: DateTime.now(),
                                //maxTime: DateTime(2021, 12, 31),
                                onChanged: (date) {
                                  print('change $date');
                                },
                                onConfirm: (time) {
                                  setState(() {
                                    
                                    appointmentTime = time;
                                    var hours = (appointmentTime.hour < 10) ? '0${appointmentTime.hour}' : '${appointmentTime.hour}';
                                    var min = (appointmentTime.minute < 10) ? '0${appointmentTime.minute}' : '${appointmentTime.minute}';
                                    _timeController.text = '$hours : $min';
                                  });
                                  print('confirm $time');
                                },
                                currentTime: DateTime.now(), locale: LocaleType.en
                            );
                          },
                          decoration: InputDecoration(
                            hintText: 'Select time'
                            
                          ),
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RaisedButton(
                              color: Colors.blueAccent,
                              onPressed: () {
                                _book();
                                
                              },
                              child: Text(
                                'Book',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w600
                                )
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ),
      ),
    );
  }

  changedDropDownMenuItems(selectedValue) {
    setState(() {
      _currentAppointmentTypeValue = selectedValue;
    });
  }

  _book() {
    print(_currentAppointmentTypeValue);
    print(appointmentTime);
    print(appointmentDate);
  }
}


class MyAppointmentScreen extends StatefulWidget {
  final String uid;

  MyAppointmentScreen({this.uid});

  @override
  _MyAppointmentScreenState createState() => _MyAppointmentScreenState();
}

class _MyAppointmentScreenState extends State<MyAppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    print(widget.uid);
    return Scaffold(
      
      body: StreamBuilder(
        stream: Firestore.instance.collection('appointment').where("uid", isEqualTo: widget.uid).snapshots(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.active) {
            if(snapshot.hasData) {
            return _buildList(context, snapshot.data.documents);

          } else {
              print(snapshot);
              return Center(child: CircularProgressIndicator());
            }
          
          } else if (snapshot.connectionState == ConnectionState.none) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  SizedBox(height: 30.0,),
                  Text(
                    'Connection Error',
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.red
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    'Check your internet connection',
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.red
                    ),
                  )
                ],
              )
            );
          }
          
          else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  SizedBox(height: 30.0,),
                  Text(
                    'Waiting for connection',
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.orange
                    ),
                  )
                ],
              )
            );
          }
          
        }
      ),
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    print('-------$snapshot');
   return ListView(
     padding: const EdgeInsets.only(top: 20.0),
     children: snapshot.map((data) => _buildListItem(context, data)).toList(),
   );
 }

 Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
   final appointment = Appointment.fromSnapshot(data);

   return Padding(
     key: ValueKey(appointment.id),
     padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
     child: Container(
       decoration: BoxDecoration(
         border: Border.all(color: Colors.grey),
         borderRadius: BorderRadius.circular(5.0),
       ),
       child: ListTile(
         title: Text('${appointment.appointmentType}'),
         trailing: Text('${appointment.date} ${appointment.time}'),
        ),
     ),
   );
 }
  
}

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Settings',
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.keyboard_arrow_left,color: Colors.black87,),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            height: 50.0,
            width: MediaQuery.of(context).size.width,
            child: MaterialButton(
              color: Colors.blueAccent,
              height: 50.0,
              minWidth: MediaQuery.of(context).size.width,
              onPressed: () async {
                var _auth = BaseAuth();
                await _auth.signOut();
              },
              child: Text(
                'Sign Out',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight:  FontWeight.w600
                )
              ),
            ),
          )
        ],
      ),
    );
  }
}