class PizzaModel {
  int? id;
  String? name;
  String? description;
  List<String>? ingredients;
  bool? spicy;
  bool? vegetarian;
  num? price;
  String? image;

  PizzaModel(
      {this.id,
      this.name,
      this.description,
      this.ingredients,
      this.spicy,
      this.vegetarian,
      this.price,
      this.image});

  PizzaModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    description = json['description'];
    ingredients = json['ingredients'].cast<String>();
    spicy = json['spicy'];
    vegetarian = json['vegetarian'];
    price = json['price'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['ingredients'] = ingredients;
    data['spicy'] = spicy;
    data['vegetarian'] = vegetarian;
    data['price'] = price;
    data['image'] = image;
    return data;
  }
}
