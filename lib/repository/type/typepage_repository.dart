import 'package:comfy/data_provider/home/homepage_provider.dart';
import 'package:comfy/models/featured.dart';
import 'package:comfy/models/newest.dart';

import '../../data_provider/type/type_provider.dart';

class TypepageRepository {
  final TypeProvider  typepageProvider;

  TypepageRepository({required this.typepageProvider});

  Future<List<Featured?>> getBytType(int category, String type) async {
    return typepageProvider.getByType(category, type);
  }
  
}