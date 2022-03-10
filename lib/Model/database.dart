import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer/Model/PickupInfo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:customer/Model/Users.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;

class Database {
  Future<void> addUser(Users users,String userid) async {
    await _firestore.collection('customer_details').doc(userid).set(users.toMap());
  }

  Future<void> pickupInfo(PickupInfo pickupInfo) async {
    await _firestore.collection('delivery_req').add(pickupInfo.toMap());
  }


  Future<void> pickupRequests() async{

  }


}