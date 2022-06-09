import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Login with ChangeNotifier {
  static const _url =
      'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBsRnjYuuPWF4VV5ah_YKQvhAYcVzlko80';

  Future<void> signup(String email, String password) async {
    final response = await http.post(
      Uri.parse(_url),
      body: jsonEncode({
        'email': email,
        'password': password,
        //padrao do firebase que pergunta se vc quer ou não q gere um token
        'returnSecureToken': true,
      }),
    );

    print(jsonDecode(response.body));
  }
}
