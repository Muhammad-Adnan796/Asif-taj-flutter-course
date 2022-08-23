import 'package:flutter/material.dart';
import 'package:navigation_chpt_11_asif_taj/onGenerate_3_method/ongenerate_method.dart';
import 'package:navigation_chpt_11_asif_taj/onGenerate_3_method/routes_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesName.firstScreen,
      onGenerateRoute: OnGenerate.generateRoute,
// Simple Navigation 1st Method
      // home: FirstScreenSM(),

// Routes Navigation 2nd Method
      // initialRoute: FirstScreenRM.id,
      // routes: {
      //   FirstScreenRM.id: (context) => FirstScreenRM(),
      //   SecondScreenRM.id: (context) => SecondScreenRM(),
      //   ThirdScreenRM.id: (context) => ThirdScreenRM(),
      // },

// OnGenerate Navigation 3rd Method
    );
  }
}
