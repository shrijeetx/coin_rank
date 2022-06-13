import 'package:coin_rank/services/networking.dart';
import 'package:coin_rank/services/networkmanager/auth_networkmanager.dart';
import 'package:coin_rank/services/repository/auth_repository.dart';
import 'package:coin_rank/utils/constants.dart';
import 'package:coin_rank/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  //api services initialization
  NetworkManager? networkManager = await getAuthNetworkManager(baseUrl);
  NetworkRepository repository = NetworkRepository(apiClient: networkManager!);
  Get.put(repository);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

