import 'package:flutter/cupertino.dart';

import '../../models/response.dart';
import '../networkmanager/auth_networkmanager.dart';
import '../results.dart';

class NetworkRepository with ChangeNotifier {
  final NetworkManager apiClient;

  NetworkRepository({required this.apiClient});

  Future<List<ListOfCoinsResponse>> getListOfCoinsAPI() async {
    Result? apiResult = await apiClient.getListOfCoins();
    if (apiResult is Success) return apiResult.data;
    if (apiResult is Error) throw apiResult.error;
    throw "Error!";
  }

}
