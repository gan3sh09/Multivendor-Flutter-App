import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_card/image_card.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:market_hub/src/common_widgets/back_button/back_screen_button.dart';
import 'package:market_hub/src/constants/size_config.dart';
import 'package:market_hub/src/features/authentication/models/product.dart';

import '../product_details/product_details.dart';

class AllProductScreen extends StatelessWidget {
  const AllProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackScreenButton(
          icon: const Icon(LineAwesomeIcons.angle_left),
          press: () => Get.back(),
        ),
        elevation: 0,
        title: Text("All Products",
            style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection('Products_Items').get(),
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
              child: Text("No Data"),
            );
          }
          if (snapshot.data != null) {
            return GridView.builder(
              itemCount: snapshot.data!.docs.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 3,
                crossAxisSpacing: 3,
                childAspectRatio: 1.19,
              ),
              itemBuilder: (context, index) {
                ProductModel productModel = ProductModel(
                  productName: snapshot.data!.docs[index]['productName'],
                  productDescription: snapshot.data!.docs[index]
                      ['productDescription'],
                  productPrice: snapshot.data!.docs[index]['productPrice'],
                  productImage: snapshot.data!.docs[index]['productImage'],
                );
                return Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(
                            () => ProductDetails(productModel: productModel));
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(8),
                        ),
                        child: FillImageCard(
                          borderRadius: 6,
                          width: Get.width / 2.3,
                          heightImage: Get.height / 9,
                          imageProvider: CachedNetworkImageProvider(
                              productModel.productImage),
                          title: Text(
                            productModel.productName,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(fontSize: 12),
                          ),
                          footer: Row(
                            children: [
                              Text(
                                'Rs. ${productModel.productPrice.toString()}',
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.orange),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
