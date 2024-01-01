import 'package:flutter/material.dart';
import 'package:market_hub/src/constants/image_strings.dart';
import 'package:market_hub/src/features/authentication/screens/welcome_screen/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const WelcomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            width: 300,
            child: Image(
              image: AssetImage(marketHubSplashImage),
            ),
          ),
        ],
      ),
    );
  }
}
