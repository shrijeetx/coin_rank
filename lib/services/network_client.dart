import 'package:coin_rank/services/results.dart';
import 'package:dio/dio.dart';

class INetworkClient {
  Future<Result?> call(dynamic endpoint, {bool formData = false}) async {
    return null;
  }
}

class NetworkClient extends INetworkClient {
  Dio? _dio;
  String? baseURL;

  NetworkClient(this._dio, this.baseURL);

  @override
  Future<Result?> call(dynamic endpoint, {bool formData = false}) async {
    Result? result;
    _dio!.options.baseUrl = baseURL!;
    _dio!.options.method = endpoint.method.toString().split('.').last;
    _dio!.options.headers = endpoint.headers;

   if (formData) {

     var formData = FormData.fromMap(endpoint.body.toJson());
     await _dio!.request(endpoint.path, data: formData)
         .then((Response response) {
       result = Success<Response>(response);
     }).onError((error, stackTrace) {
       result = Error(error);
     });

     return result;

   } else {

     await _dio!
         .request(endpoint.path, data: endpoint.body)
         .then((Response response) {
       result = Success<Response>(response);
     }).onError((error, stackTrace) {
       result = Error(error);
     });
     return result;

   }
  }
}
