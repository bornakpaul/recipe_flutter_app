import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:recipe/model/recipe_model.dart';
import 'package:recipe/screens/recipe_view.dart';
import 'package:recipe/widgets/Sidemenu.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String initalRecipe = 'healthy';
  List<RecipeModel> recipes = [];
  TextEditingController textEditingController = TextEditingController();
  String applicationId = "c60cdab6";
  String applicationKey = "b8c4b5ecb9f5674048d03fdfb1d20dad";
  bool loading = true;

  getRecipes(String query) async {
    String url =
        "https://api.edamam.com/search?q=${query}&app_id=${applicationId}&app_key=${applicationKey}";

    var response = await http.get(Uri.parse(url));
    Map<String, dynamic> jsonData = jsonDecode(response.body);

    jsonData["hits"].forEach((element) {
      // print(element.toString());

      RecipeModel recipeModel = new RecipeModel();
      recipeModel = RecipeModel.fromMap(element["recipe"]);
      recipes.add(recipeModel);
      setState(() {});
      loading = false;
      // print(recipeModel.url);
    });

    print("${recipes.toString()}");
  }

  @override
  void initState() {
    loading = true;
    getRecipes(initalRecipe);
    super.initState();
  }

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
                            hintStyle:
                                TextStyle(fontSize: 18, color: Colors.white54),
                          ),
                          style: TextStyle(fontSize: 18, color: Colors.white),
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
                            loading = true;
                            recipes.clear();
                            setState(() {
                              getRecipes(textEditingController.text);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: loading
                      ? Center(
                          child: Container(
                            height: 30,
                            width: 30,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        )
                      : Container(
                          child: GridView(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: ClampingScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              mainAxisSpacing: 10.0,
                            ),
                            children: List.generate(recipes.length, (index) {
                              return GridTile(
                                child: RecipeTile(
                                  title: recipes[index].label!,
                                  url: recipes[index].url!,
                                  imgUrl: recipes[index].image!,
                                  desc: recipes[index].source!,
                                ),
                              );
                            }),
                          ),
                        ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class RecipeTile extends StatefulWidget {
  String url;
  String desc;
  String title;
  String imgUrl;
  RecipeTile({
    Key? key,
    required this.url,
    required this.desc,
    required this.title,
    required this.imgUrl,
  }) : super(key: key);

  @override
  _RecipeTileState createState() => _RecipeTileState();
}

class _RecipeTileState extends State<RecipeTile> {
  _launchUrl(String url) async {
    print(url);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch ${url}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Recipe(
                        postUrl: widget.url,
                      )));
        },
        child: Container(
          margin: EdgeInsets.all(8),
          child: Stack(
            children: [
              Image.network(
                widget.imgUrl,
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
              Container(
                width: 200,
                alignment: Alignment.bottomLeft,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [Colors.white30, Colors.white],
                  begin: FractionalOffset.centerRight,
                  end: FractionalOffset.centerLeft,
                )),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        widget.desc,
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ]);
  }
}
