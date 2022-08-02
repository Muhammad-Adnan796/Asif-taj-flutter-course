// import 'package:asif_taj_chapter_6/chapter_7.dart';
import 'package:asif_taj_chapter_6/chapter_8/chapter_8.dart';
// import 'package:asif_taj_chapter_6/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
debugShowCheckedModeBanner: false,
theme: ThemeData(
  primarySwatch: Colors.teal
),

      home: Calculator()
      //  ReadMText(), 
      // HomeScreen(),
    );
  }
}