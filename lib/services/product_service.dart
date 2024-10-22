import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tmpnp_application/models/product.dart';
import '../util/constants.dart';
import '/models/models.dart';

class ProductService {
  Future<List<Product>> fetchFeatured() async {
    final response =
        await http.get(Uri.parse('$apiUrl/products/search-product-on-sale'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future<List<Product>> fetchAisle(String path) async {
    final response = await http.get(Uri.parse(path));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final List<dynamic> data = jsonResponse['data'];
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future<Product> getProduct(int productId) async {
    final response = await http.get(Uri.parse('$apiUrl/product/$productId'));

    if (response.statusCode == 200) {
      // Decode the JSON and return the product
      final jsonBody = json.decode(response.body);
      return Product.fromJson(jsonBody);
    } else {
      throw Exception('Failed to load product: ${response.statusCode}');
    }
  }
}
