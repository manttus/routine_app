import 'package:flutter/material.dart';

class MediumText extends StatelessWidget {
  final String? text;
  final Color? color;
  final FontWeight? fontWeight;

  const MediumText({Key? key, this.text, this.color, this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
        color: color!,
        fontSize: 15,
        fontFamily: 'Montserrat',
        fontWeight: fontWeight!,
      ),
    );
  }
}
