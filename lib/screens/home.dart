import 'package:flutter/material.dart';
import 'package:recipe/widgets/Sidemenu.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 300),
        child: SideMenu(),
      ),
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Recipe',
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
