import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_task/application/app.dart';
import 'package:flutter_task/data/models/network_response.dart';
import 'package:flutter_task/presentation/state_holders/auth_controller.dart';
import 'package:flutter_task/presentation/ui/screens/login_screen.dart';
import 'package:http/http.dart' as http;

class NetworkCaller {
  static Future<NetworkResponse> getRequest(String url) async {
    return _sendRequest(() => http.get(Uri.parse(url), headers: _headers()));
  }

  static Future<NetworkResponse> postRequest(
      String url, Map<String, dynamic> body,
      {bool isLogin = false}) async {
    return _sendRequest(() => http.post(
          Uri.parse(url),
          headers: _headers(isLogin),
          body: jsonEncode(body),
        ));
  }

  static Future<NetworkResponse> _sendRequest(
      Future<http.Response> Function() requestFunction) async {
    try {
      final response = await requestFunction();
      log('Status: ${response.statusCode}');
      log('Response: ${response.body}');

      if (response.statusCode == 200) {
        return NetworkResponse(
            true, response.statusCode, jsonDecode(response.body));
      } else if (response.statusCode == 401) {
        log('Unauthorized - Redirecting to login');
        gotoLogin();
      }
      return NetworkResponse(false, response.statusCode, null);
    } catch (e) {
      log('Request Error: $e');
      return NetworkResponse(false, -1, null);
    }
  }

  static Map<String, String> _headers([bool isLogin = false]) {
    final token = AuthController.accessToken;
    return {
      'Content-Type': 'application/json',
      if (!isLogin && token != null) 'Authorization': 'Bearer $token',
    };
  }

  static void gotoLogin() async {
    await AuthController.clear();
    Navigator.pushAndRemoveUntil(
      MyApp.globalKey.currentContext!,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
      (route) => false,
    );
  }
}
