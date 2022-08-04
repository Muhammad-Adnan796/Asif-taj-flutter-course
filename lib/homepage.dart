import 'package:calculator_app/widgets/colors.dart';
import 'package:calculator_app/widgets/custombtn.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String userInput = "";
  String answer = "";

  bool iswhite = false;

  void getresult() {
    Parser p = Parser();

    Expression exp = p.parse(userInput);
    ContextModel model = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, model);
    answer = eval.toString();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          iswhite
              ? Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 200,
                          blurStyle: BlurStyle.outer,
                          color: ColorsClass.manbgclr1b)
                    ],
                    color: ColorsClass.manbgclr1b,
                  ),
                )
              : Container(
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 200,
                            blurStyle: BlurStyle.outer,
                            color: ColorsClass.manbgoperatorclrb)
                      ],
                      color: ColorsClass.manbgoperatorclrb.withOpacity(0.4),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(230),
                        bottomLeft: Radius.circular(230),
                      )),
                ),
          iswhite
              ? Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          ColorsClass.manbgoperatorclrb.withOpacity(0.6),
                          ColorsClass.manbgoperatorclrb.withOpacity(0.0),
                        ]),
                  ),
                )
              : Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [
                          ColorsClass.bgclr1.withOpacity(0.2),
                          ColorsClass.bgclr1.withOpacity(0.0)
                        ]),
                  ),
                ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Switch(
                            activeColor: ColorsClass.manbgclr1b,
                            activeTrackColor:
                                ColorsClass.ratiosbtntextclr.withOpacity(0.7),
                            inactiveThumbColor: ColorsClass.backgrclr,
                            inactiveTrackColor: ColorsClass.manbgoperatorclrb,
                            value: iswhite,
                            onChanged: (val) {
                              setState(() {
                                iswhite = val;
                              });
                            }),
                      ),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            answer,
                            style: TextStyle(
                              fontSize: 24,
                              color: iswhite
                                  ? ColorsClass.ansclrb
                                  : ColorsClass.ansclr,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            userInput,
                            style: TextStyle(
                              fontSize: 48,
                              color: iswhite
                                  ? ColorsClass.textreqclr
                                  : ColorsClass.textreqclrb,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 10),
                              child: SizedBox(
                                height: height * 0.07,
                                width: width * 0.18,
                                child: CustomButton(
                                  bgcolor: iswhite
                                      ? ColorsClass.ratiosbtnclrb
                                      : ColorsClass.ratiosbtntextclr
                                          .withOpacity(0.7),
                                  onpressd: () {
                                    setState(() {
                                      userInput += "e";
                                    });
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  title: Text(
                                    "e",
                                    style: TextStyle(
                                      fontSize: 22.2,
                                      color: iswhite
                                          ? ColorsClass.isequaloprclr
                                          : ColorsClass.ratiosbtntextclr,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 10),
                              child: SizedBox(
                                height: height * 0.1,
                                width: width * 0.18,
                                child: CustomButton(
                                  bgcolor: iswhite
                                      ? ColorsClass.acorcutbtnclrb
                                      : ColorsClass.operatorclr
                                          .withOpacity(0.7),
                                  onpressd: () {
                                    setState(() {
                                      userInput = "";
                                      answer = "";
                                    });
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  title: Text(
                                    "Ac",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 35,
                                      color: iswhite
                                          ? ColorsClass.acorcutbtntextclrb
                                          : ColorsClass.isequaloprclr,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 10),
                              child: SizedBox(
                                height: height * 0.1,
                                width: width * 0.18,
                                child: CustomButton(
                                  bgcolor: iswhite
                                      ? ColorsClass.ratiosbtnclrb
                                      : ColorsClass.ratiosbtntextclr
                                          .withOpacity(0.7),
                                  onpressd: () {
                                    setState(() {
                                      userInput += "7";
                                    });
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  title: Text(
                                    "7",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 35,
                                      color: iswhite
                                          ? ColorsClass.isequaloprclr
                                          : ColorsClass.ratiosbtntextclr,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 10),
                              child: SizedBox(
                                height: height * 0.1,
                                width: width * 0.18,
                                child: CustomButton(
                                  bgcolor: iswhite
                                      ? ColorsClass.ratiosbtnclrb
                                      : ColorsClass.ratiosbtntextclr
                                          .withOpacity(0.7),
                                  onpressd: () {
                                    setState(() {
                                      userInput += "4";
                                    });
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  title: Text(
                                    "4",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 35,
                                      color: iswhite
                                          ? ColorsClass.isequaloprclr
                                          : ColorsClass.ratiosbtntextclr,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 4,
                                right: 4,
                                top: 4,
                              ),
                              child: SizedBox(
                                height: height * 0.1,
                                width: width * 0.18,
                                child: CustomButton(
                                  bgcolor: iswhite
                                      ? ColorsClass.ratiosbtnclrb
                                      : ColorsClass.ratiosbtntextclr
                                          .withOpacity(0.7),
                                  onpressd: () {
                                    setState(() {
                                      userInput += "1";
                                    });
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  title: Text(
                                    "1",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 35,
                                      color: iswhite
                                          ? ColorsClass.isequaloprclr
                                          : ColorsClass.ratiosbtntextclr,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 10),
                              child: SizedBox(
                                height: height * 0.07,
                                width: width * 0.18,
                                child: CustomButton(
                                  bgcolor: iswhite
                                      ? ColorsClass.ratiosbtnclrb
                                      : ColorsClass.ratiosbtntextclr
                                          .withOpacity(0.7),
                                  onpressd: () {
                                    // setState(() {
                                    //   userInput += "u";
                                    // });
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  title: Text(
                                    "u",
                                    style: TextStyle(
                                      fontSize: 22.2,
                                      color: iswhite
                                          ? ColorsClass.isequaloprclr
                                          : ColorsClass.ratiosbtntextclr,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 10),
                              child: SizedBox(
                                height: height * 0.1,
                                width: width * 0.18,
                                child: CustomButton(
                                  bgcolor: iswhite
                                      ? ColorsClass.acorcutbtnclrb
                                      : ColorsClass.operatorclr
                                          .withOpacity(0.7),
                                  onpressd: () {
                                    setState(() {
                                      userInput = userInput.substring(
                                          0, userInput.length - 1);
                                    });
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  title: Icon(
                                    Icons.cancel_presentation_sharp,
                                    size: 38,
                                    color: iswhite
                                        ? ColorsClass.acorcutbtntextclrb
                                        : ColorsClass.isequaloprclr,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 10),
                              child: SizedBox(
                                height: height * 0.1,
                                width: width * 0.18,
                                child: CustomButton(
                                  bgcolor: iswhite
                                      ? ColorsClass.ratiosbtnclrb
                                      : ColorsClass.ratiosbtntextclr
                                          .withOpacity(0.7),
                                  onpressd: () {
                                    setState(() {
                                      userInput += "8";
                                    });
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  title: Text(
                                    "8",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 35,
                                      color: iswhite
                                          ? ColorsClass.isequaloprclr
                                          : ColorsClass.ratiosbtntextclr,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 10),
                              child: SizedBox(
                                height: height * 0.1,
                                width: width * 0.18,
                                child: CustomButton(
                                  bgcolor: iswhite
                                      ? ColorsClass.ratiosbtnclrb
                                      : ColorsClass.ratiosbtntextclr
                                          .withOpacity(0.7),
                                  onpressd: () {
                                    setState(() {
                                      userInput += "5";
                                    });
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  title: Text(
                                    "5",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 35,
                                      color: iswhite
                                          ? ColorsClass.isequaloprclr
                                          : ColorsClass.ratiosbtntextclr,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 4,
                                right: 4,
                                top: 4,
                              ),
                              child: SizedBox(
                                height: height * 0.1,
                                width: width * 0.18,
                                child: CustomButton(
                                  bgcolor: iswhite
                                      ? ColorsClass.ratiosbtnclrb
                                      : ColorsClass.ratiosbtntextclr
                                          .withOpacity(0.7),
                                  onpressd: () {
                                    setState(() {
                                      userInput += "2";
                                    });
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  title: Text(
                                    "2",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 35,
                                      color: iswhite
                                          ? ColorsClass.isequaloprclr
                                          : ColorsClass.ratiosbtntextclr,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 10),
                              child: SizedBox(
                                height: height * 0.07,
                                width: width * 0.18,
                                child: CustomButton(
                                  bgcolor: iswhite
                                      ? ColorsClass.ratiosbtnclrb
                                      : ColorsClass.ratiosbtntextclr
                                          .withOpacity(0.7),
                                  onpressd: () {
                                    setState(() {
                                      userInput += "sin";
                                    });
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  title: Text(
                                    "sin",
                                    style: TextStyle(
                                      fontSize: 22.2,
                                      color: iswhite
                                          ? ColorsClass.isequaloprclr
                                          : ColorsClass.ratiosbtntextclr,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 10),
                              child: SizedBox(
                                height: height * 0.1,
                                width: width * 0.18,
                                child: CustomButton(
                                  bgcolor: iswhite
                                      ? ColorsClass.acorcutbtnclrb
                                      : ColorsClass.operatorclr
                                          .withOpacity(0.7),
                                  onpressd: () {
                                    setState(() {
                                      userInput += "/";
                                    });
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  title: Text(
                                    "/",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 38,
                                      color: iswhite
                                          ? ColorsClass.acorcutbtntextclrb
                                          : ColorsClass.isequaloprclr,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 10),
                              child: SizedBox(
                                height: height * 0.1,
                                width: width * 0.18,
                                child: CustomButton(
                                  bgcolor: iswhite
                                      ? ColorsClass.ratiosbtnclrb
                                      : ColorsClass.ratiosbtntextclr
                                          .withOpacity(0.7),
                                  onpressd: () {
                                    setState(() {
                                      userInput += "9";
                                    });
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  title: Text(
                                    "9",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 35,
                                      color: iswhite
                                          ? ColorsClass.isequaloprclr
                                          : ColorsClass.ratiosbtntextclr,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 10),
                              child: SizedBox(
                                height: height * 0.1,
                                width: width * 0.18,
                                child: CustomButton(
                                  bgcolor: iswhite
                                      ? ColorsClass.ratiosbtnclrb
                                      : ColorsClass.ratiosbtntextclr
                                          .withOpacity(0.7),
                                  onpressd: () {
                                    setState(() {
                                      userInput += "6";
                                    });
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  title: Text(
                                    "6",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 35,
                                      color: iswhite
                                          ? ColorsClass.isequaloprclr
                                          : ColorsClass.ratiosbtntextclr,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                                top: 10,
                              ),
                              child: SizedBox(
                                height: height * 0.1,
                                width: width * 0.18,
                                child: CustomButton(
                                  bgcolor: iswhite
                                      ? ColorsClass.ratiosbtnclrb
                                      : ColorsClass.ratiosbtntextclr
                                          .withOpacity(0.7),
                                  onpressd: () {
                                    setState(() {
                                      userInput += "3";
                                    });
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  title: Text(
                                    "3",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 35,
                                      color: iswhite
                                          ? ColorsClass.isequaloprclr
                                          : ColorsClass.ratiosbtntextclr,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 10),
                            child: SizedBox(
                              height: height * 0.07,
                              width: width * 0.18,
                              child: CustomButton(
                                bgcolor: iswhite
                                    ? ColorsClass.ratiosbtnclrb
                                    : ColorsClass.ratiosbtntextclr
                                        .withOpacity(0.7),
                                onpressd: () {
                                  // setState(() {
                                  //   userInput += "deg";
                                  // });
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                title: Text(
                                  "deg",
                                  style: TextStyle(
                                    fontSize: 22.2,
                                    color: iswhite
                                        ? ColorsClass.isequaloprclr
                                        : ColorsClass.ratiosbtntextclr,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 10),
                            child: SizedBox(
                              height: height * 0.1,
                              width: width * 0.18,
                              child: CustomButton(
                                bgcolor: iswhite
                                    ? ColorsClass.acorcutbtnclrb
                                    : ColorsClass.operatorclr.withOpacity(0.7),
                                onpressd: () {
                                  setState(() {
                                    userInput += "*";
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                title: Text(
                                  "*",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 50,
                                    color: iswhite
                                        ? ColorsClass.acorcutbtntextclrb
                                        : ColorsClass.isequaloprclr,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 4, bottom: 4),
                            child: SizedBox(
                              height: height * 0.1,
                              width: width * 0.18,
                              child: CustomButton(
                                bgcolor: iswhite
                                    ? ColorsClass.acorcutbtnclrb
                                    : ColorsClass.operatorclr.withOpacity(0.7),
                                onpressd: () {
                                  setState(() {
                                    userInput += "-";
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                title: Text(
                                  "-",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 50,
                                    color: iswhite
                                        ? ColorsClass.acorcutbtntextclrb
                                        : ColorsClass.isequaloprclr,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 4),
                            child: SizedBox(
                              height: height * 0.162,
                              width: width * 0.18,
                              child: CustomButton(
                                bgcolor: iswhite
                                    ? ColorsClass.acorcutbtnclrb
                                    : ColorsClass.operatorclr.withOpacity(0.7),
                                onpressd: () {
                                  setState(() {
                                    userInput += "+";
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                title: Text(
                                  "+",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 50,
                                    color: iswhite
                                        ? ColorsClass.acorcutbtntextclrb
                                        : ColorsClass.isequaloprclr,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 13, right: 10, bottom: 12),
                          child: SizedBox(
                            height: height * 0.1,
                            width: width * 0.4,
                            child: CustomButton(
                              bgcolor: iswhite
                                  ? ColorsClass.ratiosbtnclrb
                                  : ColorsClass.ratiosbtntextclr
                                      .withOpacity(0.7),
                              onpressd: () {
                                setState(() {
                                  userInput += "0";
                                });
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              title: Text(
                                "0",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40,
                                  color: iswhite
                                      ? ColorsClass.isequaloprclr
                                      : ColorsClass.ratiosbtntextclr,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 12),
                          child: SizedBox(
                            height: height * 0.1,
                            width: width * 0.18,
                            child: CustomButton(
                              bgcolor: iswhite
                                  ? ColorsClass.ratiosbtnclrb
                                  : ColorsClass.ratiosbtntextclr
                                      .withOpacity(0.7),
                              onpressd: () {
                                setState(() {
                                  userInput += ".";
                                });
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              title: Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Text(
                                  ".",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 60,
                                    color: iswhite
                                        ? ColorsClass.isequaloprclr
                                        : ColorsClass.ratiosbtntextclr,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 9, right: 10, bottom: 12),
                          child: SizedBox(
                            height: height * 0.16,
                            width: width * 0.18,
                            child: CustomButton(
                              bgcolor: iswhite
                                  ? ColorsClass.acorcutbtnclrb
                                  : ColorsClass.operatorclr.withOpacity(0.7),
                              onpressd: () {
                                setState(() {
                                  getresult();
                                });
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              title: Text(
                                "=",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 50,
                                  color: iswhite
                                      ? ColorsClass.acorcutbtntextclrb
                                      : ColorsClass.isequaloprclr,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
