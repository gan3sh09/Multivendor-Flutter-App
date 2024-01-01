import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_hub/src/constants/image_strings.dart';
import 'package:market_hub/src/features/authentication/screens/login_screen/login_screen.dart';
import 'package:market_hub/src/features/authentication/screens/vendor_dashboard_screen/vendor_category_screen/vendor_category_screen.dart';
import 'package:market_hub/src/features/authentication/screens/vendor_dashboard_screen/vendor_dashboard_screen.dart';
import 'package:market_hub/src/features/authentication/screens/vendor_dashboard_screen/vendor_order_screen.dart/vendor_order_screen.dart';
import 'package:market_hub/src/features/authentication/screens/vendor_dashboard_screen/vendor_upload_product_screen/vendor_upload_product_screen.dart';

class DrawerVendor extends StatelessWidget {
  const DrawerVendor({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text('Ganesh Pandit'),
            accountEmail: Text('ganeshpandit@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image(
                  image: AssetImage(userProfile),
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                    image: AssetImage(userBackground), fit: BoxFit.cover)),
          ),
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text('Dashboard'),
            onTap: () {
              Get.to(
                () => const VendorDashboardScreen(),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('Orders'),
            onTap: () {
              Get.to(
                () => VendorOrderScreen(),
              );
            },
            trailing: ClipOval(
              child: Container(
                color: Colors.red,
                width: 20,
                height: 20,
                child: const Center(
                  child: Text(
                    '9',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.money),
            title: const Text('Withdrawal'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.category),
            title: const Text('Categories'),
            onTap: () {
              Get.to(
                () => const VendorCategoryScreen(),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.shop),
            title: const Text('Upload Product'),
            onTap: () {
              Get.to(
                () => const VendorUploadProductScreen(),
              );
            },
          ),
          const Divider(
            color: Colors.grey,
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.description),
            title: const Text('Policies'),
            onTap: () {},
          ),
          const Divider(
            color: Colors.grey,
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              FirebaseAuth.instance.signOut();
              Get.to(
                () => const LoginScreen(),
              );
            },
          ),
        ],
      ),
    );
  }
}
