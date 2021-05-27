import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jitsi_doctor_app/homePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Meeting());
  }
}
