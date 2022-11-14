import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_final/screens/driver_home/client/driver_client.dart';
import 'package:projeto_final/screens/new_route.dart/new_route_screen.dart';
import 'package:projeto_final/size_config.dart';
import 'package:projeto_final/theme.dart';

import '../diver_home_screen.dart';

class RoutesSection extends StatelessWidget {
  final List? routes;
  const RoutesSection({Key? key, required this.routes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Suas Rotas",
                style: AppTheme.labelTextGrey(),
              ),
              TextButton.icon(
                  onPressed: () async {
                    Get.to(() => const NewRouteScreen());
                  },
                  icon: const Icon(Icons.add),
                  label: const Text("Nova Rota"))
            ],
          ),
          RouteBuilder(routes: routes),
        ],
      ),
    );
  }
}

class RouteBuilder extends StatelessWidget {
  const RouteBuilder({
    Key? key,
    required this.routes,
  }) : super(key: key);

  final List? routes;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(10),
      ),
      width: SizeConfig.screenWidth,
      height: getProportionateScreenHeight(200),
      child: ListView.builder(
        itemCount: (routes ?? []).length,
        itemBuilder: (context, index) {
          return ListTile(
            trailing: IconButton(
                onPressed: () async {
                  await DriverClient.removeRoute(index);
                  Get.offAll(() => const DirverHomeScreen());
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                )),
            title: Text("${routes![index]}"),
          );
        },
      ),
    );
  }
}
