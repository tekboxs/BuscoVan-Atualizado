import 'package:flutter/material.dart';
import 'package:projeto_final/theme.dart';
import '../../utils/logout.dart';
import 'components/body.dart';

class DirverHomeScreen extends StatelessWidget {
  const DirverHomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: TextButton.icon(
                onPressed: () async {
                  await logoutFunction();
                },
                icon: const Icon(
                  Icons.exit_to_app,
                  color: Colors.red,
                ),
                label: Text(
                  "Sair da Conta",
                  style: AppTheme.labelText(),
                )),
          )
        ],
      ),
      body: const Body(),
    );
  }
}
