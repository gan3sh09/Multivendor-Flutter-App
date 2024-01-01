// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:market_hub/src/common_widgets/back_button/back_screen_button.dart';
import 'package:market_hub/src/common_widgets/default_button/default_button.dart';
import 'package:market_hub/src/constants/text_strings.dart';
import 'package:market_hub/src/features/authentication/models/cart.dart';
import 'package:market_hub/src/features/authentication/models/product.dart';
import 'package:market_hub/src/features/authentication/screens/cart_screen/cart_screen.dart';

class ProductDetails extends StatefulWidget {
  ProductModel productModel;
  ProductDetails({
    super.key,
    required this.productModel,
  });

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackScreenButton(
          icon: const Icon(LineAwesomeIcons.angle_left),
          press: () => Get.back(),
        ),
        elevation: 0,
        title: Text('Product Details',
            style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          GestureDetector(
            onTap: () => Get.to(() => const CartScreen()),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.shopping_cart),
            ),
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            // Product Images
            SizedBox(
              width: double.infinity,
              height: 180,
              child: Image.network(widget.productModel.productImage),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(widget.productModel.productName),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.favorite_outline),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Text(widget.productModel.productDescription),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                            'Rs. ${widget.productModel.productPrice.toString()}'),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    DefaultButton(
                      text: marketHubAddtoCart,
                      press: () async {
                        await checkProductExistence(uId: user!.uid);
                        Get.snackbar(
                            "Added to Cart", "Sucessfully",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.green,
                            colorText: Colors.white);
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Check product exists or not
  Future<void> checkProductExistence({
    required String uId,
    int quantityIncrement = 1,
  }) async {
    final DocumentReference documentReference = FirebaseFirestore.instance
        .collection('cart')
        .doc(uId)
        .collection('cartOrders')
        .doc(widget.productModel.productId.toString());

    DocumentSnapshot snapshot = await documentReference.get();

    if (snapshot.exists) {
      int currentQuantity = snapshot['productQuantity'];
      int updatedQuantity = currentQuantity + quantityIncrement;
      double totalPrice =
          double.parse(widget.productModel.productPrice.toString()) *
              updatedQuantity;

      await documentReference.update({
        'productQuantity': updatedQuantity,
        'productTotalPrice': totalPrice
      });
      print('Product exists');
    } else {
      await FirebaseFirestore.instance.collection('cart').doc(uId).set({
        'uId': uId,
        'createdAt': DateTime.now(),
      });

      CartModel cartModel = CartModel(
        productId: widget.productModel.productId.toString(),
        productName: widget.productModel.productName,
        productDescription: widget.productModel.productDescription,
        productPrice: widget.productModel.productPrice.toString(),
        productImage: widget.productModel.productImage,
        productQuantity: 1,
        productTotalPrice: double.parse(
          widget.productModel.productPrice.toString(),
        ),
      );

      await documentReference.set(cartModel.toMap());

      print('Product Added');
    }
  }
}
