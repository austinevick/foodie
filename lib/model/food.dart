class FoodModel {
  final imageUrl;
  final title;

  FoodModel({this.imageUrl, this.title});

  factory FoodModel.fromMap(Map<String, dynamic> map) {
    return FoodModel(imageUrl: map['imageURL'], title: map['title']);
  }
}
