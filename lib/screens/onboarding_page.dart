import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:herald_app/constants/color_constants.dart';
import 'package:herald_app/widgets/custom_footer.dart';
import 'package:herald_app/widgets/medium_text.dart';
import 'package:herald_app/widgets/onboarding_pages.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController(
    initialPage: 0,
  );

  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              onPageChanged: (value) {
                setState(() {
                  pageIndex = value;
                });
              },
              controller: _controller,
              children: [
                OnBoardingPages(
                  controller: _controller,
                  heading: "Check Schedule",
                  subHeading:
                      "You can check your college schedule directly through this app. No need to check your email everytime you attend your class.",
                  imagePath: "assets/images/illustration2.png",
                ),
                OnBoardingPages(
                  heading: "Classes Alert",
                  controller: _controller,
                  subHeading:
                      "Get quick notification about your upcoming classes. This app help’s to keep your attendance at 100%.",
                  imagePath: "assets/images/illustration3.png",
                ),
                OnBoardingPages(
                  heading: "Give Rating",
                  controller: _controller,
                  subHeading:
                      "Give feedback and ratings to your tutorsand college management at anytime. Don’t worry you’re anonymous.            ",
                  imagePath: "assets/images/illustration4.png",
                ),
              ],
            ),
            Container(
              alignment: const Alignment(0, 0.4),
              child: SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: const SlideEffect(
                  dotHeight: 12,
                  dotWidth: 12,
                  dotColor: iconColor,
                  activeDotColor: heraldGreen,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              alignment: const Alignment(0, 0.7),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: heraldGreen,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 100),
                ),
                onPressed: () {
                  pageIndex == 2
                      ? Navigator.pushReplacementNamed(context, "/login")
                      : _controller.nextPage(
                          duration: const Duration(
                            milliseconds: 250,
                          ),
                          curve: Curves.linear,
                        );
                },
                child: const MediumText(
                  text: "Next",
                  color: colorWhite,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top:
                      (mediaQuery.size.height - mediaQuery.padding.top) * 0.87),
              height: (mediaQuery.size.height - mediaQuery.padding.top) * 0.1,
              child: const CustomFooter(),
            ),
          ],
        ),
      ),
    );
  }
}
