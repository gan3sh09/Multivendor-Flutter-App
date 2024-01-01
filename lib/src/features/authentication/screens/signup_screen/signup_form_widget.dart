import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_hub/main.dart';
import 'package:market_hub/src/features/authentication/screens/login_screen/login_screen.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';

class SignUpFormWidget extends StatefulWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  State<SignUpFormWidget> createState() => _SignUpFormWidgetState();
}

class _SignUpFormWidgetState extends State<SignUpFormWidget> {
  // Variables
  var options = ["Customer", "Vendor"];
  String? _selectedVal = "Customer";
  var role = "Customer";

  bool _showPassword = true;
  bool _showConfirmpassword = true;

  bool showProgress = false;
  bool visible = false;

  final formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: marketHubFormHeight - 10),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: fullNameController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              enabled: true,
              validator: (value) {
                if (value!.isEmpty ||
                    !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                  return 'Please enter your full name';
                } else {
                  return null;
                }
              },
              decoration: const InputDecoration(
                  label: Text(marketHubFullName),
                  prefixIcon: Icon(Icons.person_outline_rounded)),
            ),
            const SizedBox(
              height: marketHubDefaultSize - 20,
            ),
            TextFormField(
              controller: emailController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              enabled: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Email cannot be empty";
                }
                if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                    .hasMatch(value)) {
                  return ("Please enter a valid email");
                } else {
                  return null;
                }
              },
              onChanged: (value) {},
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  label: Text(marketHubEmail),
                  prefixIcon: Icon(Icons.email_outlined)),
            ),
            const SizedBox(
              height: marketHubDefaultSize - 20,
            ),
            TextFormField(
              controller: phoneController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              enabled: true,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty ||
                    !RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(value)) {
                  return 'Please enter your phone number';
                } else {
                  return null;
                }
              },
              onChanged: (value) {},
              decoration: const InputDecoration(
                  label: Text(marketHubPhone),
                  prefixIcon: Icon(Icons.phone_outlined)),
            ),
            const SizedBox(
              height: marketHubDefaultSize - 20,
            ),
            TextFormField(
              controller: passwordController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                RegExp regex = RegExp(r'^.{6,}$');
                if (value!.isEmpty) {
                  return "Password cannot be empty";
                }
                if (!regex.hasMatch(value)) {
                  return ("please enter valid password min. 6 character");
                } else {
                  return null;
                }
              },
              onChanged: (value) {},
              obscureText: _showPassword,
              decoration: InputDecoration(
                label: const Text(marketHubPassword),
                prefixIcon: const Icon(Icons.fingerprint),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _showPassword = !_showPassword;
                    });
                  },
                  icon: Icon(
                      _showPassword ? Icons.visibility_off : Icons.visibility),
                  color: marketHubSecondaryColor,
                ),
              ),
            ),
            const SizedBox(
              height: marketHubDefaultSize - 20,
            ),
            TextFormField(
              controller: confirmPasswordController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (confirmPasswordController.text != passwordController.text) {
                  return "Password did not match";
                } else {
                  return null;
                }
              },
              onChanged: (value) {},
              obscureText: _showConfirmpassword,
              decoration: InputDecoration(
                label: const Text(marketHubConfirmPassword),
                prefixIcon: const Icon(Icons.fingerprint),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _showConfirmpassword = !_showConfirmpassword;
                    });
                  },
                  icon: Icon(_showConfirmpassword
                      ? Icons.visibility_off
                      : Icons.visibility),
                  color: marketHubSecondaryColor,
                ),
              ),
            ),
            const SizedBox(
              height: marketHubDefaultSize - 20,
            ),
            DropdownButtonFormField<String>(
              isDense: true,
              isExpanded: false,
              value: _selectedVal,
              items: options
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(),
              onChanged: (newValueSelected) {
                setState(() {
                  _selectedVal = newValueSelected!;
                  role = newValueSelected;
                });
              },
              icon: const Icon(Icons.arrow_drop_down_circle),
              decoration: const InputDecoration(
                labelText: "Choose a role",
                prefixIcon: Icon(Icons.people_alt_outlined),
                border: UnderlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: marketHubDefaultSize - 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    showProgress = true;
                  });
                  signUp(
                    emailController.text,
                    passwordController.text,
                    role,
                  );
                },
                child: Text(
                  marketHubSignup.toUpperCase(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void signUp(
    String email,
    String password,
    String role,
  ) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    if (formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore(email, role)})
          .whenComplete(
            () => Get.snackbar("Success", "Your account has been created.",
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.green,
                colorText: Colors.white),
          )
          .catchError((error, stackTrace) {
        if (error is FirebaseAuthException) {
          if (error.code == 'email-already-in-use') {
            Get.snackbar("Error", "Email is already in use.",
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.redAccent,
                colorText: Colors.black);
          }
        } else {
          Get.snackbar("Error", "Something went wrong. Try again!",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.redAccent,
              colorText: Colors.black);
        }
        print(error.toString());
      });

      navigatorKey.currentState!.popUntil((route) => route.isActive);
    }
  }

  postDetailsToFirestore(
    String email,
    String role,
  ) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var user = _auth.currentUser;
    CollectionReference ref = FirebaseFirestore.instance.collection('Users');
    ref.doc(user!.uid).set({
      'fullName': fullNameController.text,
      'email': emailController.text,
      'phone': phoneController.text,
      'role': role
    });
    Get.to(() => const LoginScreen());
  }
}
