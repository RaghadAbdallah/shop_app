import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';

class NetworkHelper {
  static late final Dio dio;

  static void init() {
    final BaseOptions options = BaseOptions(
      baseUrl: '',
    );
    dio = Dio(options);
  }

  static Future<List<dynamic>> getData(
      {required String endPoint,
      Options? options,
      Map<String, dynamic>? query}) async {
    log('url ====> $endPoint');
    final Response<dynamic> response =
        await dio.get(endPoint, options: options, queryParameters: query);
    final List<dynamic> data = jsonDecode(response.toString());
    return data;
  }

  static Future<dynamic> postData(
      {required String endPoint,
      String? query,
      Options? options,
      Map<String, dynamic>? header}) async {
    log('url ====> $endPoint');
    final Response<dynamic> response =
        await dio.post(endPoint, options: options, data: query);
    final dynamic data = jsonDecode(response.toString());
    return data;
  }
}
