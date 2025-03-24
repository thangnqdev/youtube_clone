import 'package:dio/dio.dart';
import 'package:youtube/core/constants/url/base_url.dart';

class DioClient {
  static const int _connectTimeout = 5000;
  static const int _reveiceTimeout = 5000;
  late Dio _dio;
  DioClient({String? baseUrl}) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl ?? BaseUrl.baseUrl,
        connectTimeout: Duration(milliseconds: _connectTimeout),
        receiveTimeout: Duration(milliseconds: _reveiceTimeout),
        headers: {'Content-Type': 'application/json'},
      ),
    );
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print('Request: ${options.method} ${options.uri}');
          handler.next(options);
        },
        onResponse: (response, handler) {
          print('Response: ${response.statusCode}');
          handler.next(response);
        },
        onError: (DioException e, handler) {
          print('Errors: ${e.message}');
          handler.next(e);
        },
      ),
    );
  }
  Dio get dio => _dio;

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await _dio.get(path, queryParameters: queryParameters);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post(String path, {dynamic data}) async {
    try {
      return await _dio.post(path, data: data);
    } catch (e) {
      rethrow;
    }
  }
}
