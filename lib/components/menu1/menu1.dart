import 'package:flutter/material.dart';
import 'package:my_app3/components/menu1/menu1_view.dart';

class Menu1 extends StatefulWidget {
  const Menu1({super.key});

  @override
  State<Menu1> createState() => _Menu1State();
}

class _Menu1State extends State<Menu1> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: buildAppbar(context),
      body: Menu1View(),
      drawer: Drawer(
        elevation: 30,
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text('Name'),
              accountEmail: const Text('Email'),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 7, 103, 148),),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
            ))),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {},
              ),
            ListTile(
              leading: const Icon(Icons.security_outlined),
              title: const Text('Security'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.access_alarm_sharp),
              title: const Text('Alarm'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.star),
              title: const Text('Star'),
              onTap: () {},
            ),

          ],
        ) 
      ),
    );
  }

  AppBar buildAppbar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.density_medium_sharp),
        onPressed: () => _scaffoldKey.currentState?.openDrawer(),
      ),
      title: const Text(
        'Menu1',
        style: TextStyle(color: Colors.black, fontSize: 20),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      backgroundColor: const Color.fromARGB(255, 222, 241, 250),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () {},
        ),
      ],
    );
  }
}