import 'package:flutter/material.dart';
import 'package:market_hub/src/common_widgets/form/form_header_widget.dart';
import 'package:market_hub/src/constants/sizes.dart';
import 'package:market_hub/src/constants/text_strings.dart';
import 'package:market_hub/src/features/authentication/screens/signup_screen/signup_footer_widget.dart';
import 'package:market_hub/src/features/authentication/screens/signup_screen/signup_form_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(marketHubDefaultSize),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormHeaderWidget(
                    title: marketHubLoginTitle,
                    subTitle: marketHubLoginSubTitle),
                SignUpFormWidget(),
                SignUpFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
