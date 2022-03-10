import 'dart:async';

import 'package:customer/View/login.dart';
import 'package:customer/styles/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(
      Duration(seconds: 4),
          () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Login(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0XFF181820),
                Color(0XFF2F323C),
              ],
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome",
              style: titleText.copyWith(color: Colors.white),
            ),
            SizedBox(
              height: 80.0,
            ),
            Image(
              image: AssetImage(
                "assets/images/logo.png",
              ),
              width: 270,
            ),
            Text(
              "We are fast as air and as trustworthy\nas your heart",
              style: thinText,
              textAlign: TextAlign.center,
            ),

            SizedBox(
              height: 80.0,
            ),
            SpinKitThreeBounce(
              size: 40.0,
              itemBuilder: (BuildContext context, int index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: index.isEven ? Color(0XFFFF2430) : Color(0XFFFFFFFF),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}