import 'dart:io';

import 'package:flutter/material.dart';
import 'package:recipe/data/data.dart';
import 'package:recipe/screens/home.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  List<SliderModel> slides = []; // setting the slider constructor
  int currentIndex = 0;
  PageController pageController = new PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    slides = getSlides();
  }

  Widget pageIndexIndicator(bool isCurrentPage) {
    // setting the decoration for pageview circular indicator
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
          color: isCurrentPage ? Colors.grey : Colors.grey[300],
          borderRadius: BorderRadius.circular(12)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
          // building the pageview to return the slidertile in here
          controller: pageController,
          itemCount: slides.length,
          onPageChanged: (val) {
            setState(() {
              currentIndex = val;
            });
          },
          itemBuilder: (context, index) {
            return SliderTile(
              imageAssetPath: slides[index].getImageAssetPath(),
              title: slides[index].getTitle(),
              desc: slides[index].getDesc(),
            );
          }),
      bottomSheet: currentIndex != slides.length - 1
          ? Container(
              height: Platform.isIOS ? 70 : 60,
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                      // Can give it a click effect with GestureDetector
                      onTap: () {
                        // pageController.animateToPage(
                        //     slides.length -
                        //         1, // slides.length - 1 means if there are total n number of slides, we are calling the last end slide.
                        //     duration: Duration(microseconds: 400),
                        //     curve: Curves.linear);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home()));
                      },
                      child: Text(
                        "SKIP",
                        style: TextStyle(fontSize: 18),
                      )),
                  Row(
                    children: <Widget>[
                      //setting the circular pageindicator ui
                      for (int i = 0; i < slides.length; i++)
                        currentIndex == i
                            ? pageIndexIndicator(true)
                            : pageIndexIndicator(false),
                    ],
                  ),
                  GestureDetector(
                      onTap: () {
                        pageController.animateToPage(
                            currentIndex + 1, // next slide
                            duration: Duration(milliseconds: 400),
                            curve: Curves.linear);
                      },
                      child: Text(
                        "NEXT",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xff186ea8),
                        ),
                      )),
                ],
              ),
            )
          : GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: Platform.isIOS ? 70 : 60, //to use isIOS import dart.io
                color: Color(0xff186ea8),
                child: Text(
                  "GET STARTED NOW",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
    );
  }
}

// ignore: must_be_immutable
class SliderTile extends StatelessWidget {
  // setting the slider display here

  String? imageAssetPath, title, desc;
  SliderTile({this.imageAssetPath, this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            imageAssetPath!,
            height: 240,
            width: 450,
          ),
          SizedBox(
            height: 82,
          ),
          Text(
            title!,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w600,
              color: Color(0xff186ea8),
            ),
          ),
          SizedBox(
            height: 52,
          ),
          Text(
            desc!,
            style: TextStyle(
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
