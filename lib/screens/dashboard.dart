import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:herald_app/constants/color_constants.dart';
import 'package:herald_app/models/user.dart';
import 'package:herald_app/utils/user_simple_preference.dart';
import 'package:herald_app/widgets/custom_appbar.dart';
import 'package:herald_app/widgets/custom_footer.dart';
import 'package:herald_app/widgets/information_text.dart';
import 'package:herald_app/widgets/medium_text.dart';
import 'package:herald_app/widgets/other_classes.dart';
import 'package:herald_app/widgets/small_text.dart';
import 'package:herald_app/widgets/upcoming_card.dart';
import 'package:http/http.dart' as http;

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool isLoaded = false;
  String? accessToken;
  String? refreshToken;
  String? photoUrl;
  String? email;

  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    accessToken = await SimplePreference.getAccessToken();
    refreshToken = await SimplePreference.getRefreshToken();
    String token = "Bearer $accessToken";

    Map<String, String> header = {
      "Content-type": "application/json",
      "Accept": "application/json",
      "authorization": token
    };

    var response = await http.get(
      Uri.parse("http://10.0.2.2:4000/info"),
      headers: header,
    );

    var body = await jsonDecode(response.body);

    if (body['message'] == 'jwt expired') {
      String response = await SimplePreference().newAccessToken();
      SimplePreference.setAccessToken(jsonDecode(response)['accessToken']);
      getData();
    } else {
      User logged = User.fromJson(body['user']);
      photoUrl = logged.photoUrl;
      email = logged.email;

      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    const appBar = CustomAppBar(
      titleText: "Routine - Dashboard",
    );

    return Scaffold(
      appBar: appBar,
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(
            color: textColor,
          ),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: (mediaQuery.size.height -
                          appBar.preferredSize.height -
                          mediaQuery.padding.top) *
                      0.04),
              height: (mediaQuery.size.height -
                      appBar.preferredSize.height -
                      mediaQuery.padding.top) *
                  0.15,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      MediumText(
                        text: "Hello Student!",
                        color: textColor,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      InformationText(
                        text: "Here's What's Cooking for You",
                        color: textColor,
                        fontWeight: FontWeight.w400,
                      )
                    ],
                  ),
                  SizedBox(
                    width: mediaQuery.size.width * 0.02,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: photoUrl == null
                            ? const NetworkImage("")
                            : NetworkImage(photoUrl!),
                        radius: 38,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const SmallText(
                        text: "L4CG4",
                        color: textColor,
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: (mediaQuery.size.height -
                      appBar.preferredSize.height -
                      mediaQuery.padding.top) *
                  0.27,
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: mediaQuery.size.width * 0.06,
                ),
                child: const UpcomingCard(),
              ),
            ),
            SizedBox(
              height: (mediaQuery.size.height -
                      appBar.preferredSize.height -
                      mediaQuery.padding.top) *
                  0.1,
              width: double.infinity,
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: mediaQuery.size.width * 0.08,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    MediumText(
                      text: "Classes Today",
                      color: textColor,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InformationText(
                      text: "Your Class Insights, Please be on Schedule!",
                      color: textColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: (mediaQuery.size.height -
                      appBar.preferredSize.height -
                      mediaQuery.padding.top) *
                  0.30,
              child: Container(
                margin: EdgeInsets.only(left: mediaQuery.size.width * 0.04),
                child: const OtherClasses(),
              ),
            ),
            SizedBox(
              height: (mediaQuery.size.height -
                      appBar.preferredSize.height -
                      mediaQuery.padding.top) *
                  0.11,
              width: double.infinity,
              child: const CustomFooter(),
            ),
          ],
        ),
      ),
    );
  }
}
