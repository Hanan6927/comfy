import 'dart:convert';
import 'dart:io';

import 'package:comfy/data_provider/signin/signin_provider.dart';
import 'package:comfy/models/images.dart';
import 'package:comfy/models/item_type.dart';
import 'package:http/http.dart' as http;

import '../../models/featured.dart';
import '../../presentation/core/constants.dart';

class DetailPageProvider {
  final http.Client httpClient;
  DetailPageProvider({required this.httpClient});

   Future<List> getDetail(int id) async {
    final response = await httpClient.get(
        Uri.parse(
            "$url/product_detail/$id"),
            headers: {
          'Accept': 'Application/json',
          'Authorization': 'Bearer ${Token}'
        }
        );

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body)['product'];
      final images_parsed = json.decode(response.body)["Images"];
      final item_parsed = json.decode(response.body)["item"];
      print(images_parsed);
      Featured product =
          Featured.fromJson(parsed);
      List<Images> images = List<Images>.from(images_parsed.map((e) => Images.fromJson(e)));

      List<ItemType> item = List<ItemType>.from(item_parsed.map((e) => ItemType.fromJson(e)));
      return [product, images, item];
    } else {
      throw SocketException("Response Code: ${response.statusCode}");
    }
  }
}