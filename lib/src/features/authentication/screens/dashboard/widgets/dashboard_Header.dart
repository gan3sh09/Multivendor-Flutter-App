// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_hub/src/features/authentication/screens/cart_screen/cart_screen.dart';
import 'package:market_hub/src/features/authentication/screens/dashboard/widgets/icon_btn_with_counter.dart';
import 'package:market_hub/src/features/authentication/screens/dashboard/widgets/search_field.dart';
import '../../../../../constants/image_strings.dart';
import '../../../../../constants/size_config.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({
    super.key,
  });

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
          const SearchField(),
          IconBtnWithCounter(
            svgSrc: cartIcon,
            press: () => Get.to(
              () => const CartScreen(),
            ),
          ),
          IconBtnWithCounter(
            svgSrc: notificationBell,
            numOfItems: 4,
            press: () {},
          ),
        ],
      ),
    );
  }
}
