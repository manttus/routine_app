import 'package:flutter/material.dart';
import 'package:herald_app/constants/color_constants.dart';
import 'package:herald_app/widgets/small_text.dart';

class CustomFooter extends StatelessWidget {
  const CustomFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: const [
        Divider(),
        SizedBox(
          height: 10,
        ),
        SmallText(
          text: "Copyright © 2022 . All Rights Reserved To HCK",
          color: colorBlack,
        )
      ],
    );
  }
}
