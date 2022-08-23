import 'package:flutter/material.dart';
import 'package:navigation_chpt_11_asif_taj/simple_navigation_1st_method/2nd_screen.dart';

// Simple Navigation 1st Method

class FirstScreenSM extends StatefulWidget {
  String? title;
  int? titleValue;

  FirstScreenSM({this.title, this.titleValue});

  @override
  State<FirstScreenSM> createState() => _FirstScreenSMState();
}

class _FirstScreenSMState extends State<FirstScreenSM> {
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondScreenSM(
                        title: "Screen",
                        titleValue: 2,
                      ),
                    ),
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
