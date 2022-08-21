import 'dart:convert';
import 'dart:io';

import 'package:comfy/data_provider/signin/signin_provider.dart';
import 'package:http/http.dart' as http;

import '../../models/featured.dart';
import '../../models/newest.dart';
import '../../presentation/core/constants.dart';

class HomepageProvider {

  final http.Client httpClient;
  HomepageProvider({required this.httpClient});

  Future<List<Featured?>> getAll() async {
    final response = await httpClient.get(
        Uri.parse(
            "$url/comfy_products/"),
            headers: {
          'Accept': 'Application/json',
          'Authorization': 'Bearer ${Token}',
        }
        );

    if (response.statusCode == 200) {
      print(response.body);
      final parsed = json.decode(response.body);
      List<Featured> all =
          List<Featured>.from(parsed.map((e) => Featured.fromJson(e)));
      return all;
    } else {
      throw SocketException("Response Code: ${response.statusCode}");
    }
  }
  
  Future<List<Featured?>> getFeatured() async {
    final response = await httpClient.get(
        Uri.parse(
            "$url/comfy_products/"),
            headers: {
          'Accept': 'Application/json',
          'Authorization': 'Bearer ${Token}',
        }
        );

    if (response.statusCode == 200) {
      print(response.body);
      final parsed = json.decode(response.body);
      List<Featured> featureds =
          List<Featured>.from(parsed.map((e) => Featured.fromJson(e)));
      print(featureds);
      return featureds;
    } else {
      throw SocketException("Response Code: ${response.statusCode}");
    }
  }

  Future<List<Newest>> getNewest() async {
    final response = await httpClient.get(
        Uri.parse(
            "$url/comfy_products/"),
            headers: {
          'Accept': 'Application/json',
          'Authorization': 'Bearer ${Token}',
        }
        );

    if (response.statusCode == 200) {
      Iterable parsed = json.decode(response.body);
      List<Newest> newests =
          List<Newest>.from(parsed.map((e) => Newest.fromJson(e)));
      return newests;
    } else {
      throw SocketException("Response Code: ${response.statusCode}");
    }
  }
  
}