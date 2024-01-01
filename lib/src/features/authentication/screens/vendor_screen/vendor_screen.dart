import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:market_hub/src/common_widgets/back_button/back_screen_button.dart';

class VendorScreen extends StatelessWidget {
  const VendorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackScreenButton(
          icon: const Icon(LineAwesomeIcons.angle_left),
          press: () => Get.back(),
        ),
        elevation: 0,
      title: Text("Vendors", style: Theme.of(context).textTheme.headlineMedium),
      ),
    );
  }
}
