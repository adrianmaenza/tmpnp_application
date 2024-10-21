import 'dart:convert';
import 'package:http/http.dart' as http;
import '../util/constants.dart';
import '/models/models.dart';

class RegionService {
  Future<List<Region>> fetchRegions() async {
    final response = await http.get(Uri.parse('$apiUrl/location-groups'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Region.fromJson(json)).toList();
    } else {
      throw Exception('$apiUrl/location-groups');
    }
  }
}
