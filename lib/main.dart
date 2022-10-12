import 'package:flutter/material.dart';
import 'package:notice_board_app/provider/count_provider.dart';
import 'package:notice_board_app/provider/example_one_provider.dart';
import 'package:notice_board_app/provider/favourite_provider.dart';
import 'package:notice_board_app/screens/example_one.dart';
import 'package:notice_board_app/screens/favourite/favourite_screen.dart';
import 'package:notice_board_app/screens/favourite/myfavourit.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // ham ne yaha provider ko lazmi initialize karna he
    // warna provider hamare project me run nhi hoga

    // or ye he Multi classes k lye


    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider(),),
        ChangeNotifierProvider(create: (_) => SliderexampleProvider(),),
        ChangeNotifierProvider(create: (_) => FavouriteProvider(),),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FavouriteScreen(),
      ),
    );
  }
}



// ham ne yaha provider ko lazmi initialize karna he
// warna provider hamare project me run nhi hoga
// or ye he single class k lye



// return ChangeNotifierProvider(
// create: (_) => CountProvider(),
// child: MaterialApp(
// debugShowCheckedModeBanner: false,
// home: CountExample(),
// ),
// );