import 'package:flutter/material.dart';
import 'package:my_app3/components/menu4/menu4_view.dart';

class Menu4 extends StatelessWidget {
  const Menu4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppbar(context), body: Menu4View());
  }
}

AppBar buildAppbar(BuildContext context) {
  return AppBar(
    title: const Text(
      'Menu4',
      style: TextStyle(color: Colors.black, fontSize: 20),
      
    ),
    backgroundColor: const Color.fromARGB(255, 222, 241, 250),
    centerTitle: true,
  );
}
