import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String phone = '+917337743323';
    final String email = "bornakpaul@gmail.com";
    final String text =
        "Hi Bornak, I loved your work and i would like to support you!";

    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            child: Text(
              'Call Me',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              UrlLauncher.launch("tel://${phone}");
            },
          ),
          GestureDetector(
            child: Text(
              'Mail Me',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              UrlLauncher.launch('mailto:$email}');
            },
          ),
          GestureDetector(
              child: Text(
                'Whatsapp Me',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                UrlLauncher.launch("https://wa.me/${phone}?text=${text}");
              }),
        ],
      ),
    );
  }
}
