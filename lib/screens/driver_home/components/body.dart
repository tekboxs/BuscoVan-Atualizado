import 'package:flutter/material.dart';
import 'package:projeto_final/screens/driver_home/client/driver_client.dart';
import 'package:projeto_final/screens/driver_home/components/driver_infos.dart';
import 'package:projeto_final/screens/driver_home/models/driver_model.dart';

import '../../../constants.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DriverClient.getInfos(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data == FutureErrors.errorResponse) {
            //ANCHOR SNAPSHOT ERROR
            //  return const BuildErrorMessage();
          }
          if (snapshot.data == FutureErrors.emptyResponse) {
            //  return const BuildEmpty(
            //    message: 'Parece Que Não Há Promoções',
            //  );
          }
          //ANCHOR SNAPSHOT SUCCESS
          DriverModel driver =
              DriverModel.fromMap(snapshot.data as Map<String, dynamic>);
          return DriverInfos(infos: driver);
        } else {
          //ANCHOR SNAPSHOT NO DATA
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
      },
    );
  }
}
