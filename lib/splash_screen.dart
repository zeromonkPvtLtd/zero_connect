import 'dart:async';
import '/login_registration/email_check_screen.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class Splash extends StatefulWidget {
  static const id = '/SplashScreen';
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 5),
      () {
        Navigator.pushReplacementNamed(context, EmailCheckScreen.id);
        dispose();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.9,
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.longestSide / 9),
              child: Image(
                fit: BoxFit.scaleDown,
                image: AssetImage('images/zero_logo.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                companyName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 36,
                  fontFamily: 'Lombok',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
