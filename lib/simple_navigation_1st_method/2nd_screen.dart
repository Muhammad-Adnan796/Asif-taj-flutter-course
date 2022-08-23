import 'package:flutter/material.dart';
import 'package:navigation_chpt_11_asif_taj/simple_navigation_1st_method/3rd_screen.dart';

// Simple Navigation 1st Method

class SecondScreenSM extends StatefulWidget {
  String? title;
  int? titleValue;
  SecondScreenSM({this.title, this.titleValue});

  @override
  State<SecondScreenSM> createState() => _SecondScreenSMState();
}

class _SecondScreenSMState extends State<SecondScreenSM> {
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ThirdScreenSM(
                        title: "Screen",
                        titleValue: 3,
                      ),
                    ),
                  );
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
