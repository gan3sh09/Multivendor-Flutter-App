import 'package:flutter/material.dart';
import 'package:market_hub/src/features/authentication/screens/dashboard/widgets/popular_product.dart';
import 'package:market_hub/src/features/authentication/screens/dashboard/widgets/special_offer.dart';
import '../../../../../constants/size_config.dart';
import 'categories.dart';
import 'dashboard_Header.dart';
import 'discount_banner.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: getProportionateScreenWidth(20),
            ),
            const DashboardHeader(),
            SizedBox(
              height: getProportionateScreenWidth(20),
            ),
            const DiscountBanner(),
            SizedBox(
              height: getProportionateScreenWidth(20),
            ),
            const Categories(),
            SizedBox(
              height: getProportionateScreenWidth(20),
            ),
            const SpecialOffer(),
            SizedBox(
              height: getProportionateScreenWidth(20),
            ),
            const PopularProduct(),
            SizedBox(
              height: getProportionateScreenWidth(20),
            ),
          ],
        ),
      ),
    );
  }
}
