import 'package:flutter/material.dart';
import 'package:herald_app/constants/color_constants.dart';
import 'package:herald_app/widgets/information_text.dart';
import 'package:herald_app/widgets/medium_text.dart';
import 'package:herald_app/widgets/small_text.dart';

class OtherClasses extends StatelessWidget {
  const OtherClasses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: heraldGreen,
              width: 3,
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MediumText(
                  text: "Object Oriented \nProgramming",
                  color: textColor,
                  fontWeight: FontWeight.bold,
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.access_alarm,
                      color: textColor,
                      size: 10,
                    ),
                    SmallText(
                      text: "  2:30 PM - 4:00 PM",
                      color: textColor,
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: heraldGreen,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 1),
                  ),
                  child: const InformationText(
                    text: "Set Remainder",
                    color: colorWhite,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
