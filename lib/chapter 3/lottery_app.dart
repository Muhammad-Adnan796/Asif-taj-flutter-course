import 'package:flutter/material.dart';
import 'dart:math';

class LotteryApp extends StatefulWidget {
  const LotteryApp({Key? key}) : super(key: key);

  @override
  State<LotteryApp> createState() => _LotteryAppState();
}

class _LotteryAppState extends State<LotteryApp> {
  Random _random = Random();
  int x = 0;
  Color _color = Color(0xffF97030);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _color,
        title: Text(
          "Lottery App",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontFamily: "Rubik Regular",
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Lottery Winning Number is 4",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Rubik Regular",
                  color: Color(0xff4C5980)),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Container(
            decoration: BoxDecoration(
                color: _color.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20)),
            height: MediaQuery.of(context).size.height * 0.3,
            // width: MediaQuery.of(context).size.width * 0.74,
            child: x == 4
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.done_all_rounded,
                        color: Colors.green,
                        size: 45,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "Congratulations you won the lottery. your number is\n$x\n",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Rubik Regular",
                            color: Color(0xff4C5980),
                          ),
                        ),
                      )
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error,
                        color: _color,
                        size: 45,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "Better luck next time your number is\n$x\ntry again",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Rubik Regular",
                            color: Color(0xff4C5980),
                          ),
                        ),
                      )
                    ],
                  ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            x = _random.nextInt(6);
          });

          x++;
          print(x);
        },
        child: Icon(
          Icons.refresh,
        ),
        backgroundColor: _color,
      ),
    );
  }
}
