import 'dart:convert';
import 'dart:io';

import 'package:comfy/data_provider/signin/signin_provider.dart';
import 'package:http/http.dart' as http;

import '../../models/featured.dart';
import '../../presentation/core/constants.dart';

class CategoryProvider {
  final http.Client httpClient;
  CategoryProvider({required this.httpClient});

  Future<List<Featured?>> getAllByCategory(int id) async {
    final response = await httpClient
        .get(Uri.parse("$url/product_by_category/$id"), headers: {
      'Accept': 'Application/json',
      'Authorization': 'Bearer ${Token}'
    });

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body)['products'];
      print(parsed);
      List<Featured?> products =
          List<Featured?>.from(parsed.map((e) => Featured.fromJson(e)));
      return products;
    } else {
      throw SocketException("Response Code: ${response.statusCode}");
    }
  }

  Future<List<Featured?>?> getAllByCategoryAndItem(
      int? category, String? item) async {
    final response =
        await httpClient.get(Uri.parse("$url/$category/$item"), headers: {
      'Accept': 'Application/json',
      'Authorization': 'Bearer ${Token}'
    });

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body)['products'];
      print(parsed);
      List<Featured?> products =
          List<Featured?>.from(parsed.map((e) => Featured.fromJson(e)));
      return products;
    } else if (response.statusCode == 204) {
      return null;
    } else {
      throw SocketException("Response Code: ${response.statusCode}");
    }
  }

  Future<bool?> isFavourite(int user_id, int product_id) async {
    final response = await httpClient.post(
      Uri.parse("$url/favorite/$user_id"),
      headers: {
        'Accept': 'Application/json',
      },
      body: jsonEncode(<String, int>{
        'prod_id': product_id,
      }),
    );

    if (response.statusCode == 200){
      bool favorite = json.decode(response.body)['products']['status'];
      print(favorite);
      return favorite;
    }
    else {
      throw SocketException("Response Code: ${response.statusCode}");
    }
  }
}
