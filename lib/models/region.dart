import 'package:equatable/equatable.dart';

class Region extends Equatable {
  final int id;
  final String name;

  const Region({required this.id, required this.name});

  // Factory method to create Region from JSON
  factory Region.fromJson(Map<String, dynamic> json) {
    return Region(
      id: json['id'],
      name: json['name'],
    );
  }


  @override
  List<Object?> get props => [id, name];
}