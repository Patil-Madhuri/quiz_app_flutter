import 'dart:async';

import 'package:demo/home.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
      super.initState();
    Timer(Duration(seconds: 5),(){
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => HomePage()
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: Center(
        child: Text(
          "Quiz\nStart Test Yourself..",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 40.0, color: Colors.white),
        ),
      ),
    );
  }
}
