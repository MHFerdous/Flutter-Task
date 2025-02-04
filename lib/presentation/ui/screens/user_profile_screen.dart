import 'package:flutter/material.dart';
import 'package:flutter_task/presentation/state_holders/user_profile_controller.dart';
import 'package:flutter_task/presentation/ui/methods/user_info.dart';
import 'package:get/get.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      Get.find<UserProfileController>().userProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('User Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GetBuilder<UserProfileController>(
          builder: (userProfileController) {
            if (userProfileController.inProgress) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return userInfo(userProfileController);
          },
        ),
      ),
    );
  }
}
