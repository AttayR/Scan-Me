import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Createqr extends StatelessWidget {
  const Createqr({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.76,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.center,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'QR Generator',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    )
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: const SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [QRcreate()],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: const Column(
                  children: [Text('Scanner and Generator')],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class QRcreate extends StatefulWidget {
  const QRcreate({super.key});

  @override
  State<QRcreate> createState() => _QRcreateState();
}

class _QRcreateState extends State<QRcreate> {
  final GlobalKey gkey = GlobalKey();
  String qrdata = "";
  String data = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            qrdata.isNotEmpty
                ? Container(
                    height: 280,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RepaintBoundary(
                            key: gkey,
                            child: QrImageView(
                              backgroundColor: Colors.white,
                              data: qrdata,
                              version: QrVersions.auto,
                              size: 200.0,
                            )),
                        Container(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                  onPressed: _saveQRcode,
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black,
                                      padding: const EdgeInsets.only(
                                          left: 60.0, right: 60.0)),
                                  child: const Text(
                                    "save",
                                    style: TextStyle(color: Colors.white),
                                  )),
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      qrdata = "";
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.deepPurple[200],
                                      padding: const EdgeInsets.only(
                                          left: 50.0, right: 50.0)),
                                  child: const Text("Cancel",
                                      style: TextStyle(color: Colors.black)))
                            ],
                          ),
                        )
                      ],
                    ))
                : Container(
                    height: 320,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Image(
                          height: 150.0,
                          width: 150.0,
                          image: AssetImage('assets/QRWaveLogo.png'),
                        ),
                        TextField(
                          decoration: const InputDecoration(
                              hintText: "Enter data for QR Code",
                              prefixIcon: Icon(Icons.qr_code),
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.deepPurple)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.deepPurple))),
                          onChanged: (value) {
                            setState(() {
                              data = value;
                            });
                          },
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              qrdata = data;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple[200],
                          ),
                          child: const Text(
                            'Create QR',
                            style: TextStyle(color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  )
          ],
        ),
      ),
    );
  }

  _saveQRcode() async {
    try {
      RenderRepaintBoundary boundary =
          gkey.currentContext!.findRenderObject() as RenderRepaintBoundary;

      ui.Image image = await boundary.toImage();
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      // Save the image to gallery
      await ImageGallerySaver.saveImage(pngBytes);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("QR Code saved to gallery"),
          ),
        );
      }
    } catch (e) {
      print(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Error"),
        ),
      );
    }
  }
}
