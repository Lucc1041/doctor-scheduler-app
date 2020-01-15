/*import 'package:doctor_scheduler/modules/appointment.dart';
import 'package:firebase/firestore.dart';

class User {
  String firstname;
  String lastname;
  String address;
  String email;
  static String uid;
  final DocumentReference reference;

  Appointment appointments = Appointment(uid: uid);

  Future<void> setUser({firstname,lastname,address,email,uid}) async {

  }

  User.fromMap(Map<String, dynamic> map, {this.reference})
     : assert(map['firstname'] != null),
       assert(map['lastname'] != null),
       assert(map['email'] != null),
       assert(map['address'] != null),
       lastname = map['lastname'],
       firstname = map['firstname'],
       address = map['address'],
       email = map['email'];

 User.fromSnapshot(DocumentSnapshot snapshot)
     : this.fromMap(snapshot.data, reference: snapshot.reference);

  
  get userAppointments async => appointments.appointments;

 @override
 String toString() => "User<$firstname:$lastname>";


}*/