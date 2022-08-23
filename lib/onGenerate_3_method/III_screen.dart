import 'package:flutter/material.dart';

// OnGenerate Navigation 3rd Method

class ThirdScreenGM extends StatefulWidget {
  dynamic data1;
  ThirdScreenGM({this.data1});

  @override
  State<ThirdScreenGM> createState() => _ThirdScreenGMState();
}

class _ThirdScreenGMState extends State<ThirdScreenGM> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.data1["name"].toString() +
              widget.data1["title_value"].toString()),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.amber),
                  child: Center(child: Text("3rd Screen")),
                ),
              ),
            )
          ],
        ));
  }
}
