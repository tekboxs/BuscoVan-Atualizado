import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_final/constants.dart';
import 'package:projeto_final/keys.dart';
import 'package:projeto_final/screens/driver_home/diver_home_screen.dart';
import 'package:projeto_final/screens/home/home_screen.dart';
import 'package:projeto_final/screens/login/client/login_client.dart';
import 'package:projeto_final/screens/login/enums/login_enum.dart';
import 'package:projeto_final/screens/login/login_screen.dart';
import 'package:projeto_final/screens/splash/splash_screen.dart';
import 'package:projeto_final/storage.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final emailController = TextEditingController(text: "henzo@gmail.com");

  final passwordController = TextEditingController(text: "123456");

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(label: Text("Email")),
          ),
          TextFormField(
            obscureText: true,
            controller: passwordController,
            decoration: const InputDecoration(label: Text("Senha")),
          ),
          Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(
                vertical: 40,
              ),
              height: 60,
              child: ElevatedButton(
                  onPressed: () async {
                    Get.to(() => const SplashScreen());
                    AuthStatus result = await LoginClient.auth(
                        email: emailController.text,
                        password: passwordController.text);
                    if (!await validateResult(result)) {
                      Get.offAll(const LoginScreen());
                    }
                  },
                  child: const Text("Continuar")))
        ],
      ),
    );
  }

  Future<bool> validateResult(AuthStatus result) async {
    if (result == AuthStatus.blankInput) {
      kDefaultSnackBar(
          title: "Credenciais Inválidas", message: "Preencha todo os campos!");
      return false;
    } else if (result == AuthStatus.invalid) {
      kDefaultSnackBar(
          title: "Usuario ou senha invalidos", message: "tente novamente");
      return false;
    } else if (result == AuthStatus.validDriver) {
      await Storage.write(StorageTypes.bool, StorageKeys.hasLoggin, true);
      await Storage.write(StorageTypes.bool, StorageKeys.isDriver, true);
      Get.offAll(() => const DirverHomeScreen());
      return true;
    } else {
      await Storage.write(StorageTypes.bool, StorageKeys.hasLoggin, true);
      Get.offAll(() => const HomeScreen());
      return true;
    }
  }
}
