import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_final/screens/registration/registration_screen.dart';
import 'package:projeto_final/theme.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
              onPressed: () {
                Get.to(() => const RegistrationScreen(
                      isDriver: true,
                    ));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.displayColor),
              child: const Text("Sou Motorista")),
          ElevatedButton(
              onPressed: () {
                Get.to(() => const RegistrationScreen(
                      isDriver: false,
                    ));
              },
              child: const Text("Sou Estudante")),
        ],
      ),
    );
  }
}
