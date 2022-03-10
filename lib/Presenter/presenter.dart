import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer/Model/PickupInfo.dart';
import 'package:customer/Model/database.dart';
import 'package:customer/Model/Users.dart';
import 'package:customer/View/login.dart';
import 'package:customer/View/trackingPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class Presenter {
  Database _database = new Database();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  void register(
      String fullName,
      String email,
      String contactNumber,
      String permanentAddress,
      String nic,
      String password,
      String serviceArea,
      String district,
      context) async {
    User user;
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      await user.updateProfile(displayName: fullName, photoURL: "Testt.com");
      await user.reload();
      user = _auth.currentUser;
      print(user.uid);

      Users regUsers = Users(
        fullName: fullName,
        email: email,
        contactNumber: contactNumber,
        permanentAddress: permanentAddress,
        nic: nic,
        password: password,
        serviceArea: serviceArea,
        district: district,
      );

      await _database.addUser(regUsers, user.uid);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return Login();
          },
        ),
      );
    } on FirebaseAuthException catch (e) {
      String error = e.toString();
      if (e.code == 'weak-password') {
        error = "The password provided is too weak";
      } else if (e.code == 'email-already-in-use') {
        error = "The account already exists for that email";
      } else if (e.code == 'invalid-email') {
        error =
            "The email provided is invalid. Please enter valid email & try again.";
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error),
        backgroundColor: Colors.red,
      ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
        backgroundColor: Colors.red,
      ));
    }
  }

  Future<void> addPickupInfo(
      String customerID,
      String customerName,
      String liveCity,
      String address,
      String liveLatitude,
      String liveLongitude,
      String reqAddress,
      String dropOffCity,
      String type,
      String recName,
      String recContactNumber,
      String reqStatus) async {


    PickupInfo pickupInfo = PickupInfo(
        customerID: customerID,
        customerName: customerName,
        liveAddress: address,
        liveCity: liveCity,
        liveLatitude: liveLatitude,
        liveLongitude: liveLongitude,
        recAddress: reqAddress,
        dropOffCity: dropOffCity,
        type: type,
        recName: recName,
        recContactNumber: recContactNumber,
        reqStatus: reqStatus);

    await _database.pickupInfo(pickupInfo);
  }

  void login(String email, String password, context) async {
    try {
      QuerySnapshot _myDoc = await firestore
          .collection('customer')
          .where('email', isEqualTo: email)
          .get();
      List<DocumentSnapshot> _myDocCount = _myDoc.docs;

      //if(_myDoc.size>0) {
      final user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (user != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return TrackingPage();
            },
          ),
        );
      }
      //}
      else {
        print(_myDoc.size);
      }
    } on FirebaseAuthException catch (e) {
      String error = "Error while login. Please try again.";
      if (e.code.toString() == "invalid-email") {
        error = "Please enter a valid email address";
      } else if (e.code.toString() == "user-not-found") {
        error = "The email you entered is incorrect. Please try again.";
      } else if (e.code.toString() == "wrong-password") {
        error = "The password you entered is incorrect. Please try again.";
      }

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error),
        backgroundColor: Colors.red,
      ));
      print(e.code.toString());
    }
  }

  Future<List> get getCurrentLocation async {
    try {
      double latitude;
      double longitude;
      String address;
      String subadministrative;
      String administrative;
      String road;

      LocationPermission permission;
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      } else {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);

        latitude = position.latitude;
        longitude = position.longitude;

        List<Placemark> placemarks =
            await placemarkFromCoordinates(latitude, longitude);
        Placemark place = placemarks[0];

        subadministrative = place.subAdministrativeArea.toString();
        administrative = place.administrativeArea.toString();
        road = place.street.toString();

        address = road + ", " + subadministrative + ", " + administrative;

        return [address, subadministrative, longitude, latitude];
      }
    } on Exception catch (e) {
      print(e);
    }
  }
}
