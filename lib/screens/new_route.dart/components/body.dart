import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_final/screens/driver_home/client/driver_client.dart';
import 'package:projeto_final/screens/driver_home/diver_home_screen.dart';
import 'package:projeto_final/theme.dart';

import '../../../size_config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final startController = TextEditingController();
  final endController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Insira os pontos da rota",
            style: AppTheme.titleText(fontSize: 20),
          ),
          TextField(
            controller: startController,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(label: Text("Ponto A")),
          ),
          const SizedBox(
            height: 40,
          ),
          TextField(
            controller: endController,
            decoration: const InputDecoration(label: Text("Ponto B")),
          ),
          Container(
            padding: const EdgeInsets.only(top: 35),
            width: SizeConfig.screenWidth,
            child: ElevatedButton(
                onPressed: () async {
                  await DriverClient.newRoute(
                      start: startController.text, end: endController.text);
                  Get.offAll(const DirverHomeScreen());
                },
                child: const Text("Enviar")),
          )
        ],
      ),
    );
  }
}
