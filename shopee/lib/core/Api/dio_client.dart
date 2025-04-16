import 'package:dio/dio.dart';

class DioClient {
  final Dio dio;

  DioClient({Dio? dio}) : dio = dio ?? Dio();

  Future<Response> get(String url) async {
    return await dio.get(url);
  }
}