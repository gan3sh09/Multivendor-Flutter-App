import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_hub/src/features/authentication/screens/allproduct_screen/allproduct_screen.dart';
import '../../../../../constants/size_config.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.text,
    required this.press,
  });

  final String text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => AllProductScreen());
            },
            child: const Text("See more  >"),
          ),
        ],
      ),
    );
  }
}
