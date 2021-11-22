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
    var url = 'https://www.instagram.com/born.tech/';

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
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(20.0),
                  width: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'The owner and developer can be contacted at: ',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Bornak Paul, \nH56, BMB School Road \nNear Play Boy\'s Sports Club, \nLumding, Assam 782447.',
                        style: TextStyle(
                            fontSize: 18, fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Buttons(
                            tapEvent: () {
                              UrlLauncher.launch("tel://${phone}");
                            },
                            image: Image(
                              image: AssetImage("assets/images/phone.png"),
                              height: 40,
                            ),
                          ),
                          Buttons(
                            tapEvent: () {
                              UrlLauncher.launch('mailto:$email}');
                            },
                            image: Image(
                              image: AssetImage("assets/images/mail.png"),
                              height: 40,
                            ),
                          ),
                          Buttons(
                            tapEvent: () {
                              UrlLauncher.launch(
                                  "https://wa.me/${phone}?text=${text}");
                            },
                            image: Image(
                              image: AssetImage("assets/images/whatsapp.png"),
                              height: 40,
                            ),
                          ),
                          Buttons(
                            tapEvent: () async {
                              if (await UrlLauncher.canLaunch(url)) {
                                await UrlLauncher.launch(
                                  url,
                                  universalLinksOnly: true,
                                );
                              } else {
                                throw 'There was a problem to open the url: $url';
                              }
                            },
                            image: Image(
                              image: AssetImage("assets/images/instagram.png"),
                              height: 40,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class Buttons extends StatelessWidget {
  const Buttons({
    required this.tapEvent,
    required this.image,
    Key? key,
  }) : super(key: key);

  final Image image;
  final GestureTapCallback tapEvent;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapEvent,
      child: Container(
        height: 50,
        width: 50,
        child: Center(child: image),
      ),
    );
  }
}

//  UrlLauncher.launch("tel://${phone}");
//  UrlLauncher.launch('mailto:$email}');
// UrlLauncher.launch("https://wa.me/${phone}?text=${text}");





