import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_final/screens/driver_home/diver_home_screen.dart';
import 'package:projeto_final/screens/home/home_screen.dart';

import '../../../constants.dart';
import '../../../keys.dart';
import '../../../size_config.dart';
import '../../../storage.dart';
import '../../login/login_screen.dart';

class Body extends StatefulWidget {
  final bool isLogin;
  const Body({Key? key, this.isLogin = false}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  deviceLogin() async {
    bool? hasLoggin = await Storage.read(StorageKeys.hasLoggin);
    if (hasLoggin == null) {
      Get.off(() => const LoginScreen());
    } else if (hasLoggin == true) {
      bool isDriver = await Storage.read(StorageKeys.isDriver) ?? false;
      if (isDriver) {
        Get.off(() => const DirverHomeScreen());
      } else {
        Get.off(() => const HomeScreen());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return FutureBuilder(
      future: widget.isLogin ? deviceLogin() : delay(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data == FutureErrors.errorResponse) {
            //ANCHOR SNAPSHOT ERROR
            return const Center(
              child: Icon(
                Icons.wifi_off,
                color: Colors.red,
                size: 40,
              ),
            );
          }
          //ANCHOR SNAPSHOT SUCCESS

          return const SizedBox();
        } else {
          //ANCHOR SNAPSHOT NO DATA
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
      },
    );
  }

  delay() async {
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }
}
