import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_final/screens/registration_toggle/registration_toggle_screen.dart';

import '../../../theme.dart';

class NewAccountButton extends StatelessWidget {
  const NewAccountButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            text: 'Não tem uma conta? ',
            style: AppTheme.labelText(fontSize: 19, weight: FontWeight.w300),
            children: [
              WidgetSpan(
                  child: GestureDetector(
                onTap: () {
                  Get.to(() => const RegistrationToggleScreen());
                },
                child: Text(
                  "Crie Uma",
                  style: AppTheme.displayText(fontSize: 17),
                ),
              ))
            ]));
  }
}
