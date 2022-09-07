import 'package:flutter/material.dart';
import 'package:herald_app/constants/color_constants.dart';
import 'package:herald_app/widgets/information_text.dart';
import 'package:herald_app/widgets/medium_text.dart';

class NotificationCard extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final constraints;
  final double? actualHeight;
  final double? actualWidth;

  const NotificationCard(
      {Key? key, this.constraints, this.actualHeight, this.actualWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: heraldGreen,
          width: 2.5,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      height: actualHeight! * 0.17,
      width: actualWidth! * 0.9,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 12),
        child: Column(
          children: const [
            MediumText(
              color: textColor,
              text: "Wish you all Guru Purnima and Bhanu Jayanti",
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: 8,
            ),
            InformationText(
              text:
                  "We wish all the teachers and students a very Happy Guru Purnima and Bhanu Jayanti.",
              color: textColor,
              fontWeight: FontWeight.w400,
            ),
            // Container(
            //   width: double.infinity,
            //   alignment: Alignment.bottomRight,
            //   child: const InformationText(
            //     text: "10:00 AM",
            //     color: textColor,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
