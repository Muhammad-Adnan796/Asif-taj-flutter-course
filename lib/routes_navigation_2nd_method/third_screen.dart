import 'package:flutter/material.dart';

// Routes Navigation 2nd Method

class ThirdScreenRM extends StatefulWidget {
  static const id = "third_screen";



  @override
  State<ThirdScreenRM> createState() => _ThirdScreenRMState();
}

class _ThirdScreenRMState extends State<ThirdScreenRM> {
  @override
  Widget build(BuildContext context) {
        final arguments = ModalRoute.of(context)!.settings.arguments  as Map;

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
