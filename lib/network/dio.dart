import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_sanctum/providers/auth.dart';

Dio dio() {
  var dio = Dio(BaseOptions(
      baseUrl: 'http://10.0.2.2:8000/api/',
      responseType: ResponseType.json,
      headers: {
        'accept': 'application/json',
        'content-type': 'application/json',
      }));

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        if (options.headers.containsKey('auth')) {
          var token = await Auth().getToken();
          options.headers.addAll({'Authorization': 'Bearer $token'});
        }
        return handler.next(options);
      },
    ),
  );

  return dio;
}