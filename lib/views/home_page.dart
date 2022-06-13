import 'package:coin_rank/models/response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view_models/home_page_vm.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomePageVm homePageVm = HomePageVm();
    Get.put(homePageVm);

    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<List<ListOfCoinsResponse>>(
          future: homePageVm.getListOfCoins(),
          builder: (context,data){
            if(data.hasData){
              return ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16,vertical: 20),
                itemCount: data.data!.length,
                itemBuilder: (context,index){
                  return Card(
                    child: ListTile(
                      title: Text(data.data![index].name!),
                      subtitle: Text("Rank -" + data.data![index].rank!.toString()),
                      trailing: Text(data.data![index].symbol!),
                    ),
                  );
                },
              );
            }else if(data.hasError){
              return Center(
                child: Text(data.error.toString()),
              );
            }else{
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
