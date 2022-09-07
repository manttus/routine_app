import 'package:flutter/material.dart';

class InformationText extends StatelessWidget {
  final String? text;
  final Color? color;
  final FontWeight? fontWeight;
  final textalign;
  final height;

  const InformationText({
    Key? key,
    this.text,
    this.color,
    this.fontWeight,
    this.textalign = TextAlign.start,
    this.height = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      textAlign: textalign,
      style: TextStyle(
        color: color!,
        fontSize: 12,
        fontFamily: 'Montserrat',
        fontWeight: fontWeight!,
      ),
    );
  }
}
