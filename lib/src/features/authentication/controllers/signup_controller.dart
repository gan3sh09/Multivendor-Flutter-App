import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_hub/src/features/authentication/models/user_model.dart';
import 'package:market_hub/src/features/authentication/screens/login_screen/login_screen.dart';
import 'package:market_hub/src/repository/authentication_repository/authentication_repository.dart';
import 'package:market_hub/src/repository/user_repository/user_repository.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  // TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();


  final userRepo = Get.put(UserRepository());

  // Call this function from Design & it will do the logic
  void registerUser(String email, String password, String role) {
    AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password);
  }

  // Get phoneNo from user and pass it to Auth Repository for Firebase Authentication

  /* void phoneAuthentication(phoneNo) {
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  } */

  Future<void> createUser(UserModel user) async {
    await userRepo.createUser(user);
    // phoneAuthentication(user.phoneNo);
    Get.to(() => const LoginScreen());
  }
}
