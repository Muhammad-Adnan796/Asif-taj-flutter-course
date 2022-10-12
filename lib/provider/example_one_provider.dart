import 'package:flutter/foundation.dart';

class SliderexampleProvider with ChangeNotifier {

  double _value = 1.0;
  double get value => _value;

  void setState (double val){
    _value = val;
    notifyListeners();
  }
}