import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String title;
  VoidCallback onpress;
  Color? backgroundclr;

  CustomButton({
    required this.title,
    required this.onpress,
    this.backgroundclr,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: Size.fromRadius(40),
          shape: CircleBorder(),
          primary: backgroundclr,
          shadowColor: Colors.grey,
          elevation: 10,
        ),
        onPressed: onpress,
        child: Text(
          title,
          style: TextStyle(fontSize: 27),
        ),
      ),
    );
  }
}
