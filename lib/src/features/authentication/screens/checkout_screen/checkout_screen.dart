import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:market_hub/src/common_widgets/back_button/back_screen_button.dart';
import 'package:market_hub/src/common_widgets/default_button/default_button.dart';
import 'package:market_hub/src/constants/image_strings.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final phoneController = TextEditingController();

  CollectionReference orderProduct =
      FirebaseFirestore.instance.collection('orderProduct');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackScreenButton(
          icon: const Icon(LineAwesomeIcons.angle_left),
          press: () => Get.back(),
        ),
        elevation: 0,
        title: Text("Checkout Screen",
            style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text('Enter your information:'),
            const SizedBox(height: 16.0),
            TextField(
              controller: addressController,
              decoration: const InputDecoration(labelText: 'Address'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: cityController,
              decoration: const InputDecoration(labelText: 'City'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(labelText: 'Phone no.'),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Total: 2000'),
            ),
            DefaultButton(
              press: () async {
                await orderProduct.add({
                  'address': addressController.text,
                  'city': cityController.text,
                  'phoneno': phoneController.text,
                });

                // Clear text controllers after saving
                addressController.clear();
                cityController.clear();
                phoneController.clear();
                Get.snackbar("Order Successfully", "Thanks",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.green,
                    colorText: Colors.white);
              },
              text: 'Place Order',
            )
          ],
        ),
      ),
    );
  }
}
