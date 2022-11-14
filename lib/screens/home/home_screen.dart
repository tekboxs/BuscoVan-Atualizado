import 'package:flutter/material.dart';
import '../../theme.dart';
import '../../utils/logout.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        title: const Text('Inicio'),
      ),
      body: const Body(),
    );
  }
}
