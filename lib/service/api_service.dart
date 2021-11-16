import 'package:dio/dio.dart';


class ApiDio {
  late Dio _dio;

  ApiDio(String baseUrl) {
    var options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 10000,
    );
    _dio = Dio(options);
    _dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
  }

  Dio getDio() {
    return _dio;
  }
}

class ApiService {
  static const String _baseUrl = "https://api.github.com/";
  static late ApiService? _instance = null;
  late ApiDio _apiDio;

  ApiService() {
    _apiDio = ApiDio(_baseUrl);
  }

  static ApiService getInstance() {
    if (_instance == null) {
      _instance = ApiService();
    }
    return _instance!;
  }
  //get
  Future _get(String url, Map<String, dynamic>? params) async {
    var response = await _apiDio.getDio().get(url, queryParameters: params);
    return response.data;
  }
  //post
  Future _post(String url, Map<String, dynamic>? params) async {
    var response = await _apiDio.getDio().post(url, data: params);
    return response.data;
  }

  Stream post({required String url, Map<String, dynamic>? params}) =>
      Stream.fromFuture(_post(url, params)).asBroadcastStream();

  Stream get({required String url, Map<String, dynamic>? params}) =>
      Stream.fromFuture(_get(url, params)).asBroadcastStream();
}