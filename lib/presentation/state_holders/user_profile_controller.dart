import 'package:flutter_task/data/models/network_response.dart';
import 'package:flutter_task/data/models/user_profile_model.dart';
import 'package:flutter_task/data/services/network_caller.dart';
import 'package:flutter_task/data/utility/urls.dart';
import 'package:get/get.dart';

class UserProfileController extends GetxController {
  bool _inProgress = false;
  String _message = '';
  UserProfileModel _userProfileModel = UserProfileModel();

  bool get inProgress => _inProgress;
  String get message => _message;
  UserProfileModel get userProfileModel => _userProfileModel;

  Future<bool> userProfile() async {
    _inProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller.getRequest(Urls.userProfile);
    _inProgress = false;
    update();
    if (response.isSuccess) {
      _userProfileModel = UserProfileModel.fromJson(response.responseJson!);
      _message = response.responseJson?['message'] ?? '';
      return true;
    } else {
      _message = response.responseJson?['message'] ?? '';
      return false;
    }
  }
}
