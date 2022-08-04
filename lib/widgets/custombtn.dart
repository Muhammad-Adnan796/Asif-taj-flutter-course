import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget? title;
  final VoidCallback? onpressd;

  final Color? bgcolor;
  var shape;

  CustomButton({
    Key? key,
    this.title,
    this.onpressd,
    this.bgcolor,
    this.shape,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        side: MaterialStateProperty.all(
          BorderSide.none,
        ),
        backgroundColor: MaterialStateProperty.all(bgcolor),
        shape: MaterialStateProperty.all(shape),
      ),
      onPressed: onpressd,
      child: title,
    );
  }
}
