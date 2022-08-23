import 'package:flutter/material.dart';
import 'package:navigation_chpt_11_asif_taj/routes_navigation_2nd_method/second_screen.dart';

// Routes Navigation 2nd Method

class FirstScreenRM extends StatefulWidget {
  static const id = "first_screen";


  @override
  State<FirstScreenRM> createState() => _FirstScreenRMState();
}

class _FirstScreenRMState extends State<FirstScreenRM> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("1st Screen"),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, SecondScreenRM.id,
                  arguments: {
                    "name":"Screen",
                    "title_value": 2
                  }
                  );
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.amber),
                  child: Center(child: Text("1st Screen")),
                ),
              ),
            )
          ],
        ));
  }
}
