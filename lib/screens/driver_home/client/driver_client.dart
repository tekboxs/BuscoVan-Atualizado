import 'package:projeto_final/constants.dart';
import 'package:projeto_final/enums/enums.dart';

import '../../../keys.dart';
import '../../../storage.dart';

class DriverClient {
  static getInfos() async {
    String guid = await Storage.read(StorageKeys.userGuid);
    var data = await kDatabase.collection(Collections.drivers).doc(guid).get();

    if (data.data() == null) return LoginStatus.error;

    return data.data();
  }

  static removeRoute(index) async {
    String guid = await Storage.read(StorageKeys.userGuid);
    var store = await kDatabase.collection(Collections.drivers).doc(guid).get();
    Map data = store.data()!;
    List currentRoutes = data['rotas'];
    currentRoutes.removeAt(index);
    kDatabase.collection(Collections.drivers).doc(guid).update(
      {"rotas": currentRoutes},
    );
  }

  static newRoute({required String start, required String end}) async {
    String guid = await Storage.read(StorageKeys.userGuid);

    var store = await kDatabase.collection(Collections.drivers).doc(guid).get();

    Map data = store.data()!;
    List currentRoutes = (data['rotas'] ?? []);
    currentRoutes.add("De: $start → Para: $end");

    kDatabase.collection(Collections.drivers).doc(guid).update(
      {"rotas": currentRoutes},
    );
  }
}
