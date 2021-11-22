import 'package:flutter/material.dart';
import 'package:recipe/widgets/Sidemenu.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 300),
        child: SideMenu(),
      ),
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
          Container(
            width: width,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Enter any ingredient to get the best recipe.',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: width,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: textEditingController,
                          decoration: InputDecoration(
                            hintText: 'Enter Ingredients',
                            hintStyle: TextStyle(fontSize: 18),
                          ),
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Container(
                        child: IconButton(
                          icon: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            if (textEditingController.text.isNotEmpty) {
                              print("function here");
                            } else {
                              print("nothing to do.");
                            }
                          },
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
