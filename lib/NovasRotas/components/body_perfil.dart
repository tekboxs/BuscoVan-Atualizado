import 'package:flutter/material.dart';
import 'package:projeto_final/NovasRotas/motorista_model.dart';
import '/globals.dart' as globals;

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    RotasModel currentProfile = globals.routeProfile!;
    return Center(
      child: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Nome: ${currentProfile.nomeCompleto}"),
            Text("Rota A: ${currentProfile.rotaA}"),
            Text("Rota B: ${currentProfile.rotaB}"),
            Text("Telefone: ${currentProfile.telefone}"),
          ],
        ),
      ),
    );
  }
}
