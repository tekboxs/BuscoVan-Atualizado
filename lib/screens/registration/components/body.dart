import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:projeto_final/constants.dart';
import 'package:projeto_final/screens/login/login_screen.dart';
import 'package:projeto_final/screens/registration/client/registration_client.dart';
import 'package:projeto_final/screens/registration/components/registration_form.dart';
import 'package:flutter/material.dart';
import 'package:projeto_final/screens/splash/splash_screen.dart';

import '../../../size_config.dart';

class Body extends StatefulWidget {
  final bool isDriver;
  const Body({Key? key, required this.isDriver}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          widget.isDriver
              ? GestureDetector(
                  child: SizedBox(
                    width: 170,
                    child: Lottie.asset(
                      'lottie/122456-driver-steering-wheel-car-map-road-location-marker-sign-preloader.json',
                      animate: true,
                    ),
                  ),
                )
              : GestureDetector(
                  child: SizedBox(
                    width: 170,
                    child: Lottie.asset(
                      'lottie/5450-my-children.json',
                      animate: true,
                    ),
                  ),
                ),
          const Flexible(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: SingleChildScrollView(child: RegistrationForm()),
              )),
          Container(
              width: SizeConfig.screenWidth - 40,
              margin: const EdgeInsets.only(bottom: 30),
              height: 55,
              child: ElevatedButton(
                  onPressed: () async {
                    Get.to(() => const SplashScreen());

                    Map<String, dynamic> currentData = {
                      "cpf": cpfController.text,
                      "email": emailController.text,
                      "nome": nameController.text,
                      "numeroCelular": phoneController.text,
                      "senha": passwordController.text,
                      "ultimoNome": lastNameController.text,
                    };
                    widget.isDriver
                        ? RegistrationClient.registerNewDriver(currentData)
                        : RegistrationClient.registerNewStudent(currentData);
                    await Future.delayed(const Duration(seconds: 1));
                    kDefaultSnackBar(
                        message: "",
                        title: "Conta Criada!",
                        color: Colors.green);
                    await Get.offAll(() => const LoginScreen());
                  },
                  child: const Text("Confirmar")))
        ],
      ),
    );
  }
}
