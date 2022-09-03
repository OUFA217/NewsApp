// ignore_for_file: unused_element

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

Map<String, String> _headers = <String, String>{
  'Content-Type': 'application/json',
  'Accept': 'application/json',
};

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://192.168.1.9:9000/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

   static Future<Response> getdata({
    required url,
    required Map<String, dynamic> query,
  }) async {
    return await dio!.get(
      url,
      queryParameters: query,
    );
  }
}
