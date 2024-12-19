import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio;

  DioClient()
      : _dio = Dio(BaseOptions(
    baseUrl: '192.168.0.31:7771', // API 기본 URL
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 5),
    headers: {'Content-Type': 'application/json'},
  )) {
    _dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      responseBody: true,
    ));
  }

  Dio get dio => _dio;
}
