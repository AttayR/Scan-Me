import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScanner extends StatelessWidget {
  const QRScanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
              child: Container(
            alignment: Alignment.center,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  ' QR Scanner',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                )
              ],
            ),
          )),
          Expanded(
              flex: 6,
              child: Container(
                alignment: Alignment.center,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [QRscanner()],
                ),
              )),
          Expanded(
              child: Container(
            alignment: Alignment.center,
            child: const Column(
              children: [Text('Scan QR Code')],
            ),
          ))
        ],
      ),
    );
  }
}

class QRscanner extends StatefulWidget {
  const QRscanner({super.key});

  @override
  State<QRscanner> createState() => _QRscannerState();
}

class _QRscannerState extends State<QRscanner> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  String? qrText = "";
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: 300,
        child: Column(
          children: [
            Expanded(
                child: qrText!.isEmpty
                    ? QRView(
                        key: qrKey,
                        onQRViewCreated: _onQRViewCreated,
                        overlay: QrScannerOverlayShape(
                          borderColor: Colors.red,
                          borderRadius: 10,
                          borderLength: 30,
                          borderWidth: 10,
                        ),
                      )
                    : SizedBox(
                        height: 80,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Scanned QR Code: $qrText"),
                            ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    qrText = "";
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.amber),
                                child: const Text(
                                  'Again Scan ',
                                  style: TextStyle(color: Colors.black),
                                ))
                          ],
                        )))
          ],
        ));
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      // Do something with the scan result
      setState(() {
        qrText = scanData.code;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
