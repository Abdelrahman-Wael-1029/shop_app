import 'package:dio/dio.dart';

class DioHelper {
  static late Dio _dio;

  static void init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        headers: {
          'Content-Type': 'application/json',
        },
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    String lang = 'en',
    String? token,
    Map<String, dynamic>? query,
  }) async {
    _dio.options.headers.addAll({
      'lang': lang,
      'Authorization': token,
    });
    return await _dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    required FormData data,
    String lang = 'en',
    String? token,
    Map<String, dynamic>? query,
  }) async {
    // add some header
    _dio.options.headers.addAll({
      'lang': lang,
      'Authorization': token,
    });
    return await _dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> putData({
    required String url,
    required data,
    String lang = 'en',
    String? token,
    Map<String, dynamic>? query,
  }) async {
    // add some header
    _dio.options.headers.addAll({
      'lang': lang,
      'Authorization': token,
    });
    return await _dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
