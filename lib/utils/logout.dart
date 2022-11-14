import 'package:get/get.dart';

import '../keys.dart';
import '../screens/login/login_screen.dart';
import '../screens/splash/splash_screen.dart';
import '../storage.dart';

logoutFunction() async {
  Get.offAll(() => const SplashScreen(), transition: Transition.downToUp);

  //reset all keys to new login
  await Storage.remove(StorageKeys.hasLoggin);
  await Storage.remove(StorageKeys.isDriver);
  await Storage.remove(StorageKeys.userGuid);
  //end of reset

  await Get.off(() => const LoginScreen(), transition: Transition.downToUp);
}
