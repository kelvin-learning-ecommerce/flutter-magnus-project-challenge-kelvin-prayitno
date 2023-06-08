import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../config/env.dart';
import 'app_interceptor.dart';

@injectable
class BaseService {
  BaseService({required this.dio});

  final Dio dio;

  Future<Response<String>?> _get(String url, {Map<String, dynamic>? queryParameters}) async {
    return await dio.get(url, queryParameters: queryParameters);
  }

  Future<Response<String>?> _post(String url, {dynamic data, Options? options}) async {
    return await dio.post(url, data: data, options: options);
  }

  Future<dynamic> fetchGameList({int? page = 1, int? pageSize = 20}) async {
    try {
      Response<String>? response = await _get("", queryParameters: {
        "page": page,
        "page_size": pageSize,
        "platforms": '187',
        "ordering": "-released",
        "key": "02ef6ba5d13444ee86bad607e8bce3f4"
      });

      return response;
    } on DioException {
      throw DioException;
    }
  }

  Future<dynamic> fetchGameDetail(String code) async {
    try {
      Response<String>? response =
          await _get("/$code", queryParameters: {"key": "02ef6ba5d13444ee86bad607e8bce3f4"});

      return response;
    } on DioException {
      throw DioException;
    }
  }
}

Dio buildDio() {
  var dio = Dio();

  dio.interceptors.add(DioInterceptors());
  dio.interceptors.add(NetworkInterceptors(dio));

  // dio.options.headers['Authorization'] = 'Bearer ''$token';

  dio.options.baseUrl = "${Env.data.apiUrl}/api/v1/";
  dio.options.contentType = Headers.jsonContentType;
  dio.options.connectTimeout = const Duration(minutes: 10);
  dio.options.receiveTimeout = const Duration(minutes: 10);
  dio.options.sendTimeout = const Duration(minutes: 10);

  return dio;
}