import 'package:flutter/material.dart';
import 'components/body.dart';

class SplashScreen extends StatelessWidget {
  final bool isLoggin;
  const SplashScreen({Key? key, this.isLoggin = false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        isLogin: isLoggin,
      ),
    );
  }
}
