import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final String? text;
  final Color? color;

  const SmallText({Key? key, this.text, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
        color: color!,
        fontSize: 10,
        fontFamily: 'Montserrat',
      ),
    );
  }
}
