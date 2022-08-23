import 'package:flutter/material.dart';

// Simple Navigation 1st Method

class ThirdScreenSM extends StatefulWidget {
  String? title;
  int? titleValue;
  ThirdScreenSM({this.title, this.titleValue});

  @override
  State<ThirdScreenSM> createState() => _ThirdScreenSMState();
}

class _ThirdScreenSMState extends State<ThirdScreenSM> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${widget.title} ${widget.titleValue}"),
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
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => ))
                },
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
