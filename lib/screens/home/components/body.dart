import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_final/screens/home/components/search_builder.dart';
import 'package:projeto_final/screens/home/controllers/home_controller.dart';

TextEditingController searchController = TextEditingController(text: "esc");

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      _onSearchChanged();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _debounce?.cancel();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  Timer? _debounce;
  _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 600), () {
      var controller = Get.put(HomeController());
      controller.update();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30),
        child: Column(children: [
          TextField(
            controller: searchController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), label: Text("Pesquisar")),
          ),
          const SearchBuilder()
        ]));
  }
}
