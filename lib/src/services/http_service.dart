// Package imports:
import 'package:dio/dio.dart';

abstract interface class HttpService {
  Future<Response> getData({BaseOptions? options, required String path});
}

class HttpServiceImpl implements HttpService {
  final _httpClient = Dio();

  @override
  Future<Response> getData({BaseOptions? options, required String path}) async {
    try {
      _httpClient.options;
      final response = await _httpClient.get(path);
      return response;
    } catch (error) {
      throw Exception(error);
    }
  }
}
