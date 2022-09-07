// ignore_for_file: unused_element

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:herald_app/constants/color_constants.dart';
import 'package:herald_app/utils/user_simple_preference.dart';
import 'package:herald_app/widgets/small_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () async {
        String? check = await SimplePreference.getAccessToken();
        check != null
            // ignore: use_build_context_synchronously
            ? Navigator.pushReplacementNamed(
                context,
                '/dashboard',
              )
            // ignore: use_build_context_synchronously
            : Navigator.pushReplacementNamed(
                context,
                '/login',
              );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: heraldGreen,
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: (mediaQuery.size.height - mediaQuery.padding.top) * 0.5,
            child: Center(
              child: Image.asset(
                "assets/images/heraldlogo.png",
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: (mediaQuery.size.height - mediaQuery.padding.top) * 0.3,
            child: const Center(
              child: CircularProgressIndicator(
                color: colorWhite,
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: (mediaQuery.size.height - mediaQuery.padding.top) * 0.2,
            child: LayoutBuilder(builder: (context, constraints) {
              return Container(
                margin: EdgeInsets.only(top: constraints.maxHeight * 0.7),
                child: const Center(
                    child: SmallText(
                  text: "Copyright © 2022 . All Rights Reserved To HCK",
                  color: colorWhite,
                )),
              );
            }),
          ),
        ],
      ),
    );
  }
}
