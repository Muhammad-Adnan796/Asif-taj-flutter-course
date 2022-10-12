import 'dart:async';

import 'package:flutter/material.dart';
import 'package:notice_board_app/provider/count_provider.dart';
import 'package:provider/provider.dart';

class CountExample extends StatefulWidget {
  const CountExample({Key? key}) : super(key: key);

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {

  @override
  void initState () {
    super.initState();
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    Timer.periodic(const Duration(seconds: 1), (timer) {
      countProvider.setCount();
    });
  }


  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    print("build");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Count Example"),
      ),
      body: Center(
        // agr hame puri screen ko nhi sirf ek hi widget ko rebuild karwana he
        // to us ko ham "Consumer" me dadete hen

        child: Consumer<CountProvider>(builder: (context, value, child ) {
          print("only this widget rebuild");
          return Text(
            value.count.toString(),
            style: const TextStyle(fontSize: 50),
          );
        },)
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.setCount();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
