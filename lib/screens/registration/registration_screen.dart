import 'package:flutter/material.dart';
import 'components/body.dart';

class RegistrationScreen extends StatelessWidget {
  final bool isDriver;
  const RegistrationScreen({Key? key, required this.isDriver})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Conta'),
      ),
      body: Body(isDriver: isDriver),
    );
  }
}
