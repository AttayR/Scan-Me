import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Contactus extends StatelessWidget {
  const Contactus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          alignment: Alignment.center,
          height: 140,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Get in Touch',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
              ),
              Text('For any Imformation to Contact Us ')
            ],
          ),
        ),
        Container(alignment: Alignment.center, child: const Buttonlist())
      ]),
    );
  }
}

class Buttonlist extends StatefulWidget {
  const Buttonlist({super.key});

  @override
  State<Buttonlist> createState() => _ButtonlistState();
}

class _ButtonlistState extends State<Buttonlist> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: () {
              _makePhoneCall('+923394080120'); // Replace with your phone number
            },
            style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.only(top: 20.0, bottom: 20.0, left: 30.0),
                backgroundColor: Colors.blue),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.phone,
                  color: Colors.white,
                ),
                Text(
                  '   Call Us',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _makeEmail('info@qrwave.com');
            },
            style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.only(top: 20.0, bottom: 20.0, left: 30.0),
                backgroundColor: Colors.deepPurple[200]),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.email,
                  color: Colors.white,
                ),
                Text(
                  '   info@qrwave.com',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _makewhatsapp('+923394080120');
            },
            style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.only(top: 20.0, bottom: 20.0, left: 30.0),
                backgroundColor: Colors.green),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  FontAwesomeIcons.whatsapp,
                  color: Colors.white,
                ),
                Text(
                  '   WhatsApp',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _makePhoneCall(String phoneno) async {
    final Uri url = Uri.parse('tel:$phoneno');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> _makeEmail(String email) async {
    final Uri url = Uri.parse('mailto:$email');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> _makewhatsapp(String whatsapp) async {
    final Uri url =
        Uri.parse('https://api.whatsapp.com/send?phone=$whatsapp&text= ');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
