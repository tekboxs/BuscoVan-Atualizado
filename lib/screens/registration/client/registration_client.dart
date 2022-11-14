import 'package:projeto_final/constants.dart';
import 'package:uuid/uuid.dart';

class RegistrationClient {
  static registerNewStudent(Map<String, dynamic> data) async {
    String guid = const Uuid().v1();

    kDatabase.collection(Collections.students).doc(guid).set(data);
  }

  static registerNewDriver(Map<String, dynamic> data) async {
    String guid = const Uuid().v1();

    kDatabase.collection(Collections.drivers).doc(guid).set(data);
  }
}
