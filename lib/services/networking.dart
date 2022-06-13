import 'package:dio/dio.dart';

import 'network_client.dart';
import 'networkmanager/auth_networkmanager.dart';

Dio? _dio;
NetworkManager? _networkManager;
NetworkClient? _client;

BaseOptions _requestOptions = BaseOptions(
  baseUrl: "",
  headers: {},
  queryParameters: {},
  responseType: ResponseType.plain,
  connectTimeout: 10000,
  receiveTimeout: 10000,
  contentType: 'application/json',
);

Future<Dio?> _getDio() async {
  _dio = await _createDio(_requestOptions);
  return _dio;
}

Future<Dio> _createDio(BaseOptions options) async {
  Dio dio = Dio(options);
  dio.interceptors.add(LogInterceptor(
      request: true,
      responseHeader: true,
      responseBody: true,
      requestHeader: true,
      error: true,));
  _dio = dio;
  return dio;
}


Future<NetworkClient?> getClient(String baseUrl) async {
  _client = NetworkClient(await _getDio(), baseUrl);
  return _client;
}


Future<NetworkManager?> getAuthNetworkManager(String baseURL) async {
  _networkManager = NetworkManager(await getClient(baseURL));
  return _networkManager;
}
