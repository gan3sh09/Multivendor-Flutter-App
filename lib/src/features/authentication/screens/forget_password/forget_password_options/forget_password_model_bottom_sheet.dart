import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_hub/src/features/authentication/screens/forget_password/forget_password_mail/forget_password_mail_screen.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import 'forget_password_btn_widget.dart';

class ForgetPasswordScreen {
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(marketHubDefaultSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                marketHubForgetPasswordTitle,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Text(
                marketHubForgetPasswordSubTitle,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: marketHubDefaultSize,
              ),
              ForgetPasswordBtnWidget(
                btnIcon: Icons.mail_outline_rounded,
                title: marketHubEmail,
                subTitle: marketHubResetViaEmail,
                onTap: () {
                  Navigator.pop(context);
                  Get.to(() => const ForgetPasswordMailScreen());
                },
              ),
              const SizedBox(
                height: marketHubDefaultSize - 10,
              ),
              ForgetPasswordBtnWidget(
                btnIcon: Icons.mobile_friendly_rounded,
                title: marketHubPhone,
                subTitle: marketHubResetViaPhone,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
