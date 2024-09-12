import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class Barcodecreate extends StatelessWidget {
  const Barcodecreate({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.76,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.only(bottom: 10.0),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Barcode Generator',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    )
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Barcodedata()],
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

class Barcodedata extends StatefulWidget {
  const Barcodedata({super.key});

  @override
  State<Barcodedata> createState() => _BarcodedataState();
}

class _BarcodedataState extends State<Barcodedata> {
  final GlobalKey brkey = GlobalKey();
  String brText = "";
  String data = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          brText.isNotEmpty
              ? Container(
                  height: 150,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RepaintBoundary(
                        key: brkey,
                        child: BarcodeWidget(
                          backgroundColor: Colors.white,
                          barcode: Barcode.code128(),
                          data: brText,
                          width: 300, // Width of the barcode (adjust as needed)
                          height: 80,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                                onPressed: _savebarcodecode,
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
                                    brText = "";
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
                            hintText: "Enter BarCode Data",
                            prefixIcon: Icon(Icons.barcode_reader),
                            border: OutlineInputBorder(),
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
                              brText = data;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple[200],
                          ),
                          child: const Text(
                            'Create Barcode',
                            style: TextStyle(color: Colors.black),
                          ))
                    ],
                  ))
        ],
      ),
    );
  }

  _savebarcodecode() async {
    try {
      RenderRepaintBoundary boundary =
          brkey.currentContext!.findRenderObject() as RenderRepaintBoundary;

      ui.Image image = await boundary.toImage();
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      // Save the image to gallery
      await ImageGallerySaver.saveImage(pngBytes);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Bar Code saved to gallery"),
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
