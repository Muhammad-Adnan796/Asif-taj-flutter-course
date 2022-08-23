
import 'package:flutter/material.dart';
import 'package:navigation_chpt_11_asif_taj/onGenerate_3_method/III_screen.dart';
import 'package:navigation_chpt_11_asif_taj/onGenerate_3_method/II_screen.dart';
import 'package:navigation_chpt_11_asif_taj/onGenerate_3_method/I_screen.dart';
import 'package:navigation_chpt_11_asif_taj/onGenerate_3_method/routes_name.dart';

class OnGenerate {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.firstScreen:
        return MaterialPageRoute(builder: (context) => FirstScreenGM());
      case RoutesName.secondScreen:
        return MaterialPageRoute(builder: (context) => SecondScreenGM(data: settings.arguments as Map,));
      case RoutesName.thirdScreen:
        return MaterialPageRoute(builder: (context) => ThirdScreenGM(data1: settings.arguments as Map,));

      default:
        return MaterialPageRoute(builder: (context) {
          return Scaffold(
            body: Column(
              children: const [
                 Center(child: Text("No Routes Defines"))
              ],
            ),
          );
        });
    }
  }
}
