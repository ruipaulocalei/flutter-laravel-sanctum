import 'dart:convert';

import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sanctum/models/login_response.dart';
import 'package:flutter_sanctum/models/message_result.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_sanctum/models/user_model.dart';
import 'package:flutter_sanctum/network/dio.dart';

class Auth extends ChangeNotifier {
  bool _authenticated = false;
  UserModel? _userModel;
  final storage = FlutterSecureStorage();
  UserModel? get user => _userModel;

  bool get authenticated => _authenticated;

  Future<MessageResult> login(UserModel user) async {
      final data = {
        'username': user.username,
        'password': user.password,
      };
      Dio.Response response =
      await dio().post('user/login/', data: jsonEncode(data));
      if (response.statusCode == 200) {
        final loginResponse = loginResponseFromJson(response.toString());
        String token = loginResponse.token;
        await attempt(token);
        await storeToken(token);
        return MessageResult('Login efectuado com sucesso', response.statusCode!.toInt());
      } else {
        return MessageResult('Por favor verifique o teu e-mail e senha', response.statusCode!.toInt());
      }
  }

  Future attempt(String token) async {
    try {
      Dio.Response response = await dio().get(
        'user/me/',
        options: Dio.Options(
            headers: {
              'Authorization': 'Bearer $token',
            }
        ),
      );
      _userModel = UserModel.fromJson(jsonDecode(response.toString()));
      _authenticated = true;
    } catch(e) {
      _authenticated = false;
    }
    notifyListeners();
  }

  Future<void> storeToken(String token) async{
    await storage.write(key: 'token', value: token);
  }

  Future getToken() async{
    return await storage.read(key: 'token');
  }

  Future deleteToken() async{
    await storage.delete(key: 'token');
  }

  Future<void> logout() async {
    _authenticated = false;

    await deleteToken();
    notifyListeners();
  }
}
