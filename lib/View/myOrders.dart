import 'package:customer/View/orderTracking.dart';
import 'package:customer/View/pickupInfo.dart';
import 'package:customer/styles/textStyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({Key key}) : super(key: key);

  @override
  _MyOrdersState createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 30.0),
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
              children: [
                SizedBox(
                  height: 80.0,
                ),

                Text(
                  "My Orders",
                  style: titleText.copyWith(
                      color: Colors.white,
                      fontSize: 30.0
                  ),
                ),

                SizedBox(
                  height: 30.0,
                ),

                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(20.0),
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: Color(0XFF595F6F),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.white,
                                    size: 18.0,
                                  ),

                                  SizedBox(
                                    width: 10.0,
                                  ),

                                  Text(
                                    "Receiver Location",
                                    style: thinText.copyWith(
                                      fontSize: 13.0
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(
                                height: 5.0,
                              ),

                              Row(
                                children: [
                                  Icon(
                                    Icons.account_circle,
                                    color: Colors.white,
                                    size: 18.0,
                                  ),

                                  SizedBox(
                                    width: 10.0,
                                  ),

                                  Text(
                                    "Receiver Location",
                                    style: thinText.copyWith(
                                        fontSize: 13.0
                                    ),
                                  ),

                                ],
                              ),
                            ],
                          ),

                          SizedBox(
                            width: 15.0,
                          ),

                          Container(
                            child: FlatButton(
                              splashColor: Color(0XFFFF006F),
                              highlightColor: Colors.transparent,
                              onPressed: () {
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
                                  borderRadius: BorderRadius.circular(15.0)),
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
                                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                                      constraints:
                                      const BoxConstraints(minWidth: 88.0, minHeight: 36.0),
                                      alignment: Alignment.center,
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.map,
                                            color: Colors.white,
                                          ),

                                          SizedBox(
                                            width: 10.0,
                                          ),

                                          Text(
                                            "Track\nOrder",
                                            textAlign: TextAlign.center,
                                            style:
                                            thinText.copyWith(color: Colors.white, fontSize: 13.0),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
