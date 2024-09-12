import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Howitwork extends StatelessWidget {
  const Howitwork({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(
            left: 20.0, right: 20.0, top: 35.0, bottom: 20.0),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'How It Work',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                  'To generate a QR code, users input the desired information, such as text, URL, contact information, or Wi-Fi network details.The app then processes this information and converts it into a QR code image.Users can customize the generated QR code with options such as color, size, and error correction level.Once customized, users can save the QR code image to their device or share it directly via various platforms such as email, messaging apps, or social media.'),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                '2. Barcode Generation:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            Text(
                'For barcode generation, users enter the data they want to encode, such as product information or inventory details.The app supports various barcode formats, including UPC-A, UPC-E, EAN-8, EAN-13, Code 39, Code 93, Code 128, ITF, Codabar, and GS1 DataBar.Users can customize the barcode format and appearance according to their preferences.Similar to QR code generation, users can save the barcode image or share it through different channels.'),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                'QR and Barcode Scanning:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            Text(
                'To scan a QR code or barcode, users simply open the scanner function within the app.The app activates the devices camera, allowing users to aim it at the QR code or barcode they wish to scan.Once the code is within the cameras viewfinder, the app automatically detects and decodes it.After successful decoding, the app displays the relevant information associated with the scanned code, such as website URLs, text, contact information, or product details.Users have the option to take further actions based on the scanned information, such as visiting a website, adding contact details to their address book, or comparing product prices online.'),
          ],
        ),
      ),
    );
  }
}
