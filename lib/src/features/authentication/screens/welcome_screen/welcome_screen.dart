import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_hub/src/constants/image_strings.dart';
import 'package:market_hub/src/constants/sizes.dart';
import 'package:market_hub/src/constants/text_strings.dart';
import 'package:market_hub/src/features/authentication/screens/login_screen/login_screen.dart';
import 'package:market_hub/src/features/authentication/screens/signup_screen/signup_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(marketHubDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: const AssetImage(marketHubWelcomeImage),
              height: height * 0.4,
            ),
            Column(
              children: [
                Text(
                  marketHubWelcomeTitle,
                  style: Theme.of(context).textTheme.displaySmall,
                  textAlign: TextAlign.center,
                ),
                Text(
                  marketHubWelcomeDescription,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: OutlinedButton(
                        onPressed: () {
                          Get.to(() => const SignUpScreen());
                        },
                        child: Text(marketHubSignup.toUpperCase()))),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          Get.to(() => const LoginScreen());
                        },
                        child: Text(marketHubLogin.toUpperCase())))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
