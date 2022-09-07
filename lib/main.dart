import 'package:flutter/material.dart';
import 'package:herald_app/screens/dashboard.dart';
import 'package:herald_app/screens/login_page.dart';
import 'package:herald_app/screens/notification_page.dart';
import 'package:herald_app/screens/onboarding_page.dart';
import 'package:herald_app/screens/splash_screen.dart';
import 'package:herald_app/utils/user_simple_preference.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SimplePreference.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const SplashScreen(),
        '/onboard': (context) => const OnboardingScreen(),
        '/login': (context) => const LoginPage(),
        '/dashboard': (context) => const Dashboard(),
        '/notification': (context) => const NotificationPage()
      },
    );
  }
}
