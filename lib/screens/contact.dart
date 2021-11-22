import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final String phone = '+917337743323';
    final String email = "bornakpaul@gmail.com";
    final String text =
        "Hi Bornak, I loved your work and i would like to support you!";
    var url_insta = 'https://www.instagram.com/born.tech/';
    var url_whatsapp = 'https://wa.me/${phone}?text=${text}';
    var url_call = 'tel://${phone}';
    var url_mail = 'mailto:$email}';

    return Scaffold(
        appBar: AppBar(
          title: Text('Contact Us'),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(20.0),
                  width: width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'The developer can be contacted at: ',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Address:',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Bornak Paul, \nBMB School Road \nNear Play Boy\'s Sports Club, \nLumding, Assam, INDIA 782447.',
                            style: TextStyle(
                                fontSize: 18, fontStyle: FontStyle.italic),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 20.0, right: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Direct Link: ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Buttons(
                            tapEvent: () async {
                              if (await UrlLauncher.canLaunch(url_call)) {
                                await UrlLauncher.launch(
                                  url_call,
                                  universalLinksOnly: true,
                                );
                              } else {
                                throw 'There was a problem to open the url: $url_call';
                              }
                            },
                            image: Image(
                              image: AssetImage("assets/images/phone.png"),
                              height: 40,
                            ),
                          ),
                          Buttons(
                            tapEvent: () async {
                              if (await UrlLauncher.canLaunch(url_mail)) {
                                await UrlLauncher.launch(
                                  url_mail,
                                  universalLinksOnly: true,
                                );
                              } else {
                                throw 'There was a problem to open the url: $url_mail';
                              }
                            },
                            image: Image(
                              image: AssetImage("assets/images/mail.png"),
                              height: 40,
                            ),
                          ),
                          Buttons(
                            tapEvent: () async {
                              if (await UrlLauncher.canLaunch(url_whatsapp)) {
                                await UrlLauncher.launch(
                                  url_whatsapp,
                                  universalLinksOnly: true,
                                );
                              } else {
                                throw 'There was a problem to open the url: $url_whatsapp';
                              }
                            },
                            image: Image(
                              image: AssetImage("assets/images/whatsapp.png"),
                              height: 40,
                            ),
                          ),
                          Buttons(
                            tapEvent: () async {
                              if (await UrlLauncher.canLaunch(url_insta)) {
                                await UrlLauncher.launch(
                                  url_insta,
                                  universalLinksOnly: true,
                                );
                              } else {
                                throw 'There was a problem to open the url: $url_insta';
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
                ),
                Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
                  width: width,
                  child: Row(
                    children: [
                      Expanded(
                          child: Divider(
                        color: Colors.grey.shade500,
                      )),
                      Expanded(
                          child: Divider(
                        color: Colors.grey.shade500,
                      )),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
                  child: Text(
                    '\u00a9 BornTech | 2021 | All right reserved | Made in India',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
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
        margin: EdgeInsets.only(right: 15.0, top: 10.0, bottom: 10.0),
        height: 45,
        width: 45,
        child: image,
      ),
    );
  }
}

//  UrlLauncher.launch("tel://${phone}");
//  UrlLauncher.launch('mailto:$email}');
// UrlLauncher.launch("https://wa.me/${phone}?text=${text}");





