import 'package:chapter_2_asif_taj/forgot.dart';
import 'package:chapter_2_asif_taj/login.dart';
import 'package:chapter_2_asif_taj/signup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: {
        "/login" : (context) => LoginPage(),
         "/signup" : (context) => Signupage(),
         "/forgot" : (context) => ForgotPage(),
      },
    );
  }
}
