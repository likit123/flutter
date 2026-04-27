import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_app3/main_menu.dart';

class Firstscreen extends StatefulWidget {
  const Firstscreen({super.key});

  @override
  State<Firstscreen> createState() => _FirstscreenState();
}

class _FirstscreenState extends State<Firstscreen> {
  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    final hasInternet = await _checkInternetConnect();
    if (!hasInternet) return;
    _goNext();
  }

  Future<bool> _checkInternetConnect() async {
    final result = await Connectivity().checkConnectivity();

    // This condition is for demo purposes only to explain every connection type.
    // Use conditions which work for your requirements.
    if (result.contains(ConnectivityResult.mobile)) {
      // Mobile network available.
      _showToast("Mobile network available.");
    } else if (result.contains(ConnectivityResult.wifi)) {
      // Wi-fi is available.
      // Note for Android:
      // When both mobile and Wi-Fi are turned on system will return Wi-Fi only as active network type
      _showToast("Wi-fi is available.");
    } else if (result.contains(ConnectivityResult.ethernet)) {
      // Ethernet connection available.
      _showToast("Ethernet connection available.");
    } else if (result.contains(ConnectivityResult.vpn)) {
      // Vpn connection active.
      // Note for iOS and macOS:
      // There is no separate network interface type for [vpn].
      // It returns [other] on any device (also simulator)
      _showToast("Vpn connection active.");
    } else if (result.contains(ConnectivityResult.bluetooth)) {
      // Bluetooth connection available.
      _showToast("Bluetooth connection available.");
    } else if (result.contains(ConnectivityResult.satellite)) {
      // Carrier-provided satellite network available
      _showToast("Carrier-provided satellite network available");
    } else if (result.contains(ConnectivityResult.other)) {
      // Connected to a network which is not in the above mentioned networks.
      _showToast("Connected to a network which is not in the above");
    } else if (result.contains(ConnectivityResult.none)) {
      // No available network types
      if (!mounted) return false;

      _showAlertDialog(context, "Error", "No available network types");
      return false;
    }

    return true;
  }

  Future<void> _goNext() async {
    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const Main_Menu()),
      // MaterialPageRoute(builder: (_) => const SecondPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.lightBlueAccent, Colors.white],
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(0.6, 0.5),
          tileMode: TileMode.mirror,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('./android/assets/images/app.png', height: 150),
          const SizedBox(height: 10),
          SpinKitThreeBounce(
            color: const Color.fromARGB(255, 134, 187, 218),
            size: 50.0,
          ),
        ],
      ),
    );
  }

  void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: const Color.fromARGB(255, 15, 173, 52),
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  void _showAlertDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(241, 253, 201, 201),
              ),
              child: const Text('OK', style: TextStyle(color: Colors.black,)),
              onPressed: () {
                SystemNavigator.pop();
              },
            ),
          ],
        );
      },
    );
  }
}

// class SecondPage extends StatelessWidget {
//   const SecondPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Second Page')),
//       body: const Center(
//         child: Text(
//           'Second Page 2',
//           style: TextStyle(fontSize: 24, color: Colors.blue),
//         ),
//       ),
//     );
//   }
// }
