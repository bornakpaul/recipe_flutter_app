import 'package:flutter/material.dart';
import 'package:launch_review/launch_review.dart';
import 'package:recipe/screens/about.dart';
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
                color: const Color(0xff0b6099),
                child: ClipRRect(
                  child: Image.asset(
                    "assets/images/InstantEats.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              NavItem(
                tapEvent: () {
                  Navigator.pop(context);
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => About()));
                },
                title: 'About',
                color: const Color(0xff0b6099),
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
                tapEvent: () {
                  LaunchReview.launch(); //! will launch playstore
                },
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
