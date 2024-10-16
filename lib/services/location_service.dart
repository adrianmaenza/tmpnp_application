import 'dart:convert';
import 'package:http/http.dart' as http;
import '../util/constants.dart';
import '/models/models.dart';

class LocationService {
  Future<List<Location>> fetchLocations() async {
    final response = await http.get(Uri.parse('$apiUrl/location'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Location.fromJson(json)).toList();
    } else {
      throw Exception(response.statusCode);
    }
  }
}
