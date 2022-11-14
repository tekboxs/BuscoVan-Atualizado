import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_final/screens/home/client/home_client.dart';
import 'package:projeto_final/screens/home/components/body.dart';
import 'package:projeto_final/screens/home/controllers/home_controller.dart';
import 'package:projeto_final/screens/home/models/search_model.dart';
import 'package:projeto_final/size_config.dart';
import 'package:projeto_final/theme.dart';

import '../../../constants.dart';

class SearchBuilder extends StatelessWidget {
  const SearchBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return FutureBuilder(
            future: HomeClient.getByFilter(searchController.text),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data == FutureErrors.errorResponse) {
                  //ANCHOR SNAPSHOT ERROR
                }
                if (snapshot.data == FutureErrors.emptyResponse) {}
                //ANCHOR SNAPSHOT SUCCESS
                List<SearchModel> searchResult =
                    snapshot.data as List<SearchModel>;

                return Container(
                  padding: const EdgeInsets.only(top: 25),
                  height: getProportionateScreenHeight(300),
                  child: ListView.builder(
                      itemCount: searchResult.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(searchResult[index].route),
                          subtitle: Text(
                              "Motorista: ${searchResult[index].driverName}"),
                          trailing: Text(
                            "Cel: ${searchResult[index].driverPhone}",
                            style: AppTheme.labelTextGrey(),
                          ),
                        );
                      }),
                );
              } else {
                //ANCHOR SNAPSHOT NO DATA
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
            },
          );
        });
  }
}
