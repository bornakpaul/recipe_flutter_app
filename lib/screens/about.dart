import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff186ea8),
        elevation: 0.0,
        title: Text(
          "About Us",
          style: TextStyle(fontFamily: 'Overpass'),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          //color: Colors.blue,
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'InstantEats is for all homecooks like you and me. It is available on multiple devices, including tablet and smartphone. You can find any recipes with just one search of a button. Type in any ingredients and you will get multiple recipes. In further updates you will also get options to save your favourite recipes for instant access. The app is owned and developed by Bornak Paul.',
                style: TextStyle(fontSize: 18, fontFamily: 'Overpass'),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'BornakPaul is a final year grad student from Jain University - SET,Bangalore, Karnataka. InstantEats App is a personal project, made to get lots of recipes. It\s powered by edamam and is made with Flutter.',
                style: TextStyle(fontSize: 18, fontFamily: 'Overpass'),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
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
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  '\u00a9 BornTech | 2021 | All right reserved | Made in India',
                  style: TextStyle(fontSize: 14, fontFamily: 'Overpass'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
