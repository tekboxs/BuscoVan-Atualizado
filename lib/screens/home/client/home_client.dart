import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projeto_final/constants.dart';
import 'package:projeto_final/screens/home/models/search_model.dart';

class HomeClient {
  static getByFilter(String filter) async {
    final result =
        await FirebaseFirestore.instance.collection(Collections.drivers).get();

    List data = result.docs.map((e) => e.data()).toList();

    List<SearchModel> resultList = [];
    for (Map<String, dynamic> item in data) {
      for (String route in (item['rotas'] ?? [])) {
        if (route.contains(filter)) {
          item['selectedRoute'] = route;
          resultList.add(SearchModel.fromMap(item));
          break;
        }
      }
    }
    return resultList;
  }
}
