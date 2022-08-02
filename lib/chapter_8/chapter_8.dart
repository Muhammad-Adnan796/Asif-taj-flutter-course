import 'package:asif_taj_chapter_6/chapter_8/colors.dart';
import 'package:asif_taj_chapter_6/chapter_8/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var userInput = "";
  var answer = "";

  void getresult() {
    String finaluserInput = userInput;
    finaluserInput.replaceAll("x", "*");

    Parser p = Parser();
    Expression expression = p.parse(finaluserInput);
    ContextModel contextModel = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        userInput.toString(),
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        answer.toString(),
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        CustomButton(
                            backgroundclr: grey,
                            title: "AC",
                            onpress: () {
                              setState(() {
                                userInput = "";
                                answer = "";
                              });
                            }),
                        CustomButton(
                            backgroundclr: grey,
                            title: "+/-",
                            onpress: () {
                              setState(() {
                                userInput += "+/-";
                              });
                            }),
                        CustomButton(
                            backgroundclr: grey,
                            title: "%",
                            onpress: () {
                              setState(() {
                                userInput += "%";
                              });
                            }),
                        CustomButton(
                            backgroundclr: orange,
                            title: "/",
                            onpress: () {
                              setState(() {
                                userInput += "/";
                              });
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        CustomButton(
                            backgroundclr: grey,
                            title: "7",
                            onpress: () {
                              setState(() {
                                userInput += "7";
                              });
                            }),
                        CustomButton(
                            backgroundclr: grey,
                            title: "8",
                            onpress: () {
                              setState(() {
                                userInput += "8";
                              });
                            }),
                        CustomButton(
                            backgroundclr: grey,
                            title: "0",
                            onpress: () {
                              setState(() {
                                userInput += "0";
                              });
                            }),
                        CustomButton(
                            backgroundclr: orange,
                            title: "*",
                            onpress: () {
                              setState(() {
                                userInput += "*";
                              });
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        CustomButton(
                            backgroundclr: grey,
                            title: "4",
                            onpress: () {
                              setState(() {
                                userInput += "4";
                              });
                            }),
                        CustomButton(
                            backgroundclr: grey,
                            title: "5",
                            onpress: () {
                              setState(() {
                                userInput += "5";
                              });
                            }),
                        CustomButton(
                            backgroundclr: grey,
                            title: "6",
                            onpress: () {
                              setState(() {
                                userInput += "6";
                              });
                            }),
                        CustomButton(
                            backgroundclr: orange,
                            title: "-",
                            onpress: () {
                              setState(() {
                                userInput += "-";
                              });
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        CustomButton(
                            backgroundclr: grey,
                            title: "1",
                            onpress: () {
                              setState(() {
                                userInput += "1";
                              });
                            }),
                        CustomButton(
                            backgroundclr: grey,
                            title: "2",
                            onpress: () {
                              setState(() {
                                userInput += "2";
                              });
                            }),
                        CustomButton(
                            backgroundclr: grey,
                            title: "3",
                            onpress: () {
                              setState(() {
                                userInput += "3";
                              });
                            }),
                        CustomButton(
                            backgroundclr: orange,
                            title: "+",
                            onpress: () {
                              setState(() {
                                userInput += "+";
                              });
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        CustomButton(
                            backgroundclr: grey,
                            title: "00",
                            onpress: () {
                              setState(() {
                                userInput += "00";
                              });
                            }),
                        CustomButton(
                            backgroundclr: grey,
                            title: ".",
                            onpress: () {
                              setState(() {
                                userInput += ".";
                              });
                            }),
                        CustomButton(
                            backgroundclr: grey,
                            title: "DEL",
                            onpress: () {
                              setState(() {
                                userInput = userInput.substring(
                                    0, userInput.length - 1);
                              });
                            }),
                        CustomButton(
                            backgroundclr: orange,
                            title: "=",
                            onpress: () {
                              
                              setState(() {
                                
                                getresult();
                              });
                            }),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
