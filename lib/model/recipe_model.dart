class RecipeModel {
  String? label;
  String? image;
  String? source;
  String? url;

  RecipeModel({
    this.image,
    this.source,
    this.label,
    this.url,
  });

  factory RecipeModel.fromMap(Map<String, dynamic> parsedJson) {
    return RecipeModel(
      image: parsedJson["image"],
      source: parsedJson["source"],
      label: parsedJson["label"],
      url: parsedJson["url"],
    );
  }
}
