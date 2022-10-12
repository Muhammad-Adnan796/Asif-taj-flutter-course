import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_cart_provider/product_list.dart';
import 'package:shoping_cart_provider/provider_clasess/provider_class.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return ChangeNotifierProvider(
     create: (_) => CartProvider(),
   child: Builder(
       builder: (BuildContext context) {
     return  MaterialApp(
       debugShowCheckedModeBanner:false,
       home: ProductListScreen(),
     );
   }),
   );
  }
}
