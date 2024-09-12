import 'package:flutter/material.dart';

class Privacypolicy extends StatelessWidget {
  const Privacypolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(
            left: 20.0, right: 20.0, top: 35.0, bottom: 30.0),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Privacy Policy',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                  'This Privacy Policy describes how information is collected, used, and shared by the QR and Barcode Generator and Scanner application ("QR Wave"). By using the App, you agree to the collection and use of information in accordance with this policy.'),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                '1. Information Collection and Use',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Text(
                'The App does not collect any personal information from users. However, it may require access to the devices camera to scan QR codes and barcodes. This access is solely for the purpose of functionality and is not used to collect any personal data.'),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                '2. Log Data',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Text(
                'The App may collect certain information automatically, including the type of mobile device you use, your devices unique device ID, the IP address of your mobile device, your mobile operating system, the type of mobile Internet browsers you use, and information about the way you use the App.'),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                '3. Cookies',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Text(
                'The App does not use cookies or any similar tracking technologies.'),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                '4. Security',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Text(
                'The security of your information is important to us, but please remember that no method of transmission over the Internet or method of electronic storage is 100% secure. While we strive to use commercially acceptable means to protect your information, we cannot guarantee its absolute security.'),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                '5. Changes to This Privacy Policy',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Text(
                'This Privacy Policy may be updated from time to time for any reason. We will notify you of any changes to our Privacy Policy by posting the new Privacy Policy here. You are advised to consult this Privacy Policy regularly for any changes.')
          ],
        ),
      ),
    );
  }
}
