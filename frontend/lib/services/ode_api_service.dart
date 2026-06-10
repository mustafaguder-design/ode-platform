import 'dart:convert';

import 'package:http/http.dart' as http;

class OdeApiService {
  static const String baseUrl =
      'https://ode-platform-30v6.onrender.com';

  Future<Map<String, dynamic>> solve({
    required String equation,
    required double x0,
    required double y0,
    required double h,
    required double xEnd,
    required String method,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/solve'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'equation': equation,
        'parameters': {},
        'x0': x0,
        'y0': y0,
        'h': h,
        'x_end': xEnd,
        'method': method.toLowerCase(),
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }

    throw Exception(
      'API Error: ${response.statusCode}',
    );
  }
}