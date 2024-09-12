import 'dart:async';

import 'package:flutter/material.dart';
import 'package:scan_me/main.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Body()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.deepPurple[200],
        child: const Image(
          height: 150.0,
          width: 150.0,
          image: AssetImage('assets/QRWaveLogo.png'),
        ),
        //  Text(
        //   "QR Wave",
        //   style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
        // ),
      ),
    );
  }
}
