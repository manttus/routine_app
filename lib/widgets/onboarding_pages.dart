import 'package:flutter/material.dart';
import 'package:herald_app/constants/color_constants.dart';
import 'package:herald_app/widgets/information_text.dart';
import 'package:herald_app/widgets/large_text.dart';
import 'package:herald_app/widgets/medium_text.dart';

class OnBoardingPages extends StatelessWidget {
  final PageController? controller;
  final String? imagePath;
  final String? heading;
  final String? subHeading;
  const OnBoardingPages({
    Key? key,
    this.controller,
    this.imagePath,
    this.heading,
    this.subHeading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    return Column(
      children: [
        Container(
          height: (mediaQuery.size.height - mediaQuery.padding.top) * 0.1,
          width: mediaQuery.size.width * 0.9,
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              controller!.animateToPage(
                2,
                duration: const Duration(microseconds: 700),
                curve: Curves.linear,
              );
            },
            child: const MediumText(
              text: "Skip",
              color: heraldGreen,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: (mediaQuery.size.height - mediaQuery.padding.top) * 0.35,
          child: Image.asset(imagePath!),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          height: (mediaQuery.size.height - mediaQuery.padding.top) * 0.2,
          width: double.infinity,
          child: LayoutBuilder(builder: (context, constraints) {
            return Column(
              children: [
                LargeText(
                  color: textColor,
                  text: heading,
                  fontWeight: FontWeight.bold,
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: constraints.maxHeight * 0.1,
                  ),
                  width: constraints.maxWidth * 0.69,
                  child: InformationText(
                    text: subHeading,
                    color: textColor,
                    fontWeight: FontWeight.w400,
                    textalign: TextAlign.center,
                  ),
                )
              ],
            );
          }),
        )
      ],
    );
  }
}
