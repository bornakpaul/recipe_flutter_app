import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Recipe extends StatefulWidget {
  Recipe({
    Key? key,
    required this.postUrl,
  }) : super(key: key);

  final String postUrl;

  @override
  _RecipeState createState() => _RecipeState();
}

class _RecipeState extends State<Recipe> {
  String? finalUrl;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  void initState() {
    if (widget.postUrl.contains("http://")) {
      finalUrl = widget.postUrl.replaceAll("http://", "https://");
    } else {
      finalUrl = widget.postUrl;
    }
    super.initState();
  }

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
            "InstantEats",
            style: GoogleFonts.reenieBeanie(fontSize: 30),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          width: width,
          height: height,
          child: WebView(
            initialUrl: finalUrl,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              setState(() {
                _controller.complete(webViewController);
              });
            },
          ),
        ));
  }
}
