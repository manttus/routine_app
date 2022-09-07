import 'package:flutter/material.dart';
import 'package:herald_app/constants/color_constants.dart';
import 'package:herald_app/widgets/custom_appbar.dart';
import 'package:herald_app/widgets/information_text.dart';
import 'package:herald_app/widgets/notification_card.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    const appBar = CustomAppBar(
      titleText: "Routine - Weekly Routine",
    );
    double actualHeight = mediaQuery.size.height -
        mediaQuery.padding.top -
        appBar.preferredSize.height;
    double actualWidth = mediaQuery.size.width;

    return Scaffold(
      appBar: appBar,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: actualHeight * 0.05),
            width: double.infinity,
            height: actualHeight * 0.35,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  children: [
                    SizedBox(
                      height: constraints.maxHeight * 0.20,
                      child: Image.asset(
                        "assets/images/HCK.png",
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(top: constraints.maxHeight * 0.05),
                      width: constraints.maxWidth * 0.25,
                      child: const Divider(
                        color: heraldGreen,
                        thickness: 1.5,
                      ),
                    ),
                    const InformationText(
                      text: "Recent",
                      color: textColor,
                      fontWeight: FontWeight.w500,
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(top: constraints.maxHeight * 0.06),
                      child: NotificationCard(
                        actualHeight: actualHeight,
                        actualWidth: actualWidth,
                        constraints: constraints,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          SizedBox(
            height: actualHeight * 0.6,
            width: double.infinity,
            child: LayoutBuilder(builder: (context, constraints) {
              return Column(
                children: [
                  SizedBox(
                    width: constraints.maxWidth * 0.25,
                    child: const Divider(
                      color: heraldGreen,
                      thickness: 1.5,
                    ),
                  ),
                  const InformationText(
                    text: "Older",
                    color: textColor,
                    fontWeight: FontWeight.w500,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: constraints.maxHeight * 0.015),
                    height: constraints.maxHeight * 0.90,
                    width: constraints.maxWidth * 0.9,
                    child: ListView.builder(
                      itemCount: 4,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(
                              top: constraints.maxHeight * 0.025),
                          child: NotificationCard(
                            actualHeight: actualHeight,
                            actualWidth: actualWidth,
                            constraints: constraints,
                          ),
                        );
                      },
                    ),
                  )
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
