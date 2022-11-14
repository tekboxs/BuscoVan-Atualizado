import 'package:flutter/material.dart';

class FinishButton extends StatelessWidget {
  const FinishButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          // RegistrationClient.registerNewStudent(data);
        },
        child: const Text("Criar Conta"));
  }
}
