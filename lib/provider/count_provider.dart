import 'package:flutter/foundation.dart';


// 1 . "ChangeNotifier" ye hamare lye setState ka km karta he
// 2 . "CountProvider" ab is class ko ham MaterialApp k uper initialize karwayge


class CountProvider with ChangeNotifier {

  int _count = 0;

  // get ka method ham is lye use karte hen q k jb ham private veriable ko
  // dusri screen per call karte hen to use get method me dakr phr us
  // method ko dusri screen per call karte hen or agr ham direct veriable
  // ko call karte hen to error ayga

  int get count => _count;

  void setCount (){
    _count++;
    //"notifyListeners()" ye value ko check karta or phr change karta he
    notifyListeners();
  }

}