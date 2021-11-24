import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff764ff6),
        elevation: 0.0,
        title: Text(
          'Recipe Spinner',
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xff764ff6),
                  const Color(0xff5635c4),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
