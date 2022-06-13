import 'dart:convert';

import '../../models/response.dart';
import '../endpoints.dart';
import '../endpoints/auth_endpoint.dart';
import '../network_client.dart';
import '../results.dart';

class NetworkManager {
  INetworkClient? _client;
  NetworkManager(this._client);

  Future<Result?> getListOfCoins() async {
    AuthEndpoint endpoint = AuthEndpoints.listOfCoins;
    Result? result = await _client!.call(endpoint);

    if (result is Success) {
      List<ListOfCoinsResponse> response = List<ListOfCoinsResponse>.from(json.decode(result.data.toString()).map((x) => ListOfCoinsResponse.fromJson(x)));
      return Success<List<ListOfCoinsResponse>>(response);
    }
    return result;
  }

}
