import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';
import '../util/constants.dart';
import '/models/models.dart';

class AuthService {
  Future<AuthResponse> authenticateUser(AuthRequest request) async {
    final response = await http.post(Uri.parse('$apiUrl/login'), body: {
      'email': request.username,
      'password': request.password
    });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return AuthResponse.fromJson(data);
    } else {
      throw Exception(response.statusCode);
    }
  }
}

class AuthRequest {
  final String username;
  final String password;

  AuthRequest(this.username, this.password);
}

class AuthResponse {
  final String message;
  final String? token;
  final User? user;

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(json['message'], json['token'], User.fromJson(json['user']));
  }

  AuthResponse(this.message, this.token, this.user);

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'token': token,
      'user': user?.toJson()
    };
  }
}