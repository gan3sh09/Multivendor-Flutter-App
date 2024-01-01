import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_hub/src/constants/text_strings.dart';
import 'package:market_hub/src/features/authentication/screens/category_screen/category_screen.dart';
import 'package:market_hub/src/features/authentication/screens/dashboard/dashboard.dart';
import 'package:market_hub/src/features/authentication/screens/user_profile/user_profile_screen.dart';
import 'package:market_hub/src/features/authentication/screens/vendor_screen/vendor_screen.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 60,
          elevation: 0,
          backgroundColor: Colors.white,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
              
          destinations: const [
            NavigationDestination(
                icon: Icon(
                  Icons.home,
                  size: 25,
                ),
                label: marketHubHome,
                ),
            NavigationDestination(
                icon: Icon(
                  Icons.category_outlined,
                  size: 25,
                ),
                label: marketHubCategory
                ),

            NavigationDestination(
                icon: Icon(
                  Icons.group,
                  size: 25,
                ),
                label: marketHubVendor,),
            NavigationDestination(
                icon: Icon(
                  Icons.person_2_outlined,
                  size: 25,
                ),
                label: marketHubUserProfile),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const Dashboard(),
    const CategoryScreen(),
    const VendorScreen(),
    const UserProfileScreen(),
  ];
}
