import 'package:flutter/material.dart';
import 'package:my_app3/components/menu3/menu3_view.dart';

class Menu3 extends StatelessWidget {
  const Menu3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppbar(context), body: Menu3View());
  }
}

AppBar buildAppbar(BuildContext context) {
  return AppBar(
    title: const Text(
      'Menu3',
      style: TextStyle(color: Colors.black, fontSize: 20),
      
    ),
    backgroundColor: const Color.fromARGB(255, 222, 241, 250),
    centerTitle: true,
  );
}
