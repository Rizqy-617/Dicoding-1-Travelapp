class CategoryModel {
  final String image;
  final String name;

  CategoryModel({
    required this.image,
    required this.name
  });

  static CategoryModel init() {
    return CategoryModel(
      name: "",
      image: ""
    );
  }

  static CategoryModel fromMap(Map map) {
    try {
      return CategoryModel(
        name: map["name"],
        image: map["image"]
      );
    } catch(e) {
      return CategoryModel.init();
    }
  }

  Map toMap() {
    return {
      "name": name,
      "image": image
    };
  }

  @override
  String toString() {
    return '''CategoryModel(
      name: $name,
      image: $image
    )
    ''';
  }
}