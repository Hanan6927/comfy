import 'dart:convert';
import 'dart:io';

import 'package:comfy/data_provider/signin/signin_provider.dart';
import 'package:comfy/models/user.dart';
import 'package:comfy/models/userLogin.dart';
import 'package:http/http.dart' as http;

import '../../presentation/core/constants.dart';

class SignUpPageProvider {
  final http.Client httpClient;
  SignUpPageProvider({required this.httpClient});

  Future<String?> register(User user) async {
    final response = await httpClient.post(Uri.parse("$url/users/"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'Application/json',
        },
        body: jsonEncode(<String, dynamic>{
          'email': user.Email,
          'password': user.Password,
          'phone_number': user.Phonenumber,
          'username': user.UserName
        }));

    final parsed = json.decode(response.body);
    Token = parsed['token']['access'];
    print(parsed);

    print(response.statusCode);
    if (response.statusCode == 200) {
      return 'cool';
    } else {
      return null;
    }
  }
}
