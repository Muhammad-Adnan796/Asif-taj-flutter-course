import 'package:covid_tracker_app/Services/routes_name.dart';
import 'package:covid_tracker_app/view/countries_list.dart';
import 'package:covid_tracker_app/view/country_detail_screen.dart';
import 'package:covid_tracker_app/view/splash_screen.dart';
import 'package:covid_tracker_app/view/world_states.dart';
import 'package:flutter/material.dart';

class RoutesGenerate {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splashScreen:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case RoutesName.worldstatesscreen:
        return MaterialPageRoute(builder: (context) => WorldStatesScreen());
      case RoutesName.countrieslistscreen:
        return MaterialPageRoute(builder: (context) => CountriesList());
      case RoutesName.countrysdetailscreen:
        return MaterialPageRoute(
            builder: (context) => CountryDetailScreen(
                  data: settings.arguments as Map,
                ));
      default:
        return MaterialPageRoute(builder: (context) {
          return Scaffold(
            body: Column(
              children: const [
                Center(child: Text("No routes defines")),
              ],
            ),
          );
        });
    }
  }
}
