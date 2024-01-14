import 'dart:convert';

import 'package:dio/dio.dart';

class LoginController {
  final String email;
  final String password;

  LoginController({required this.email, required this.password});

  bool validateEmail() {
    if (email.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  bool validatePassword() {
    if (password.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  bool validateAll() {
    if (email.isEmpty || password.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  var dio = Dio();

  Future<LoginResponse> login() async {
    try {
      var data = json.encode({"email": email, "password": password});
      var headers = {'Content-Type': 'application/json'};
      var response = await dio.request(
        'http://192.168.100.10:3000/login',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        return LoginResponse(
            data: response.data, success: response.data['status']);
      } else {
        return LoginResponse(data: "Error", success: false);
      }
    } on DioException catch (e) {
      print(e.response?.statusCode);
      return LoginResponse(data: 'Error', success: false);
    }
  }
}

class LoginResponse {
  dynamic data;
  bool success;
  LoginResponse({required this.data, required this.success});
}
