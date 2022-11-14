import 'package:flutter/material.dart';
import 'components/body.dart';

class RegistrationToggleScreen extends StatelessWidget {
  const RegistrationToggleScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tipo de cadastro'),
      ),
      body: const Body(),
    );
  }
}
