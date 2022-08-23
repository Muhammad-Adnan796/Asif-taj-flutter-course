import 'package:flutter/material.dart';
import 'package:navigation_chpt_11_asif_taj/onGenerate_3_method/routes_name.dart';

// OnGenerate Navigation 3rd Method

class SecondScreenGM extends StatefulWidget {
  dynamic data;
  SecondScreenGM({this.data});

  @override
  State<SecondScreenGM> createState() => _SecondScreenGMState();
}

class _SecondScreenGMState extends State<SecondScreenGM> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.data["name"].toString() + widget.data["title_value"].toString()),
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
                  Navigator.pushNamed(context, RoutesName.thirdScreen,
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
