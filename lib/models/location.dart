import 'package:equatable/equatable.dart';

class Location extends Equatable {
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

  const Location({
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
  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
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

  // Method to convert Location to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'region_id': regionId,
      'name': name,
      'street': street,
      'email': email,
      'phone': phone,
      'latitude': latitude,
      'longitude': longitude,
      'opening_hour': openingHour,
      'closing_hour': closingHour,
    };
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
