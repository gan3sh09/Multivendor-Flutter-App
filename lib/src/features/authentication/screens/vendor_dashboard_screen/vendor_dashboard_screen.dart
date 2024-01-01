import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_card/image_card.dart';
import 'package:market_hub/src/constants/colors.dart';
import 'package:market_hub/src/constants/size_config.dart';
import 'package:market_hub/src/features/authentication/models/product.dart';
import 'package:market_hub/src/features/authentication/screens/vendor_dashboard_screen/widgets/drawer_vendor.dart';

class VendorDashboardScreen extends StatelessWidget {
  const VendorDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
        backgroundColor: marketHubPrimaryColor,
      ),
      drawer: const DrawerVendor(),
      body: const Center(child: Text('Dashboard')),
    );
  }
}
