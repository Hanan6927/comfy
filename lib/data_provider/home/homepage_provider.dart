import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../models/featured.dart';
import '../../models/newest.dart';
import '../../presentation/core/constants.dart';

class HomepageProvider {

  final http.Client httpClient;
  HomepageProvider({required this.httpClient});
  
  Future<List<Featured?>> getFeatured() async {
    final response = await httpClient.get(
        Uri.parse(
            "$url/featured/"),
            headers: {
          'Accept': 'Application/json',
        }
        );

    if (response.statusCode == 200) {
      print(response.body);
      final parsed = json.decode(response.body)['products'];
      List<Featured> featureds =
          List<Featured>.from(parsed.map((e) => Featured.fromJson(e)));
      // List<Featured?> featureds = [];
      // for (var featured in parsed) {
      //   Featured? feat = Featured.fromJson(featured);
      //   featureds.add(feat);
      // }
      print(featureds);
      return featureds;
    } else {
      throw SocketException("Response Code: ${response.statusCode}");
    }
  }

  Future<List<Newest>> getNewest() async {
    final response = await httpClient.get(
        Uri.parse(
            "$url/newest/"),
            headers: {
          'Accept': 'Application/json',
        }
        );

    if (response.statusCode == 200) {
      Iterable parsed = json.decode(response.body)['products'];
      List<Newest> newests =
          List<Newest>.from(parsed.map((e) => Newest.fromJson(e)));
      return newests;
    } else {
      throw SocketException("Response Code: ${response.statusCode}");
    }
  }
  
}