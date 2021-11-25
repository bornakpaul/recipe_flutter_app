import 'package:flutter/material.dart';
import 'package:recipe/screens/contact.dart';
import 'package:recipe/widgets/navitems.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var url_support = 'https://www.buymeacoffee.com/bornakpaul';
    return Container(
      width: 200,
      height: double.infinity,
      color: Colors.white,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                color: Colors.deepPurpleAccent,
              ),
              SizedBox(
                height: 40,
              ),
              NavItem(
                tapEvent: () {},
                title: 'About',
                color: Colors.deepPurpleAccent,
              ),
              SizedBox(
                height: 20,
              ),
              NavItem(
                tapEvent: () {
                  Navigator.pop(context);
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Contact()));
                },
                title: 'Contact',
                color: Colors.grey.shade800,
              ),
              SizedBox(
                height: 20,
              ),
              NavItem(
                tapEvent: () async {
                  if (await UrlLauncher.canLaunch(url_support)) {
                    Navigator.pop(context);
                    await UrlLauncher.launch(
                      url_support,
                      universalLinksOnly: true,
                    );
                  } else {
                    throw 'There was a problem to open the url: $url_support';
                  }
                },
                title: 'Contribute',
                color: Colors.grey.shade800,
              ),
              SizedBox(
                height: 20,
              ),
              NavItem(
                tapEvent: () {},
                title: 'Rate Us',
                color: Colors.grey.shade800,
              ),
            ],
          ),
        ),
      ),
    );
  }
}