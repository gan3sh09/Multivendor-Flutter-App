import 'package:flutter/material.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/size_config.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
        vertical: getProportionateScreenWidth(15),
      ),
      width: double.infinity,
      // height: 90,
      decoration: BoxDecoration(
        color: marketHubPrimaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text.rich(
        TextSpan(
            text: "A summer Suprise\n",
            style: Theme.of(context).textTheme.headlineMedium,
            children: [
              TextSpan(
                text: "Cashback 20%",
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ]),
      ),
    );
  }
}
