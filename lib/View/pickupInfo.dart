import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer/Presenter/presenter.dart';
import 'package:customer/View/myOrders.dart';
import 'package:customer/styles/textStyles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'orderTracking.dart';

class PickupInfo extends StatefulWidget {
  const PickupInfo({Key key}) : super(key: key);

  @override
  _PickupInfoState createState() => _PickupInfoState();
}

class _PickupInfoState extends State<PickupInfo> {
  final reqAddress = TextEditingController();
  final recName = TextEditingController();
  final recContactNumber = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<List> userDataFuture;

  String parceltypes = 'Normal';

  String reciever_city;
  String reciever_city_id;
  String selectedval;

  var items = [
    'Normal',
    'Sensitive',
  ];

  Presenter presenter = Presenter();

  String address;
  String city;
  String longitude;
  String latitude;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      funcThatMakesAsyncCall();
    });
  }

  Future<void> funcThatMakesAsyncCall() async {
    var list = await presenter.getCurrentLocation;

    setState(() {
      address = list[0];
      city = list[1];
      longitude = list[2].toString();
      latitude = list[3].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 70.0),
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0XFF181820),
            Color(0XFF2F323C),
          ],
        )),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Pickup Info",
                  style:
                      titleText.copyWith(color: Colors.white, fontSize: 30.0),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 210.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0XFFFF145C),
                            Color(0XFFFF0A7A),
                          ]),
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Pickup Location",
                        style: titleText.copyWith(
                          color: Colors.white,
                          fontSize: 26.0,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.white,
                                size: 20.0,
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                "Location",
                                style: titleText.copyWith(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "${address}",
                            textAlign: TextAlign.center,
                            style: titleText.copyWith(
                              color: Colors.white,
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_city,
                            color: Colors.white,
                            size: 18.0,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "${city}",
                            style: titleText.copyWith(
                              color: Colors.white,
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Powered By Google Maps",
                        style: titleText.copyWith(
                          color: Colors.white,
                          fontSize: 11.0,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Text(
                  "Drop-off Details",
                  style: titleText.copyWith(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  decoration: BoxDecoration(
                      color: Color(0XFF595F6F),
                      borderRadius: BorderRadius.circular(50.0)),
                  child: TextFormField(
                    controller: reqAddress,
                    textCapitalization: TextCapitalization.words,
                    style: thinText.copyWith(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                      hintStyle: thinText.copyWith(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                      hintText: "Drop-off Address",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 22.0, horizontal: 20.0),
                  decoration: BoxDecoration(
                      color: Color(0XFF595F6F),
                      borderRadius: BorderRadius.circular(50.0)),
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('areas')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: CupertinoActivityIndicator(),
                        );
                      }

                      return Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.location_city, color: Colors.white),
                            SizedBox(
                              width: 15.0,
                            ),
                            Expanded(
                              flex: 5,
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  style: thinText,
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.white,
                                    size: 24.0,
                                  ),
                                  value: selectedval,
                                  isDense: true,
                                  dropdownColor: Color(0XFF181820),
                                  hint: Text(
                                    "Drop-off City",
                                    style: thinText,
                                  ),
                                  onChanged: (valueSelectedByUser) {
                                    _onShopDropItemSelected(
                                        valueSelectedByUser);
                                  },
                                  items: snapshot.data.docs.map(
                                    (DocumentSnapshot document) {
                                      return DropdownMenuItem<String>(
                                        value: document["area_name"],
                                        child: Text(document["area_name"]),
                                      );
                                    },
                                  ).toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  decoration: BoxDecoration(
                      color: Color(0XFF595F6F),
                      borderRadius: BorderRadius.circular(50.0)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Container(
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: parceltypes,
                          dropdownColor: Color(0XFF181820),
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                            size: 24.0,
                          ),
                          hint: Text(
                            'Parcel Type',
                            style: thinText,
                          ),
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(
                                items,
                                style: thinText,
                              ),
                            );
                          }).toList(),
                          onChanged: (String newValue) {
                            setState(
                              () {
                                parceltypes = newValue;
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Text(
                  "Receiver Details",
                  style: titleText.copyWith(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  decoration: BoxDecoration(
                      color: Color(0XFF595F6F),
                      borderRadius: BorderRadius.circular(50.0)),
                  child: TextFormField(
                    controller: recName,
                    textCapitalization: TextCapitalization.words,
                    style: thinText.copyWith(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.account_circle,
                        color: Colors.white,
                      ),
                      hintStyle: thinText.copyWith(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                      hintText: "Receiver Name",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  decoration: BoxDecoration(
                      color: Color(0XFF595F6F),
                      borderRadius: BorderRadius.circular(50.0)),
                  child: TextFormField(
                    controller: recContactNumber,
                    textCapitalization: TextCapitalization.words,
                    style: thinText.copyWith(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                      hintStyle: thinText.copyWith(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                      hintText: "Receiver Contact Number",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: FlatButton(
                    splashColor: Color(0XFFFF006F),
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      presenter.addPickupInfo(
                        _auth.currentUser.uid,
                        _auth.currentUser.displayName,
                        city,
                        address,
                        latitude,
                        longitude,
                        reqAddress.text,
                        selectedval,
                        parceltypes,
                        recName.text,
                        recContactNumber.text,
                        "Pending",
                      );

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return OrderTracking();
                          },
                        ),
                      );
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
                    ),
                    padding: const EdgeInsets.all(0.0),
                    child: Ink(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0XFFFF0066),
                            Color(0XFFFE005F),
                          ],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        constraints: const BoxConstraints(
                            minWidth: 88.0, minHeight: 36.0),
                        alignment: Alignment.center,
                        child: Text(
                          "Add Request",
                          style: thinText.copyWith(
                              color: Colors.white, fontSize: 18.0),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 75.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onShopDropItemSelected(String newValueSelected) {
    setState(
      () {
        final data = newValueSelected.split(',');

        this.selectedval = newValueSelected;
      },
    );
  }
}
