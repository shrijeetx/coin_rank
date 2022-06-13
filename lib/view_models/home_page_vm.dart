import 'package:coin_rank/models/response.dart';
import 'package:get/get.dart';

import '../services/repository/auth_repository.dart';

class HomePageVm extends GetxController{
  NetworkRepository apiHandler = Get.find();

  Future<List<ListOfCoinsResponse>> getListOfCoins() async {
    List<ListOfCoinsResponse> response = await apiHandler.getListOfCoinsAPI();
    return response;
  }
}