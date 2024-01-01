import 'package:flutter/material.dart';
import 'package:market_hub/src/constants/sizes.dart';
import 'package:market_hub/src/constants/text_strings.dart';
import 'login_footer_widget.dart';
import 'login_form_widget.dart';
import 'login_header_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        /* appBar: AppBar(
          title: const Text(
            'Login as Customer',
            style: TextStyle(fontSize: 18.0),
          ),
          centerTitle: true,
          backgroundColor: Colors.black87,
          automaticallyImplyLeading: false,
        ), */
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(marketHubDefaultSize),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LoginHeaderWidget(
                  title: marketHubLoginTitle,
                  subTitle: marketHubLoginSubTitle,
                ),
                LoginForm(),
                LoginFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
