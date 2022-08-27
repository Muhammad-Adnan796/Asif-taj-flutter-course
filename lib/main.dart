import 'package:covid_tracker_app/Services/ongenerate_routes.dart';
import 'package:covid_tracker_app/Services/routes_name.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,

      ),
      initialRoute: RoutesName.splashScreen,
      onGenerateRoute: RoutesGenerate.generateRoutes,
    );
  }
}
