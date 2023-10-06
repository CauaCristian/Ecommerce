import 'dart:math';

class Product {
  String name;
  String description;
  String image;
  double value;
  double id = Random().nextDouble() * 1000;
  Product({
    required this.name,
    required this.description,
    required this.image,
    required this.value,
  });
}
