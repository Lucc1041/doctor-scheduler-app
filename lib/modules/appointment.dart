import 'package:cloud_firestore/cloud_firestore.dart';


class Appointment {
  final DateTime date;
  final DateTime time;
  final String appointmentType;
  final int id;

 final DocumentReference reference;

 Appointment.fromMap(Map<String, dynamic> map, {this.reference})
     : assert(map['date'] != null),
       assert(map['time'] != null),
       assert(map['appointmentType'] != null),
       assert(map['id'] != null),
       date = map['date'],
       time = map['time'],
       appointmentType = map['appointmentType'],
       id = map['id'];

 Appointment.fromSnapshot(DocumentSnapshot snapshot)
     : this.fromMap(snapshot.data, reference: snapshot.reference);

}