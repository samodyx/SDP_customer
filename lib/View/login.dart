import 'package:customer/Presenter/presenter.dart';
import 'package:customer/View/signup.dart';
import 'package:customer/styles/textStyles.dart';
import 'package:customer/View/trackingPage.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  Presenter presenter = Presenter();

  final email=TextEditingController();
  final password=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0XFF181820),
            Color(0XFF2F323C),
          ],
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Login",
              style: titleText.copyWith(
                color: Colors.white,
              ),
            ),
            Text(
              "Login to your account",
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
                controller: email,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  prefixStyle: thinText.copyWith(color: Colors.black54),
                  hintText: "Email",
                  hintStyle: thinText.copyWith(color: Colors.black54),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: 25.0,
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
              height: 100.0,
            ),
            FlatButton(
              onPressed: () {
                presenter.login(email.text, password.text, context);
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                width: 180.0,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0XFFFF0066),
                        Color(0XFFFE005F),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(30.0)),
                child: Text(
                  "Login",
                  style: thinText.copyWith(fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
