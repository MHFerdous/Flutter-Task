import 'package:flutter/material.dart';
import 'package:flutter_task/presentation/state_holders/auth_controller.dart';
import 'package:flutter_task/presentation/state_holders/user_profile_controller.dart';
import 'package:flutter_task/presentation/ui/screens/login_screen.dart';
import 'package:get/get.dart';

Widget userInfo(UserProfileController userProfileController) {
  return Column(
    spacing: 16,
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(
        child: CircleAvatar(
          radius: 80,
          backgroundColor: Colors.grey.shade300,
          backgroundImage: (userProfileController
                      .userProfileModel.data?.profilePicture?.isNotEmpty ??
                  false)
              ? NetworkImage(
                  userProfileController.userProfileModel.data!.profilePicture!)
              : null,
          child: (userProfileController
                      .userProfileModel.data?.profilePicture?.isEmpty ??
                  true)
              ? const Icon(Icons.person, size: 50, color: Colors.white)
              : null,
        ),
      ),
      const SizedBox(height: 16),
      Text(
        'User Name: ${userProfileController.userProfileModel.data?.firstName} ${userProfileController.userProfileModel.data?.lastName}  ',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      ),
      Text(
        'Email: ${userProfileController.userProfileModel.data?.email}',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      ),
      Text(
        'Contact Number: ${userProfileController.userProfileModel.data?.contact}',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      ),
      Text(
        'Role: ${userProfileController.userProfileModel.data?.role}',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      ),
      SizedBox(
        height: 16,
      ),
      ElevatedButton(
        onPressed: () {
          logout();
        },
        child: Text('Logout?'),
      ),
    ],
  );
}

logout() {
  AuthController.clear();
  Get.offAll(
    () => LoginScreen(),
  );
}
