import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';
import '../util/constants.dart';
import '/models/models.dart';

class AuthService {
  Future<User> authenticateUser() async {
    final response = await http.get(Uri.parse('$apiUrl/login'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return User.fromJson(data);
    } else {
      throw Exception(response.statusCode);
    }
  }
}
