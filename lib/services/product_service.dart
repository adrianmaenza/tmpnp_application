import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tmpnp_application/models/product.dart';
import '../util/constants.dart';
import '/models/models.dart';

class ProductService {
  Future<List<Product>> fetchFeatured() async {
    final response = await http.get(Uri.parse('$apiUrl/products/search-product-on-sale'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception(response.statusCode);
    }
  }
}
