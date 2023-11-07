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
        // Respuesta exitosa
        return LoginResponse(data: response.data, success: true);
      } else {
        // Otro estado de error
        return LoginResponse(data: response.data, success: false);
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        // Estado 401: Usuario y/o contraseña incorrectos
        return LoginResponse(data: e.response?.data, success: false);
      } else {
        // Otros errores de red
        return LoginResponse(data: e.response?.data, success: false);
      }
    } catch (e) {
      // Otro error
      return LoginResponse(data: e, success: false);
    }
  }
}

class LoginResponse {
  dynamic data;
  bool success;
  LoginResponse({required this.data, required this.success});
}
