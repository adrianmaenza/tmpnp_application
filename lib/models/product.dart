import 'package:equatable/equatable.dart';

class Product extends Equatable{
  final int id;
  final String name;
  final String? image;
  final String? description;
  final String? price;

  const Product({
    required this.id,
    required this.name,
    this.description,
    this.price,
    this.image
  });

  // Factory method to create Product from JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      image: json['image'],
    );
  }

  @override
  List<Object?> get props => [id, name, description, price];
}