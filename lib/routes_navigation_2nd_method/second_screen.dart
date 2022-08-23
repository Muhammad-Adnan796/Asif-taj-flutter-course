import 'package:flutter/material.dart';
import 'package:navigation_chpt_11_asif_taj/routes_navigation_2nd_method/third_screen.dart';

// Routes Navigation 2nd Method

class SecondScreenRM extends StatefulWidget {
  static const id = "second_screen";

  @override
  State<SecondScreenRM> createState() => _SecondScreenRMState();
}

class _SecondScreenRMState extends State<SecondScreenRM> {
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
        appBar: AppBar(
          title: Text("${arguments["name"]} ${arguments["title_value"]}"),
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
                  Navigator.pushNamed(context, ThirdScreenRM.id,
                      arguments: {"name": "Screen", "title_value": 3,});
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.amber),
                  child: Center(child: Text("2nd Screen")),
                ),
              ),
            )
          ],
        ));
  }
}
