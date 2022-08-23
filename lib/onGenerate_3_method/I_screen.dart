import 'package:flutter/material.dart';
import 'package:navigation_chpt_11_asif_taj/onGenerate_3_method/routes_name.dart';

// OnGenerate Navigation 3rd Method

class FirstScreenGM extends StatefulWidget {


  @override
  State<FirstScreenGM> createState() => _FirstScreenGMState();
}

class _FirstScreenGMState extends State<FirstScreenGM> {
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
                  Navigator.pushNamed(context, RoutesName.secondScreen,
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
