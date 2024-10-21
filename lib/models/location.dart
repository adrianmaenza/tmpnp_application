import 'package:equatable/equatable.dart';

class Store extends Equatable {
  final int id;
  final int regionId;
  final String name;
  final String street;
  final String email;
  final String phone;
  final double? latitude;
  final double? longitude;
  final String openingHour;
  final String closingHour;

  const Store({
      required this.id,
      required this.regionId,
      required this.name,
      required this.street,
      required this.email,
      required this.phone,
      this.latitude,
      this.longitude,
      required this.openingHour,
      required this.closingHour
  });

  // Factory method to create Region from JSON
  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      id: json['id'],
      name: json['name'],
      regionId: json['region_id'],
      street: json['street'],
      email: json['email'],
      phone: json['phone'],
      // latitude: json['latitude'],
      // longitude: json['longitude'],
      openingHour: json['opening_hour'],
      closingHour: json['closing_hour']
    );
  }

  @override
  List<Object?> get props => [
    id,
    regionId,
    name,
    street,
    email,
    phone,
    latitude,
    longitude,
    openingHour,
    closingHour
  ];
}
