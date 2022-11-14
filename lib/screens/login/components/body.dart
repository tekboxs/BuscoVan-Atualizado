import 'package:lottie/lottie.dart';
import 'package:projeto_final/screens/login/components/login_form.dart';
import 'package:flutter/material.dart';
import 'package:projeto_final/screens/login/components/new_account.dart';
import 'package:projeto_final/size_config.dart';
import 'package:projeto_final/theme.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> with TickerProviderStateMixin {
  late final AnimationController _controller;
  bool checked = false;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller.duration = const Duration(microseconds: 100);
  }

  toggle() {
    (!checked) ? _controller.forward() : _controller.reverse();
    checked = !checked;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: toggle(),
            child: SizedBox(
              width: double.infinity,
              height: getProportionateScreenHeight(240),
              child: Lottie.asset(
                'lottie/10582-van.json',
                controller: _controller,
                animate: true,
              ),
            ),
          ),
          Text(
            "Bem vindo de volta,",
            style:
                AppTheme.titleText(fontSize: getProportionateScreenWidth(20)),
          ),
          const LoginForm(),
          const NewAccountButton()
        ],
      ),
    );
  }
}
