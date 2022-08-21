import 'dart:convert';
import 'dart:io';

import 'package:comfy/data_provider/signin/signin_provider.dart';
import 'package:http/http.dart' as http;

import '../../models/featured.dart';
import '../../presentation/core/constants.dart';

class TypeProvider{

  final http.Client httpClient;
  TypeProvider({required this.httpClient});

  Future<List<Featured?>> getByType(int category, String type) async {
    final response = await httpClient.get(
        Uri.parse(
            "$url/$category/$type"),
            headers: {
          'Accept': 'Application/json',
          'Authorization': 'Bearer ${Token}'
        }
        );
    print(type);
    if (response.statusCode == 200) {
      print(response.body);
      final parsed = json.decode(response.body)['products'];
      List<Featured> all =
          List<Featured>.from(parsed.map((e) => Featured.fromJson(e)));
      return all;
    } else {
      throw SocketException("Response Code: ${response.statusCode}");
    }
  }
  
}