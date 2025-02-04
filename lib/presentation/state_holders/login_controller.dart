import 'dart:developer';

import 'package:flutter_task/data/models/network_response.dart';
import 'package:flutter_task/data/services/network_caller.dart';
import 'package:flutter_task/data/utility/urls.dart';
import 'package:flutter_task/presentation/state_holders/auth_controller.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  bool _inProgress = false;
  String _message = '';

  bool get inProgress => _inProgress;
  String get message => _message;

  Future<bool> login(String email, String password) async {
    _inProgress = true;
    update();

    final NetworkResponse response =
        await NetworkCaller.postRequest(Urls.login, {
      "email": email,
      "password": password,
    });

    _inProgress = false;
    update();

    if (response.isSuccess) {
      log(response.toString());
      _message = response.responseJson?['message'] ?? 'Login Successful';

      String? token = response.responseJson?['data']?['accessToken'];

      if (token != null) {
        await AuthController.setAccessToken(token);
        return true;
      } else {
        log('Token not found');
        return false;
      }
    } else {
      _message = response.responseJson?['message'] ?? 'Login failed';
      log(_message);
      return false;
    }
  }
}
