import 'package:customer/View/pickupInfo.dart';
import 'package:customer/styles/textStyles.dart';
import 'package:flutter/material.dart';

class TrackingPage extends StatefulWidget {
  const TrackingPage({Key key}) : super(key: key);

  @override
  _TrackingPageState createState() => _TrackingPageState();
}

class _TrackingPageState extends State<TrackingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 520.0,
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
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(70.0),
                    bottomRight: Radius.circular(70.0))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text(
                  "Hello Parinda !",
                  style: titleText.copyWith(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  "Track Your Parcel",
                  style: titleText.copyWith(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "Please Enter Your Tracking Number",
                  style: thinText.copyWith(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400
                  ),
                ),

                SizedBox(
                  height: 20.0,
                ),

                Container(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0)),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.my_location),
                      prefixStyle: thinText.copyWith(color: Colors.black54),
                      hintStyle: thinText.copyWith(color: Colors.black54),
                      border: InputBorder.none,
                      hintText: "Enter Tracking Number",
                    ),
                  ),
                ),

                SizedBox(
                  height: 10.0,
                ),

                Container(
                  width: 200.0,
                  child: FlatButton(
                    splashColor: Color(0XFFFF006F),
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return PickupInfo();
                          },
                        ),
                      );
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
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
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        constraints:
                        const BoxConstraints(minWidth: 88.0, minHeight: 36.0),
                        alignment: Alignment.center,
                        child: Text(
                          "Get Tracking Details",
                          style:
                          thinText.copyWith(color: Colors.white, fontSize: 15.0),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 30.0,
                ),

                Image(
                  image: AssetImage(
                    "assets/images/tracking.png",
                  ),
                  width: 200,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
            child: Column(
              children: [
                FlatButton(
                  splashColor: Color(0XFFFF004E),
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return PickupInfo();
                        },
                      ),
                    );
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
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Image(
                              image: AssetImage(
                                "assets/images/parcelbox.png"
                              ),
                              width: 50.0,
                            ),
                          ),

                          SizedBox(
                            width: 20.0,
                          ),

                          Container(
                            padding: EdgeInsets.symmetric(vertical: 15.0),
                            constraints:
                            const BoxConstraints(minWidth: 88.0, minHeight: 36.0),
                            alignment: Alignment.center,
                            child: Text(
                              "Parcel Collect Request",
                              style:
                              thinText.copyWith(color: Colors.white, fontSize: 16.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 20.0,
                ),

                FlatButton(
                  splashColor: Color(0XFFFF004E),
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return TrackingPage();
                        },
                      ),
                    );
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
                          Color(0XFF303440),
                          Color(0XFF303440),
                        ],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(40.0)),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Image(
                              image: AssetImage(
                                  "assets/images/parcelbox.png"
                              ),
                              width: 50.0,
                            ),
                          ),

                          SizedBox(
                            width: 20.0,
                          ),

                          Container(
                            padding: EdgeInsets.symmetric(vertical: 15.0),
                            constraints:
                            const BoxConstraints(minWidth: 88.0, minHeight: 36.0),
                            alignment: Alignment.center,
                            child: Text(
                              "My Order Requests",
                              style:
                              thinText.copyWith(color: Colors.white, fontSize: 16.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 20.0,
          )
        ],
      ),
    );
  }
}
