import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:get/get.dart';
import 'package:image_card/image_card.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:market_hub/src/common_widgets/back_button/back_screen_button.dart';
import 'package:market_hub/src/constants/colors.dart';
import 'package:market_hub/src/constants/size_config.dart';
import 'package:market_hub/src/features/authentication/controllers/cart_price_controller.dart';
import 'package:market_hub/src/features/authentication/models/cart.dart';
import 'package:market_hub/src/features/authentication/models/product.dart';
import 'package:market_hub/src/features/authentication/screens/checkout_screen/checkout_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  final ProductPriceController productPriceController = Get.put(
    ProductPriceController(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackScreenButton(
          icon: const Icon(LineAwesomeIcons.angle_left),
          press: () => Get.back(),
        ),
        elevation: 0,
        title: Text("Cart Screen",
            style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('cart')
            .doc(user!.uid)
            .collection('cartOrders')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Error'),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text("No Product Found"),
            );
          }
          if (snapshot.data != null) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final CartModel cartModel = CartModel(
                  productId: snapshot.data!.docs[index]['productId'],
                  productName: snapshot.data!.docs[index]['productName'],
                  productDescription: snapshot.data!.docs[index]
                      ['productDescription'],
                  productPrice: snapshot.data!.docs[index]['productPrice'],
                  productImage: snapshot.data!.docs[index]['productImage'],
                  productQuantity: snapshot.data!.docs[index]
                      ['productQuantity'],
                  productTotalPrice: snapshot.data!.docs[index]
                      ['productTotalPrice'],
                );

                // calculate price
                productPriceController.fetchProductPrice();
                return SwipeActionCell(
                  key: ObjectKey(cartModel.productId),
                  trailingActions: [
                    SwipeAction(
                      title: 'Delete',
                      forceAlignmentToBoundary: true,
                      performsFirstActionWithFullSwipe: true,
                      onTap: (CompletionHandler handler) async {
                        print('Deleted');
                        await FirebaseFirestore.instance
                            .collection('cart')
                            .doc(user!.uid)
                            .collection('cartOrders')
                            .doc(cartModel.productId)
                            .delete();
                      },
                    )
                  ],
                  child: Card(
                    elevation: 5,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: marketHubPrimaryColor,
                        backgroundImage: NetworkImage(cartModel.productImage),
                      ),
                      title: Text(cartModel.productName),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            cartModel.productPrice,
                          ),
                          GestureDetector(
                            onTap: () async {
                              if (cartModel.productQuantity > 1) {
                                FirebaseFirestore.instance
                                    .collection('cart')
                                    .doc(user!.uid)
                                    .collection('cartOrdes')
                                    .doc(cartModel.productId)
                                    .update({
                                  'productQuantity':
                                      cartModel.productQuantity - 1,
                                  'productTotalPrice':
                                      (double.parse(cartModel.productPrice) *
                                          (cartModel.productQuantity - 1))
                                });
                              }
                            },
                            child: const CircleAvatar(
                              radius: 14,
                              backgroundColor: marketHubPrimaryColor,
                              child: Text('-'),
                            ),
                          ),
                          SizedBox(
                            width: Get.width / 20.0,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (cartModel.productQuantity > 0) {
                                FirebaseFirestore.instance
                                    .collection('cart')
                                    .doc(user!.uid)
                                    .collection('cartOrdes')
                                    .doc(cartModel.productId)
                                    .update({
                                  'productQuantity':
                                      cartModel.productQuantity - 1,
                                  'productTotalPrice':
                                      (double.parse(cartModel.productPrice) +
                                          double.parse(cartModel.productPrice) *
                                              (cartModel.productQuantity + 1))
                                });
                              }
                            },
                            child: const CircleAvatar(
                              radius: 14,
                              backgroundColor: marketHubPrimaryColor,
                              child: Text('+'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 8,
            ),
            Obx(
              () => Text(
                'Total: Rs.${productPriceController.totalPrice.value.toStringAsFixed(1)}',
                style: const TextStyle(fontSize: 14),
              ),
            ),
            const SizedBox(
              width: 22,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                child: Container(
                  width: Get.width / 2.0,
                  height: Get.height / 18,
                  decoration: BoxDecoration(
                    color: marketHubPrimaryColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Get.to(() =>  const CheckoutScreen());
                    },
                    child: const Text(
                      'Checkout',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
