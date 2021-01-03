import 'package:demo/splash.dart';
import "package:flutter/material.dart";

void main() => runApp(QuizApp());

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quiz Star",
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: SplashScreen()
    );
  }
}
