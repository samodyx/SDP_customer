import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer/Presenter/presenter.dart';
import 'package:customer/View/login.dart';
import 'package:customer/styles/textStyles.dart';
import 'package:customer/View/trackingPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {


  String reciever_city;
  String reciever_city_id;
  String selectedval;

  Presenter presenter= Presenter();


  final fullName = TextEditingController();
  final email=TextEditingController();
  final contactNumber=TextEditingController();
  final permanentAddress=TextEditingController();
  final nic=TextEditingController();
  final password=TextEditingController();
  final district=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 30.0,vertical: 70.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0XFF181820),
                Color(0XFF2F323C),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "SIGNUP",
                style: titleText.copyWith(
                  color: Colors.white,
                ),
              ),
              Text(
                "Create an account, It's free",
                style: thinText.copyWith(color: Color(0XFF8E919B)),
              ),
              SizedBox(
                height: 60.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50.0)),
                child: TextFormField(
                  textCapitalization: TextCapitalization.words,
                  controller: fullName,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_circle),
                    prefixStyle: thinText.copyWith(color: Colors.black54),
                    hintText: "Full Name",
                    hintStyle: thinText.copyWith(color: Colors.black54),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50.0)),
                child: TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    prefixStyle: thinText.copyWith(color: Colors.black54),
                    hintStyle: thinText.copyWith(color: Colors.black54),
                    border: InputBorder.none,
                    hintText: "Email",
                  ),
                ),
              ),

              SizedBox(
                height: 20.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50.0)),
                child: TextFormField(
                  controller: contactNumber,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    prefixStyle: thinText.copyWith(color: Colors.black54),
                    hintStyle: thinText.copyWith(color: Colors.black54),
                    border: InputBorder.none,
                    hintText: "Contact Number",
                  ),
                ),
              ),


              SizedBox(
                height: 20.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50.0)),
                child: TextFormField(
                  controller: permanentAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.home),
                    prefixStyle: thinText.copyWith(color: Colors.black54),
                    hintStyle: thinText.copyWith(color: Colors.black54),
                    border: InputBorder.none,
                    hintText: "Permanent Address",
                  ),
                ),
              ),


              SizedBox(
                height: 20.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50.0)),
                child: TextFormField(
                  controller: nic,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.credit_card_sharp),
                    prefixStyle: thinText.copyWith(color: Colors.black54),
                    hintStyle: thinText.copyWith(color: Colors.black54),
                    border: InputBorder.none,
                    hintText: "NIC",
                  ),
                ),
              ),

              SizedBox(
                height: 20.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50.0)),
                child: TextFormField(
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.vpn_key_rounded),
                    prefixStyle: thinText.copyWith(color: Colors.black54),
                    hintStyle: thinText.copyWith(color: Colors.black54),
                    border: InputBorder.none,
                    hintText: "Password",
                  ),
                ),
              ),

              SizedBox(
                height: 20.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 22.0, horizontal: 20.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50.0)),
                child:               StreamBuilder<QuerySnapshot>(
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
                        crossAxisAlignment : CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.location_city,
                            color: Colors.black54,
                          ),

                          SizedBox(
                            width: 15.0,
                          ),

                          Expanded(
                            flex: 5,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                style: thinText.copyWith(color: Colors.black54),

                                value: selectedval,
                                isDense: true,
                                dropdownColor: Colors.white,
                                hint: Text("Area",style: thinText.copyWith(color: Colors.black54),),

                                onChanged: (valueSelectedByUser) {
                                  _onShopDropItemSelected(
                                      valueSelectedByUser);
                                },

                                items: snapshot.data.docs.map(
                                      (DocumentSnapshot document) {
                                    return DropdownMenuItem<String>(
                                      value: document["area_name"],
                                      child: Text(
                                          document["area_name"]),
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
                height: 20.0,
              ),



              Container(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50.0)),
                child: TextField(
                  controller: district,
                  style: thinText.copyWith(color: Colors.black54),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.my_location),
                    prefixStyle: thinText.copyWith(color: Colors.black54),
                    hintStyle: thinText.copyWith(color: Colors.black54),
                    border: InputBorder.none,
                    hintText: "District",
                  ),
                ),
              ),




              SizedBox(
                height: 50.0,
              ),
              Container(
                width: 180.0,
                child: FlatButton(
                  splashColor: Color(0XFFFF006F),
                  highlightColor: Colors.transparent,
                  onPressed: () {

                    presenter.register(fullName.text, email.text, contactNumber.text, permanentAddress.text, nic.text, password.text, reciever_city, district.text, context);
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0)),
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
                      borderRadius: BorderRadius.all(Radius.circular(40.0)),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      constraints:
                          const BoxConstraints(minWidth: 88.0, minHeight: 36.0),
                      alignment: Alignment.center,
                      child: Text(
                        "Signup",
                        style:
                            thinText.copyWith(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
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
