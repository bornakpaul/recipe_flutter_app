class SliderModel {
  String? imagePath;
  String? title;
  String? desc;

  SliderModel({this.imagePath, this.title, this.desc});

  void setImageAssetPath(String getImagePath) {
    imagePath = getImagePath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  String getImageAssetPath() {
    return imagePath!;
  }

  String getTitle() {
    return title!;
  }

  String getDesc() {
    return desc!;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = [];
  SliderModel sliderModel = new SliderModel();

  //1
  sliderModel.setImageAssetPath("assets/images/healthy.png");
  sliderModel.setTitle("Healthy Food");
  sliderModel.setDesc("Get Healthy Food recipes all with one tap.");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setImageAssetPath("assets/images/chef.png");
  sliderModel.setTitle("Feel like a Chef");
  sliderModel.setDesc(
      "With instant recipes in your hand \nimpress everyone with your culinary skills.");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setImageAssetPath("assets/images/instant.png");
  sliderModel.setTitle("Fast & Perfect");
  sliderModel.setDesc("Get all your recipes instantly with our fast service.");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}
