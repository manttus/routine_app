import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:herald_app/API/google_sign_in.dart';
import 'package:herald_app/constants/color_constants.dart';
import 'package:herald_app/utils/user_simple_preference.dart';
import 'package:herald_app/widgets/medium_text.dart';
import 'package:herald_app/widgets/small_text.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  Future<String> postData(user) async {
    Map<String, String> header = {
      "Content-type": "application/json",
      "Accept": "application/json"
    };

    var response = await http.post(
      Uri.parse("http://10.0.2.2:4000/user/auth"),
      headers: header,
      body: jsonEncode(
        {
          "name": user.displayName,
          "email": user.email,
          "photoUrl": user.photoUrl,
        },
      ),
    );
    return response.body;
  }

  signIn() async {
    final user = await GoogleSignInApi.login();
    String response = await postData(user);
    SimplePreference.setAccessToken(jsonDecode(response)['AccessToken']);
    SimplePreference.setRefreshToken(jsonDecode(response)['RefreshToken']);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: (mediaQuery.size.height - mediaQuery.padding.top) * 0.30,
            child: Center(
              child: Image.asset(
                "assets/images/heraldlogocolor.png",
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: (mediaQuery.size.height - mediaQuery.padding.top) * 0.30,
            child: Center(
              child: Image.asset(
                "assets/images/illustration1.png",
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: (mediaQuery.size.height - mediaQuery.padding.top) * 0.1,
            ),
            width: double.infinity,
            height: (mediaQuery.size.height - mediaQuery.padding.top) * 0.2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const MediumText(
                  text: "Ready to Login?",
                  color: colorBlack,
                  fontWeight: FontWeight.w800,
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton.icon(
                  onPressed: () async {
                    if (await signIn()) {
                      Navigator.pushReplacementNamed(context, '/dashboard');
                    }
                  },
                  icon: const ImageIcon(
                    AssetImage("assets/images/google.png"),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: heraldGreen,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 30),
                  ),
                  label: const MediumText(
                    text: "Continue With Google",
                    color: colorWhite,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: (mediaQuery.size.height - mediaQuery.padding.top) * 0.1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: mediaQuery.size.width * 0.8,
                  child: const Divider(
                    thickness: 1,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SmallText(
                  text: "Copyright © 2022 . All Rights Reserved To HCK",
                  color: colorBlack,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
