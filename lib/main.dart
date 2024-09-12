import 'package:flutter/material.dart';
import 'package:scan_me/Barcode_create.dart';
import 'package:scan_me/Contact_Us.dart';
import 'package:scan_me/Create_Qr.dart';
import 'package:scan_me/How_it_work.dart';
import 'package:scan_me/Qr_sannner.dart';
import 'package:scan_me/privacy%20policy.dart';
import 'package:scan_me/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Splashscreen(),
      routes: {
        '/ORcreate': (context) => const Createqr(),
        '/Barcodecreate': (context) => const Barcodecreate(),
        '/QRscanner': (context) => const QRScanner(),
        '/Contactus': (context) => const Contactus(),
      },
    );
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int selectedindex = 0;

  static const List _bodyoption = [
    Createqr(),
    Barcodecreate(),
    QRScanner(),
  ];

  static const List<Widget> _drawerScreens = [
    Createqr(),
    Barcodecreate(),
    QRScanner(),
    // Add three more screens accessible from the drawer
    Howitwork(),
    Privacypolicy(),
    Contactus(),
  ];

  static const List<String> _drawerScreenNames = [
    'QR Create',
    'Barcode Create',
    'QR & Barcode Scanner',
    'How It Work',
    'Privacy Policy',
    'Contact Us',
  ];
  onTap(int index) {
    setState(() {
      selectedindex = index;
    });
  }

  void onDrawerTap(int index) {
    setState(() {
      selectedindex = index + _bodyoption.length;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepPurple[200],
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                height: 30.0,
                width: 30.0,
                image: AssetImage('assets/QRWaveLogo.png'),
              ),
              Text(
                ' Scan me',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          )),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 70, left: 20, bottom: 10),
              color: Colors.deepPurple[200],
              child: const Row(
                children: [
                  Image(
                    height: 50.0,
                    width: 50.0,
                    image: AssetImage('assets/QRWaveLogo.png'),
                  ),
                  Text(
                    '  QR Wave',
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 25.0),
                  )
                ],
              ),
            ),
            for (int i = 0; i < _drawerScreens.length; i++)
              ListTile(
                title: Text(_drawerScreenNames[i]),
                selected: selectedindex == i + _bodyoption.length,
                onTap: () {
                  onDrawerTap(i);
                },
              ),
          ],
        ),
      ),
      body: Container(
        child: selectedindex < _bodyoption.length
            ? _bodyoption[selectedindex]
            : _drawerScreens[selectedindex - _bodyoption.length],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code),
            label: 'QR Create',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.barcode_reader),
            label: 'Barcode Create',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner),
            label: 'Scanner',
          ),
        ],
        currentIndex: selectedindex < _bodyoption.length ? selectedindex : 0,
        onTap: onTap,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.deepPurple[200],
        backgroundColor: Colors.black,
      ),
    );
  }
}
