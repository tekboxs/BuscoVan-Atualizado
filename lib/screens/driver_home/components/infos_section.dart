import 'package:flutter/material.dart';

import '../../../size_config.dart';
import '../../../theme.dart';
import '../models/driver_model.dart';

class InfosSection extends StatelessWidget {
  const InfosSection({
    Key? key,
    required this.infos,
  }) : super(key: key);

  final DriverModel infos;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), border: Border.all()),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      height: getProportionateScreenHeight(230),
      child: GridView.count(
        childAspectRatio: 4.3,
        crossAxisCount: 1,
        children: [
          InfoCard(infos: infos.nome),
          InfoCard(infos: infos.cpf),
          InfoCard(infos: infos.numeroCelular),
          InfoCard(infos: infos.email),
        ],
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
    required this.infos,
  }) : super(key: key);

  final String infos;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: Text(
          infos,
          style: AppTheme.displayText(fontSize: 18),
        ),
      ),
    );
  }
}
