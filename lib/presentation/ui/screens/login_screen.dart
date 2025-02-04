import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_task/presentation/state_holders/login_controller.dart';
import 'package:flutter_task/presentation/ui/screens/user_profile_screen.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Form(
            key: _formKey,
            child: Column(
              spacing: 16,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                ),
                Text(
                  'Login Here...',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400),
                ),
                TextFormField(
                  controller: _emailTEController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(hintText: 'Email'),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Please enter your email';
                    }
                    if (value!.isEmail == false) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _passTEController,
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(hintText: 'Password'),
                ),
                GetBuilder<LoginController>(
                  builder: (loginController) {
                    if (loginController.inProgress) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          login(loginController);
                        }
                      },
                      child: Text('Login'),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> login(LoginController controller) async {
    final response = await controller.login(
      _emailTEController.text.trim(),
      _passTEController.text,
    );
    log(response.toString());
    if (response) {
      Get.snackbar('Successful', controller.message);
      Get.offAll(
        () => UserProfileScreen(),
      );
    } else {
      Get.snackbar('Failed', controller.message,
          backgroundColor: Colors.redAccent);
    }
  }
}
