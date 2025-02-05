import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class HomeController {
  late String authKey;
  login() async {
    try {
      final response = await http.post(
        Uri.parse('https://dummyjson.com/auth/login'),
        body: {
          'username': 'emilys',
          'password': 'emilyspass',
        },
      );

      log(jsonDecode(response.body)['accessToken'].toString());
      authKey = jsonDecode(response.body)['accessToken'];
    } catch (e) {
      log(e.toString());
    }
  }

  hasUser() async {
    log("message1");

    final response = await http.get(
      Uri.parse('https://dummyjson.com/auth/me'),
      headers: {
        'Authorization': 'Bearer $authKey 1',
      },
    );
    log(response.statusCode.toString());
    log(response.body.toString());
  }
}
