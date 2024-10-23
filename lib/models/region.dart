import 'package:equatable/equatable.dart';
import 'package:tmpnp_application/models/location.dart';

class Region extends Equatable {
  final int id;
  final String name;
  final List<Location> stores;

  const Region({required this.id, required this.name, required this.stores});

  // Factory method to create Region from JSON
  factory Region.fromJson(Map<String, dynamic> json) {
    return Region(
      id: json['id'],
      name: json['name'],
      stores: (json['locations'] as List)
          .map((store) => Location.fromJson(store))
          .toList()
    );
  }


  @override
  List<Object?> get props => [id, name];
}