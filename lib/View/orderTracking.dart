import 'package:customer/View/myOrders.dart';
import 'package:customer/styles/textStyles.dart';
import 'package:flutter/material.dart';

class OrderTracking extends StatefulWidget {
  const OrderTracking({Key key}) : super(key: key);

  @override
  _OrderTrackingState createState() => _OrderTrackingState();
}

class _OrderTrackingState extends State<OrderTracking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Order Tracking",
                style:
                    titleText.copyWith(color: Colors.white, fontSize: 30.0),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.map,
                    color: Colors.white,
                    size: 22.0,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "ZHTHQEWQE52314",
                    style: titleText.copyWith(
                        color: Colors.white, fontSize: 18.0),
                  ),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              Column(
                children: [
                  Container(
                    height: 110.0,
                    width: 230.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0XFFFF145C),
                          Color(0XFFFF0A7A),
                        ],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage("assets/images/scooter.png"),
                                color: Colors.white,
                                width: 40.0,
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                "Accept From Rider",
                                textAlign: TextAlign.center,
                                style: thinText.copyWith(
                                  color: Colors.white,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 110.0,
                    width: 230.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0XFFFF145C),
                          Color(0XFFFF0A7A),
                        ],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage("assets/images/parcelIn.png"),
                                color: Colors.white,
                                width: 40.0,
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                "Picked From Rider",
                                textAlign: TextAlign.center,
                                style: thinText.copyWith(
                                  color: Colors.white,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 110.0,
                    width: 230.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0XFFFF145C),
                          Color(0XFFFF0A7A),
                        ],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(

                          padding: EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.location_city,
                                size: 42.0,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                "In Sorting Center",
                                textAlign: TextAlign.center,
                                style: thinText.copyWith(
                                  color: Colors.white,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 110.0,
                    width: 230.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0XFFFF145C),
                          Color(0XFFFF0A7A),
                        ],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage("assets/images/parcelOut.png"),
                                color: Colors.white,
                                width: 40.0,
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                "Out for Delivery",
                                textAlign: TextAlign.center,
                                style: thinText.copyWith(
                                  color: Colors.white,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 110.0,
                    width: 230.0,
                    decoration: BoxDecoration(
                      color: Color(0XFF595F6F),
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 40.0,
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                "Out for Delivery",
                                textAlign: TextAlign.center,
                                style: thinText.copyWith(
                                  color: Colors.white,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 50.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
