import 'package:flutter/material.dart';
import 'package:flutter_task/presentation/state_holders/auth_controller.dart';
import 'package:flutter_task/presentation/ui/screens/login_screen.dart';
import 'package:flutter_task/presentation/ui/screens/user_profile_screen.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkUserAuthState();
  }

  Future<void> checkUserAuthState() async {
    bool loggedIn = await AuthController.isLoggedIn();

    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(
        () => loggedIn ? const UserProfileScreen() : const LoginScreen(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Welcome...'),
      ),
    );
  }
}
