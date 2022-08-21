import 'dart:convert';
import 'dart:io';

import 'package:comfy/models/userLogin.dart';
import 'package:http/http.dart' as http;

import '../../presentation/core/constants.dart';
String? Token;
class SigninPageProvider {
  final http.Client httpClient;
  SigninPageProvider({required this.httpClient});

  Future<String?> login(UserLogin user) async {
    final response = await httpClient.post(Uri.parse("$url/users/login/"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'Application/json',
        },
        body: jsonEncode(<String, dynamic>{
          'email': user.Email,
          'password': user.Password,
        }));
 print(response.statusCode);
    final parsed = json.decode(response.body);
    print(parsed);

    Token = parsed['token']['access'];
   
    if (response.statusCode == 200) {
      return 'cool';
    } else {
      return null;
    }
  }
}
