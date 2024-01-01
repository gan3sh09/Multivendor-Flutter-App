import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:market_hub/src/constants/colors.dart';
import 'package:market_hub/src/features/authentication/screens/vendor_dashboard_screen/widgets/drawer_vendor.dart';

class VendorOrderScreen extends StatelessWidget {
  VendorOrderScreen({super.key});

  final CollectionReference cartOrderCollection =
      FirebaseFirestore.instance.collection('orderProduct');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Orders',
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: cartOrderCollection.snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            }

            List<OrderProductModel> orderProducts =
                snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              return OrderProductModel(
                address: data['address'] ?? '',
                city: data['city'] ?? '',
                phoneno: data['phoneno'] ?? '',
              );
            }).toList();

            return ListView.builder(
              itemCount: orderProducts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    'Address: ${orderProducts[index].address}',
                    style: const TextStyle(fontSize: 14),
                  ),
                  subtitle: Text(
                    style: const TextStyle(fontSize: 14),
                    'City: ${orderProducts[index].city}, Phone Number: ${orderProducts[index].phoneno}',
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class OrderProductModel {
  String address;
  String city;
  String phoneno;

  OrderProductModel({
    required this.address,
    required this.city,
    required this.phoneno,
  });
}
