import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:projeto_final/constants.dart';
import 'package:projeto_final/screens/driver_home/components/routes_section.dart';
import 'package:projeto_final/screens/driver_home/models/driver_model.dart';

import '../../../size_config.dart';
import 'infos_section.dart';

class DriverInfos extends StatelessWidget {
  final DriverModel infos;
  const DriverInfos({Key? key, required this.infos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight,
      child: Column(
        children: [
          SizedBox(
            width: 200,
            height: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(150),
              child: Image.memory(
                base64Decode(
                  infos.image ?? placeHolderBase64,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          InfosSection(infos: infos),
          RoutesSection(routes: infos.routes)
        ],
      ),
    );
  }
}
