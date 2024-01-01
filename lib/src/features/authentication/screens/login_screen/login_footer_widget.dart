import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_hub/src/features/authentication/screens/signup_screen/signup_screen.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("OR"),
        const SizedBox(
          height: marketHubFormHeight - 20,
        ),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            icon: const Image(
              image: AssetImage(googleLogo),
              width: 20,
            ),
            onPressed: () {},
            label: const Text(marketHubSignInWithGoogle),
          ),
        ),
        const SizedBox(
          height: marketHubFormHeight - 20,
        ),
        TextButton(
          onPressed: () {
            Get.to(() => const SignUpScreen());
          },
          child: Text.rich(TextSpan(
              text: marketHubDontHaveAnAccount,
              style: Theme.of(context).textTheme.bodyLarge,
              children: [
                TextSpan(
                    text: marketHubSignup.toUpperCase(),
                    style: const TextStyle(color: Colors.blue)),
              ])),
        ),
      ],
    );
  }
}
