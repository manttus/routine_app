import 'package:flutter/material.dart';
import 'package:herald_app/constants/color_constants.dart';
import 'package:herald_app/widgets/information_text.dart';
import 'package:herald_app/widgets/medium_text.dart';

class UpcomingCard extends StatelessWidget {
  const UpcomingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Stack(
        alignment: Alignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: constraints.maxHeight * 0.38),
            width: constraints.maxWidth * 0.97,
            height: constraints.maxHeight * 0.3,
            decoration: BoxDecoration(
              color: lightGreen,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          Container(
            height: constraints.maxHeight * 0.6,
            decoration: BoxDecoration(
              color: heraldGreen,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const InformationText(
                          text: "Upcoming Class",
                          color: textColor,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: constraints.maxHeight * 0.08,
                        ),
                        const FittedBox(
                          fit: BoxFit.fill,
                          child: MediumText(
                            text: "Internet Software \nArchitecture",
                            color: colorWhite,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: constraints.maxWidth * 0.1,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.alarm,
                              size: 16,
                              color: colorWhite,
                            ),
                            SizedBox(
                              width: constraints.maxHeight * 0.02,
                            ),
                            const MediumText(
                              text: "12 PM",
                              color: colorWhite,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: constraints.maxHeight * 0.08,
                        ),
                        const Icon(
                          Icons.podcasts_outlined,
                          size: 34,
                          color: textColor,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      );
    });
  }
}
