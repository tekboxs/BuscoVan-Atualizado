import 'package:flutter/material.dart';

final TextEditingController nameController =
    TextEditingController(text: "Jorge");
final TextEditingController lastNameController =
    TextEditingController(text: "Silva");
final TextEditingController cpfController =
    TextEditingController(text: "123.123.123-22");
final TextEditingController emailController =
    TextEditingController(text: "Jorge@gmail.com");
final TextEditingController phoneController =
    TextEditingController(text: "(11) 111111111");
final TextEditingController passwordController =
    TextEditingController(text: "123");
final TextEditingController confirmPasswordController =
    TextEditingController(text: "123");

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key? key}) : super(key: key);

  @override
  State<RegistrationForm> createState() => RegistrationFormState();
}

class RegistrationFormState extends State<RegistrationForm> {
  List headers = [
    "nome",
    "ultimoNome",
    "cpf",
    "email",
    "numeroCelular",
    "senha",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextField(
            textInputAction: TextInputAction.next,
            controller: nameController,
            decoration: InputDecoration(
                border: const OutlineInputBorder(), hintText: headers[0]),
          ),
          TextField(
            textInputAction: TextInputAction.next,
            controller: lastNameController,
            decoration: InputDecoration(
                border: const OutlineInputBorder(), hintText: headers[1]),
          ),
          TextField(
            textInputAction: TextInputAction.next,
            controller: cpfController,
            decoration: InputDecoration(
                border: const OutlineInputBorder(), hintText: headers[2]),
          ),
          TextField(
            textInputAction: TextInputAction.next,
            controller: emailController,
            decoration: InputDecoration(
                border: const OutlineInputBorder(), hintText: headers[3]),
          ),
          TextField(
            textInputAction: TextInputAction.next,
            controller: phoneController,
            decoration: InputDecoration(
                border: const OutlineInputBorder(), hintText: headers[4]),
          ),
          TextField(
            textInputAction: TextInputAction.next,
            controller: passwordController,
            decoration: InputDecoration(
                border: const OutlineInputBorder(), hintText: headers[5]),
          ),
          TextField(
            textInputAction: TextInputAction.done,
            controller: confirmPasswordController,
            decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: "Confirmar ${headers[5]}"),
          ),
        ],
      ),
    );
  }
}
