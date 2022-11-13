import 'package:flutter/material.dart';
import 'package:projeto_final/NovasRotas/components/body_perfil.dart';

class MotoristaPerfil extends StatelessWidget {
  const MotoristaPerfil({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Perfil Motorista"),
      ),
      body: const Body(),
    );
  }
}
