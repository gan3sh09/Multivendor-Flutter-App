import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_card/image_card.dart';
import 'package:market_hub/src/features/authentication/models/product.dart';
import 'package:market_hub/src/features/authentication/screens/dashboard/widgets/section_title.dart';
import 'package:market_hub/src/features/authentication/screens/product_details/product_details.dart';
import '../../../../../constants/size_config.dart';

class PopularProduct extends StatelessWidget {
  const PopularProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: [
        SectionTitle(
          text: "Popular Product",
          press: () {},
        ),
        SizedBox(
          height: getProportionateScreenWidth(20),
        ),
        FutureBuilder(
            future:
                FirebaseFirestore.instance.collection('Products_Items').get(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text('Error'),
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SizedBox(
                  height: Get.height / 5,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              if (snapshot.data!.docs.isEmpty) {
                return const Center(
                  child: Text("No Data"),
                );
              }
              if (snapshot.data != null) {
                return SizedBox(
                  height: Get.height / 4,
                  child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        ProductModel productModel = ProductModel(
                          productName: snapshot.data!.docs[index]
                              ['productName'],
                          productDescription: snapshot.data!.docs[index]
                              ['productDescription'],
                          productPrice: snapshot.data!.docs[index]
                              ['productPrice'],
                          productImage: snapshot.data!.docs[index]
                              ['productImage'],
                        );
                        return Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(() => ProductDetails(
                                      productModel: productModel,
                                    ));
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: getProportionateScreenWidth(12),
                                ),
                                child: FillImageCard(
                                  borderRadius: 8,
                                  width: Get.width / 3,
                                  heightImage: Get.height / 10,
                                  imageProvider: CachedNetworkImageProvider(
                                      productModel.productImage),
                                  title: Text(
                                    productModel.productName,
                                    overflow: TextOverflow.ellipsis,
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
                      }),
                );
              }
              return Container();
            })
      ],
    );
  }
}
