class ProductModel {
  final String image1;
  final String image2;
  final String name;
  final String description;
  final String price;
  final String rating;

  ProductModel({
    required this.image1,
    required this.image2,
    required this.name,
    required this.description,
    required this.price,
    required this.rating
  });

  static ProductModel init() {
    return ProductModel(
      image1: "",
      image2: "",
      name: "",
      description: "",
      price: "",
      rating: ""
    );
  }

  static ProductModel fromMap(Map map) {
    try {
      return ProductModel(
        image1: map["image1"],
        image2: map["image2"],
        name: map["name"],
        description: map["description"],
        price: map["price"],
        rating: map["rating"]
      );
    } catch(e) {
      return ProductModel.init();
    }
  }

  Map toMap() {
    return {
      "image1": image1,
      "image2": image2,
      "name": name,
      "description": description,
      "price": price,
      "rating": rating
    };
  }
}