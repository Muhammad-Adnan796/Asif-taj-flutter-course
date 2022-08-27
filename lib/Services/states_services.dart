import 'dart:convert';

import 'package:covid_tracker_app/Services/Utilities/app_Urls.dart';
import 'package:http/http.dart' as http;

import '../Modal/worldstatemodal.dart';

class StatesServices {
  Stream<Worldstatemodal> fetchWorldStatesRecordes() async* {
    final response = await http.get(Uri.parse(AppUrls.worldStatesApi));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      yield Worldstatemodal.fromJson(data);
    } else {
      throw Exception("Error");
    }
  }

  Future<List<dynamic>> countriesListApi() async  {
    var data;
    final response = await  http.get(Uri.parse(AppUrls.countriesList));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception("Error");
    }
  }
}
