import 'package:flutter/material.dart';
import 'package:my_app3/components/menu2/menu2_view.dart';

class Menu2 extends StatelessWidget {
  const Menu2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppbar(context), body: Menu2View());
  }
}

AppBar buildAppbar(BuildContext context) {
  return AppBar(
    title: const Text(
      'Menu2',
      style: TextStyle(color: Colors.black, fontSize: 20),
      
    ),
    backgroundColor: const Color.fromARGB(255, 222, 241, 250),
    centerTitle: true,
  );
}
