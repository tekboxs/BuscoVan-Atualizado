import 'package:flutter/material.dart';
import 'components/body.dart';

class NewRouteScreen extends StatelessWidget {
  const NewRouteScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova Rota'),
      ),
      body: const Body(),
    );
  }
}
