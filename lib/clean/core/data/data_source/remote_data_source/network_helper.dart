import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';

class NetworkHelper {
  static late final Dio dio;

  static void init() {
    final BaseOptions options = BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        headers: {'Content-Type': 'application/json'});
    dio = Dio(options);
  }

  static Future<List<dynamic>> getData(
      {required String endPoint,
      Options? options,
      Map<String, dynamic>? query,
        String? lang,
        String? token,}) async {
    dio.options.headers ={
      'lang': lang,
      'Authorization': token,
    };
    log('url ====> $endPoint');
    final Response<dynamic> response =
        await dio.get(endPoint, options: options, queryParameters: query);
    final List<dynamic> data = jsonDecode(response.toString());
    return data;
  }

  static Future<dynamic> postData(
      {required String endPoint,
      Map<String, dynamic>? query,
      Options? options,
      String? lang,
      String? token,
      Map<String, dynamic>? header}) async {
    dio.options.headers ={
      'lang': lang,
      'Authorization': token,
    };
    log('url ====> $endPoint');
    final Response<dynamic> response =
        await dio.post(endPoint, options: options, data: query);
    final dynamic data = jsonDecode(response.toString());
    return data;
  }
}
