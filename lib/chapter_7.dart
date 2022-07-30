import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:readmore/readmore.dart';

class ReadMText extends StatefulWidget {
  @override
  State<ReadMText> createState() => _ReadMTextState();
}

class _ReadMTextState extends State<ReadMText> {
  var colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  var colorizeTextStyle = TextStyle(
    fontSize: 50.0,
    fontFamily: 'Horizon',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blueAccent,
      appBar: AppBar(),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            // ReadMoreText(
            //   "What is Lorem Ipsum?\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
            //   trimLines: 2,
            //   trimMode: TrimMode.Line,
            //   trimCollapsedText: "Show More",
            //   trimExpandedText: "Read Less",
            //   colorClickableText: Colors.amber,
            //   style: TextStyle(),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(20),
            //   child: Badge(
            //     badgeColor: Colors.teal,
            //     badgeContent: Text("5"),
            //     child: Icon(Icons.shopping_cart_outlined),
            //     animationType: BadgeAnimationType.slide,
            //     animationDuration: Duration(seconds: 2),
            //   ),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Row(
            //   mainAxisSize: MainAxisSize.min,
            //   children: <Widget>[
            //     const SizedBox(width: 20.0, height: 100.0),
            //     const Text(
            //       'Be',
            //       style: TextStyle(fontSize: 43.0),
            //     ),
            //     const SizedBox(width: 20.0, height: 100.0),
            //     DefaultTextStyle(
            //       style: const TextStyle(
            //         fontSize: 40.0,
            //         fontFamily: 'Horizon',
            //       ),
            //       child: AnimatedTextKit(
            //         animatedTexts: [
            //           RotateAnimatedText('AWESOME'),
            //           RotateAnimatedText('OPTIMISTIC'),
            //           RotateAnimatedText('DIFFERENT'),
            //         ],
            //         onTap: () {
            //           print("Tap Event");
            //         },
            //       ),
            //     ),
            //   ],
            // ),
            // SizedBox(
            //   width: 250.0,
            //   child: DefaultTextStyle(
            //     style: const TextStyle(
            //       fontSize: 32.0,
            //       fontWeight: FontWeight.bold,
            //     ),
            //     child: AnimatedTextKit(
            //       animatedTexts: [
            //         FadeAnimatedText('do IT!'),
            //         FadeAnimatedText('do it RIGHT!!'),
            //         FadeAnimatedText('do it RIGHT NOW!!!'),
            //       ],
            //       onTap: () {
            //         print("Tap Event");
            //       },
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   width: 250.0,
            //   child: DefaultTextStyle(
            //     style: const TextStyle(
            //       fontSize: 30.0,
            //       fontFamily: 'Bobbers',
            //     ),
            //     child: AnimatedTextKit(
            //       animatedTexts: [
            //         TyperAnimatedText('It is not enough to do your best,'),
            //         TyperAnimatedText('you must know what to do,'),
            //         TyperAnimatedText('and then do your best'),
            //         TyperAnimatedText('- W.Edwards Deming'),
            //       ],
            //       onTap: () {
            //         print("Tap Event");
            //       },
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   width: 250.0,
            //   child: DefaultTextStyle(
            //     style: const TextStyle(
            //       fontSize: 30.0,
            //       fontFamily: 'Agne',
            //     ),
            //     child: AnimatedTextKit(
            //       animatedTexts: [
            //         TypewriterAnimatedText('Discipline is the best tool'),
            //         TypewriterAnimatedText('Design first, then code'),
            //         TypewriterAnimatedText(
            //             'Do not patch bugs out, rewrite them'),
            //         TypewriterAnimatedText(
            //             'Do not test bugs out, design them out'),
            //       ],
            //       onTap: () {
            //         print("Tap Event");
            //       },
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   width: 250.0,
            //   child: DefaultTextStyle(
            //     style: const TextStyle(
            //       fontSize: 70.0,
            //       fontFamily: 'Canterbury',
            //     ),
            //     child: AnimatedTextKit(
            //       animatedTexts: [
            //         ScaleAnimatedText('Think'),
            //         ScaleAnimatedText('Build'),
            //         ScaleAnimatedText('Ship'),
            //       ],
            //       onTap: () {
            //         print("Tap Event");
            //       },
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   width: 250.0,
            //   child: AnimatedTextKit(
            //     animatedTexts: [
            //       ColorizeAnimatedText(
            //         'Larry Page',
            //         textStyle: colorizeTextStyle,
            //         colors: colorizeColors,
            //       ),
            //       ColorizeAnimatedText(
            //         'Bill Gates',
            //         textStyle: colorizeTextStyle,
            //         colors: colorizeColors,
            //       ),
            //       ColorizeAnimatedText(
            //         'Steve Jobs',
            //         textStyle: colorizeTextStyle,
            //         colors: colorizeColors,
            //       ),
            //     ],
            //     isRepeatingAnimation: true,
            //     onTap: () {
            //       print("Tap Event");
            //     },
            //   ),
            // ),
            // SizedBox(
            //   width: 350.0,
            //   child: TextLiquidFill(
            //     text: 'LIQUIDY',
            //     waveColor: Colors.white,
            //     boxBackgroundColor: Colors.redAccent,
            //     textStyle: TextStyle(
            //       fontSize: 80.0,
            //       fontWeight: FontWeight.bold,
            //     ),
            //     boxHeight: 200.0,
            //   ),
            // ),
            // DefaultTextStyle(
            //   style: const TextStyle(
            //     fontSize: 20.0,
            //   ),
            //   child: AnimatedTextKit(
            //     animatedTexts: [
            //       WavyAnimatedText('Hello World'),
            //       WavyAnimatedText('Look at the waves'),
            //     ],
            //     isRepeatingAnimation: true,
            //     onTap: () {
            //       print("Tap Event");
            //     },
            //   ),
            // ),
            Center(
              child: PinCodeTextField(
                keyboardType: TextInputType.number,
                cursorColor: Colors.teal,
                obscureText: true,

                  appContext: context, 
                  length: 4, 
                  onChanged: (value) {},
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(10),
                    fieldHeight: 50,
                    fieldWidth: 40,
                  ),
                  ),
            )
          ],
        ),
      )),
    );
  }
}
