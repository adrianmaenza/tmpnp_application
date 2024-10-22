import 'package:equatable/equatable.dart';

class User extends Equatable {

  final int id;

  const User({required this.id});

  // Factory method to create Product from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      // name: json['name'],
      // description: json['description'],
      // price: json['price'],
      // image: json['image'],
    );
  }

  @override
  List<Object?> get props => [id];

}