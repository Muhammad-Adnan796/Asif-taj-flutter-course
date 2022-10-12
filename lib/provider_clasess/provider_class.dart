
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider with ChangeNotifier{


  int counter = 0;
  double totalPrice = 0.0;


  // counter methods

  void prefItems() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt("cart_item", counter);
    preferences.setDouble("total_price", totalPrice);
    notifyListeners();

  }

  void addCounter (){
    counter++;
    prefItems();
    notifyListeners();
  }

  void removeCounter (){
    counter--;
    prefItems();
    notifyListeners();
  }

  int getCounter (){
    prefItems();
    return counter;
}

// totalprice methods

  void addTotalPrice (double productPrice){
    totalPrice = totalPrice + productPrice;
    prefItems();
    notifyListeners();
  }

  void removeTotalPrice (double productPrice){
    totalPrice = totalPrice - productPrice;
    prefItems();
    notifyListeners();
  }

  double getTotalPrice (){
    prefItems();
    return totalPrice;
  }



}