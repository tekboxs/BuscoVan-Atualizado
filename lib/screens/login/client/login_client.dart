import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projeto_final/constants.dart';
import 'package:projeto_final/keys.dart';
import 'package:projeto_final/screens/login/enums/login_enum.dart';
import 'package:projeto_final/storage.dart';

class LoginClient {
  static auth({String? email, String? password}) async {
    if (email == null || password == null) {
      return AuthStatus.blankInput;
    }

    var driversStore =
        await FirebaseFirestore.instance.collection(Collections.drivers).get();
    var studentsStore =
        await FirebaseFirestore.instance.collection(Collections.students).get();

    List<Map> driversData = driversStore.docs.map((e) => e.data()).toList();
    List<Map> studentsData = studentsStore.docs.map((e) => e.data()).toList();

    for (Map item in driversData) {
      if (item['email'] == email) {
        if (item['senha'] == password) {
          await Storage.write(StorageTypes.string, StorageKeys.userGuid,
              driversStore.docs[driversData.indexOf(item)].id);
          return AuthStatus.validDriver;
        }
      }
    }
    for (Map item in studentsData) {
      if (item['email'] == email) {
        if (item['senha'] == password) {
          return AuthStatus.validStudent;
        }
      }
    }
    return AuthStatus.invalid;
  }
}
