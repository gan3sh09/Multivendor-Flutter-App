import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_hub/src/constants/sizes.dart';
import 'package:market_hub/src/constants/text_strings.dart';
import 'package:market_hub/src/features/authentication/controllers/otp_controller.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    /* var otpcontroller = Get.put(OTPController());
    var otp; */
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(marketHubDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              otpScreenTitle,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 70.0,
              ),
            ),
            Text(
              otpSubTitle.toUpperCase(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: marketHubDefaultSize + 10,
            ),
            const Text(
              "$otpMessage support@gmail.com",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: marketHubDefaultSize - 10),
            OtpTextField(
              numberOfFields: 6,
              fillColor: Colors.black.withOpacity(0.1),
              filled: true,
              onSubmit: (code) {
                /* otp = code;
                OTPController.instance.verifyOTP(otp); */
              },
            ),
            const SizedBox(
              height: marketHubDefaultSize - 10,
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // OTPController.instance.verifyOTP(otp);
                  },
                  child: const Text('Next'),
                )),
          ],
        ),
      ),
    );
  }
}
